#!/usr/bin/env bash

LOG_DIR="$(dirname "$0")/logs"
ERROR_PATTERN=("FATAL" "CRITICAL" "ERROR" "WARN" "INFO")
REPORT_FILE="$(date +'%Y-%m-%d')_log_report.txt"

# Associative array to hold running totals for each pattern
declare -A TOTAL_COUNTS
for PATTERN in "${ERROR_PATTERN[@]}"; do
    TOTAL_COUNTS[$PATTERN]=0
done

echo "Starting log analysis..."

echo "Log files modified in the last 24 hours:" > "$REPORT_FILE"
mapfile -t LOG_FILES < <(find "${LOG_DIR}" -name "*.txt" -mtime -1)  # Find .txt files modified in the last 24 hours
printf '%s\n' "${LOG_FILES[@]}" >> "$REPORT_FILE"

echo -e "\nAnalysing logs:" >> "$REPORT_FILE"
echo "-------------------" >> "$REPORT_FILE"

for LOG_FILE in "${LOG_FILES[@]}"; do
    if [[ ${#LOG_FILES[@]} -eq 0 ]]; then
        echo "No log files modified in the last 24 hours." | tee -a "$REPORT_FILE"
        exit 0
    fi

    echo -e "\nProcessing ${LOG_FILE}..." | tee -a "$REPORT_FILE"
    
    for PATTERN in "${ERROR_PATTERN[@]}"; do
        if grep -q "${PATTERN}" "${LOG_FILE}"; then
            echo "Processing ${LOG_FILE} for pattern '${PATTERN}'..."
            
            COUNT=$(grep -c "${PATTERN}" "${LOG_FILE}")
            echo "$COUNT [${PATTERN}] occurrences in ${LOG_FILE}:" | tee -a "$REPORT_FILE"
            TOTAL_COUNTS[$PATTERN]=$((TOTAL_COUNTS[$PATTERN] + COUNT))

            echo -e "'${PATTERN}' lines in ${LOG_FILE}:" >> "$REPORT_FILE"
            grep "${PATTERN}" "${LOG_FILE}" >> "$REPORT_FILE"
        fi
    done
done

echo -e "\nSummary of total occurrences across all logs:" | tee -a "$REPORT_FILE"
for PATTERN in "${ERROR_PATTERN[@]}"; do
    if [ ${TOTAL_COUNTS[$PATTERN]} -gt 0 ]; then
        echo "Total '${PATTERN}' occurrences across all logs: ${TOTAL_COUNTS[$PATTERN]}" | tee -a "$REPORT_FILE"
    fi
done

echo -e "$(tput setaf 2)\nLog analysis complete."
echo "Report saved to ${REPORT_FILE}"