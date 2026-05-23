#!/usr/bin/env bash

find . -name "*.txt" -mtime -1

grep -c "ERROR" ./logs/app_2026-01.txt
grep -c "WARN" ./logs/app_2026-01.txt
grep "ERROR" ./logs/app_2026-01.txt
grep "WARN" ./logs/app_2026-01.txt

grep -c "ERROR" ./logs/app_2026-02.txt
grep -c "WARN" ./logs/app_2026-02.txt
grep "ERROR" ./logs/app_2026-02.txt
grep "WARN" ./logs/app_2026-02.txt

grep -c "ERROR" ./logs/app_2026-03.txt
grep -c "WARN" ./logs/app_2026-03.txt
grep "ERROR" ./logs/app_2026-03.txt
grep "WARN" ./logs/app_2026-03.txt


grep -c "ERROR" ./logs/db_2026-01.txt
grep -c "WARN" ./logs/db_2026-01.txt
grep "ERROR" ./logs/db_2026-01.txt
grep "WARN" ./logs/db_2026-01.txt

grep -c "ERROR" ./logs/redis_2026-02.txt
grep -c "WARN" ./logs/redis_2026-02.txt
grep "ERROR" ./logs/redis_2026-02.txt
grep "WARN" ./logs/redis_2026-02.txt



