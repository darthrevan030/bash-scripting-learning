#!/usr/bin/env bash

LOG_DIR="$(dirname "$0")/logs"
APP_LOG="app.txt"
DB_LOG="db.txt"
REDIS_LOG="redis.txt"

ERROR_PATTERN=("ERROR" "WARN" "INFO")

echo "analysing log files for ${ERROR_PATTERN[0]} and ${ERROR_PATTERN[1]} patterns"
echo "---------------------------------------------"

echo "Finding log files modified in the last 24 hours:"
LOG_FILES=$(find "${LOG_DIR}" -name "*.txt" -mtime -1) #command substitution to find log files modified in the last 24 hours
echo "$LOG_FILES"

echo -e "\nAnalysing logs:"
echo "-------------------"

for LOG_FILE in $LOG_FILES; do
    echo -e "\n$(tput setaf 7)Processing ${LOG_FILE}..."

    echo "$(tput setaf 1)number of ${ERROR_PATTERN[0]} in ${LOG_FILE}:"
    grep -c "${ERROR_PATTERN[0]}" "${LOG_FILE}"
    echo "${ERROR_PATTERN[0]} lines in ${LOG_FILE}:"
    grep "${ERROR_PATTERN[0]}" "${LOG_FILE}"

    echo -e "\n$(tput setaf 3)number of ${ERROR_PATTERN[1]} in ${LOG_FILE}:"
    grep -c "${ERROR_PATTERN[1]}" "${LOG_FILE}"
    echo "${ERROR_PATTERN[1]} lines in ${LOG_FILE}:"
    grep "${ERROR_PATTERN[1]}" "${LOG_FILE}"

done
echo -e "$(tput setaf 7)\nLog analysis complete."