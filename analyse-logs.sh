#!/usr/bin/env bash

echo "analysing log files for errors and warnings"
echo "---------------------------------------------"

echo "Finding log files modified in the last 24 hours:"
find ./logs -name "*.txt" -mtime -1

echo -e "\nAnalyzing app logs:"
echo "-------------------"
echo "number of errors in app.txt:"
grep -c "ERROR" ./logs/app.txt
echo "error lines in app.txt:"
grep "ERROR" ./logs/app.txt

echo -e "\nnumber of warnings in app.txt:"
grep -c "WARN" ./logs/app.txt
echo "warning lines in app.txt:"
grep "WARN" ./logs/app.txt

echo -e "\nAnalyzing db logs:"
echo "-------------------"
echo -"number of errors in db.txt:"
grep -c "ERROR" ./logs/db.txt
echo  "error lines in db.txt:"
grep "ERROR" ./logs/db.txt

echo -e "\nnumber of warnings in db.txt:"
grep -c "WARN" ./logs/db.txt
echo "warning lines in db.txt:"
grep "WARN" ./logs/db.txt

echo -e "\nAnalyzing redis logs:"
echo "-------------------"
echo "number of errors in redis.txt:"
grep -c "ERROR" ./logs/redis.txt
echo "error lines in redis.txt:"
grep "ERROR" ./logs/redis.txt

echo -e "\nnumber of warnings in redis.txt:"
grep -c "WARN" ./logs/redis.txt
echo "warning lines in redis.txt:"
grep "WARN" ./logs/redis.txt



