#!/usr/bin/env bash

LOG_DIR="$(dirname "$0")/logs"
APP_LOG="app.txt"
DB_LOG="db.txt"
REDIS_LOG="redis.txt"

ERROR_PATTERN=("ERROR" "WARN")

echo "analysing log files for ${ERROR_PATTERN[0]} and ${ERROR_PATTERN[1]} patterns"
echo "---------------------------------------------"

echo "Finding log files modified in the last 24 hours:"
LOG_FILES=$(find "${LOG_DIR}" -name "*.txt" -mtime -1) #command substitution to find log files modified in the last 24 hours
echo "$LOG_FILES"

echo -e "\nAnalysing logs:"
echo "-------------------"

for LOG_FILE in $LOG_FILES; do
    echo -e "\n$(tput sgr0)Processing ${LOG_FILE}..."
    for PATTERN in ${ERROR_PATTERN[@]}; do
        if grep -q "${PATTERN}" "${LOG_FILE}"; then
            
            if [[ "${PATTERN}" == "ERROR" ]]; then
                echo -e "\n$(tput setaf 1)Processing ${LOG_FILE} for pattern '${PATTERN}'..."
                
                echo "Number of '${PATTERN}' occurrences in ${LOG_FILE}:"
                grep -c "${PATTERN}" "${LOG_FILE}"
                
                echo "'${PATTERN}' lines in ${LOG_FILE}:"
                grep "${PATTERN}" "${LOG_FILE}"
            elif [[ "${PATTERN}" == "WARN"  ]]; then
                echo -e "\n$(tput setaf 3)Processing ${LOG_FILE} for pattern '${PATTERN}'..."
                
                echo -e "$(tput setaf 3)Number of '${PATTERN}' occurrences in ${LOG_FILE}:"
                grep -c "${PATTERN}" "${LOG_FILE}"
                
                echo "'${PATTERN}' lines in ${LOG_FILE}:"
                grep "${PATTERN}" "${LOG_FILE}"
            fi
        fi
    done
done
echo -e "$(tput setaf 7)\nLog analysis complete."