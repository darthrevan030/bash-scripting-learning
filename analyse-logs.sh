#!/usr/bin/env bash

LOG_DIR="$(dirname "$0")/logs"
ERROR_PATTERN=("FATAL" "CRITICAL" "ERROR" "WARN" "INFO")
REPORT_FILE="$(date +' %Y-%m-%d')_log_report.txt"

echo "Finding log files modified in the last 24 hours:"
LOG_FILES=$(find "${LOG_DIR}" -name "*.txt" -mtime -1) #command substitution to find log files modified in the last 24 hours
echo "$LOG_FILES"

echo -e "\nAnalysing logs:" > "$REPORT_FILE"
echo "-------------------" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do
    echo -e "\n$(tput sgr0)Processing ${LOG_FILE}..."
    
    for PATTERN in ${ERROR_PATTERN[@]}; do
        if grep -q "${PATTERN}" "${LOG_FILE}"; then
            if [[ "${PATTERN}" == "ERROR" ]]; then
                echo -e "\n$(tput setaf 1)Processing ${LOG_FILE} for pattern '${PATTERN}'..."
                
                echo -e "\nNumber of '${PATTERN}' occurrences in ${LOG_FILE}:" >> "$REPORT_FILE"
                grep -c "${PATTERN}" "${LOG_FILE}" >> "$REPORT_FILE"
                
                echo "'${PATTERN}' lines in ${LOG_FILE}:" >> "$REPORT_FILE"
                grep "${PATTERN}" "${LOG_FILE}" >> "$REPORT_FILE"
            
            elif [[ "${PATTERN}" == "WARN"  ]]; then
                echo -e "\n$(tput setaf 3)Processing ${LOG_FILE} for pattern '${PATTERN}'..."
                
                echo -e "\nNumber of '${PATTERN}' occurrences in ${LOG_FILE}:" >> "$REPORT_FILE"
                grep -c "${PATTERN}" "${LOG_FILE}" >> "$REPORT_FILE"
                
                echo "'${PATTERN}' lines in ${LOG_FILE}:" >> "$REPORT_FILE"
                grep "${PATTERN}" "${LOG_FILE}" >> "$REPORT_FILE"
            fi
        fi
    done
done
echo -e "$(tput setaf 2)\nLog analysis complete."
echo "Report saved to ${REPORT_FILE}"