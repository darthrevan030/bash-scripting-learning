#!/usr/bin/env bash

echo "analysing log files for errors and warnings"
echo "---------------------------------------------"

echo "Finding log files modified in the last 24 hours:"
find . -name "*.txt" -mtime -1

echo "Analyzing app logs:"
echo "-------------------"
echo "number of errors in app_2026-01.txt:"
grep -c "ERROR" ./logs/app_2026-01.txt
echo "number of warnings in app_2026-01.txt:"
grep -c "WARN" ./logs/app_2026-01.txt
echo "error lines in app_2026-01.txt:"
grep "ERROR" ./logs/app_2026-01.txt
echo "warning lines in app_2026-01.txt:"
grep "WARN" ./logs/app_2026-01.txt

echo "number of errors in app_2026-02.txt:"
grep -c "ERROR" ./logs/app_2026-02.txt
echo "number of warnings in app_2026-02.txt:"
grep -c "WARN" ./logs/app_2026-02.txt
echo "error lines in app_2026-02.txt:"
grep "ERROR" ./logs/app_2026-02.txt
echo "warning lines in app_2026-02.txt:"
grep "WARN" ./logs/app_2026-02.txt

echo "number of errors in app_2026-03.txt:"
grep -c "ERROR" ./logs/app_2026-03.txt
echo "number of warnings in app_2026-03.txt:"
grep -c "WARN" ./logs/app_2026-03.txt
echo "error lines in app_2026-03.txt:"
grep "ERROR" ./logs/app_2026-03.txt
echo "warning lines in app_2026-03.txt:"
grep "WARN" ./logs/app_2026-03.txt

echo "Analyzing db logs:"
echo "-------------------"
echo "number of errors in db_2026-01.txt:"
grep -c "ERROR" ./logs/db_2026-01.txt
echo "number of warnings in db_2026-01.txt:"
grep -c "WARN" ./logs/db_2026-01.txt
echo "error lines in db_2026-01.txt:"
grep "ERROR" ./logs/db_2026-01.txt
echo "warning lines in db_2026-01.txt:"
grep "WARN" ./logs/db_2026-01.txt

echo "Analyzing redis logs:"
echo "-------------------"
echo "number of errors in redis_2026-02.txt:"
grep -c "ERROR" ./logs/redis_2026-02.txt
echo "number of warnings in redis_2026-02.txt:"
grep -c "WARN" ./logs/redis_2026-02.txt
echo "error lines in redis_2026-02.txt:"
grep "ERROR" ./logs/redis_2026-02.txt
echo "warning lines in redis_2026-02.txt:"
grep "WARN" ./logs/redis_2026-02.txt



