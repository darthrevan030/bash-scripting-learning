#!/usr/bin/env bash

LOG_DIR="./logs"
APP_LOG="app.txt"
DB_LOG="db.txt"
REDIS_LOG="redis.txt"

echo "analysing log files for errors and warnings"
echo "---------------------------------------------"

echo "Finding log files modified in the last 24 hours:"
find "${LOG_DIR}" -name "*.txt" -mtime -1

echo -e "\nAnalyzing app logs:"
echo "-------------------"
echo "number of errors in app.txt:"
grep -c "ERROR" "${LOG_DIR}/${APP_LOG}"
echo "error lines in app.txt:"
grep "ERROR" "${LOG_DIR}/${APP_LOG}"

echo -e "\nnumber of warnings in app.txt:"
grep -c "WARN" "${LOG_DIR}/${APP_LOG}"
echo "warning lines in app.txt:"
grep "WARN" "${LOG_DIR}/${APP_LOG}"

echo -e "\nAnalyzing db logs:"
echo "-------------------"
echo -"number of errors in db.txt:"
grep -c "ERROR" "${LOG_DIR}/${DB_LOG}"
echo  "error lines in db.txt:"
grep "ERROR" "${LOG_DIR}/${DB_LOG}"

echo -e "\nnumber of warnings in db.txt:"
grep -c "WARN" "${LOG_DIR}/${DB_LOG}"
echo "warning lines in db.txt:"
grep "WARN" "${LOG_DIR}/${DB_LOG}"

echo -e "\nAnalyzing redis logs:"
echo "-------------------"
echo "number of errors in redis.txt:"
grep -c "ERROR" "${LOG_DIR}/${REDIS_LOG}"
echo "error lines in redis.txt:"
grep "ERROR" "${LOG_DIR}/${REDIS_LOG}"

echo -e "\nnumber of warnings in redis.txt:"
grep -c "WARN" "${LOG_DIR}/${REDIS_LOG}"
echo "warning lines in redis.txt:"
grep "WARN" "${LOG_DIR}/${REDIS_LOG}"



