#!/usr/bin/env bash

LOG_DIR="$(dirname "$0")/logs"
APP_LOG="app.txt"
DB_LOG="db.txt"
REDIS_LOG="redis.txt"

ERROR_PATTERN=("ERROR" "WARN" "INFO")

echo "analysing log files for errors and warnings"
echo "---------------------------------------------"

echo "Finding log files modified in the last 24 hours:"
LOG_FILES=$(find "${LOG_DIR}" -name "*.txt" -mtime -1) #command substitution to find log files modified in the last 24 hours
echo "$LOG_FILES"

echo -e "\nAnalyzing app logs:"
echo "-------------------"
echo "$(tput setaf 1)number of ${ERROR_PATTERN[0]} in app.txt:"
grep -c "${ERROR_PATTERN[0]}" "${LOG_DIR}/${APP_LOG}"
echo "error lines in app.txt:"
grep "${ERROR_PATTERN[0]}" "${LOG_DIR}/${APP_LOG}"

echo -e "\n$(tput setaf 3)number of ${ERROR_PATTERN[1]} in app.txt:"
grep -c "${ERROR_PATTERN[1]}" "${LOG_DIR}/${APP_LOG}"
echo "warning lines in app.txt:"
grep "${ERROR_PATTERN[1]}" "${LOG_DIR}/${APP_LOG}"

echo -e "$(tput setaf 7)\nAnalyzing db logs:"
echo "-------------------"
echo "$(tput setaf 1)number of ${ERROR_PATTERN[0]} in db.txt:"
grep -c "${ERROR_PATTERN[0]}" "${LOG_DIR}/${DB_LOG}"
echo "error lines in db.txt:"
grep "${ERROR_PATTERN[0]}" "${LOG_DIR}/${DB_LOG}"

echo -e "\n$(tput setaf 3)number of ${ERROR_PATTERN[1]} in db.txt:"
grep -c "${ERROR_PATTERN[1]}" "${LOG_DIR}/${DB_LOG}"
echo "warning lines in db.txt:"
grep "${ERROR_PATTERN[1]}" "${LOG_DIR}/${DB_LOG}"

echo -e "$(tput setaf 7)\nAnalyzing redis logs:"
echo "-------------------"
echo "$(tput setaf 1)number of ${ERROR_PATTERN[0]} in redis.txt:"
grep -c "${ERROR_PATTERN[0]}" "${LOG_DIR}/${REDIS_LOG}"
echo "error lines in redis.txt:"
grep "${ERROR_PATTERN[0]}" "${LOG_DIR}/${REDIS_LOG}"

echo -e "\n$(tput setaf 3)number of ${ERROR_PATTERN[1]} in redis.txt:"
grep -c "${ERROR_PATTERN[1]}" "${LOG_DIR}/${REDIS_LOG}"
echo "warning lines in redis.txt:"
grep "${ERROR_PATTERN[1]}" "${LOG_DIR}/${REDIS_LOG}"

echo -e "$(tput setaf 7)\nLog analysis complete."
