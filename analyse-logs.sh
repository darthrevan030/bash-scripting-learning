#!/usr/bin/env bash

find . -name "*.txt" -mtime -1

grep -c "ERROR" app_2026-01.txt
grep -c "WARN" app_2026-01.txt
grep "ERROR" app_2026-01.txt
grep "WARN" app_2026-01.txt

grep -c "ERROR" app_2026-02.txt
grep -c "WARN" app_2026-02.txt
grep "ERROR" app_2026-02.txt
grep "WARN" app_2026-02.txt

grep -c "ERROR" app_2026-03.txt
grep -c "WARN" app_2026-03.txt
grep "ERROR" app_2026-03.txt
grep "WARN" app_2026-03.txt


grep -c "ERROR" db_2026-01.txt
grep -c "WARN" db_2026-01.txt
grep "ERROR" db_2026-01.txt
grep "WARN" db_2026-01.txt

grep -c "ERROR" redis_2026-02.txt
grep -c "WARN" redis_2026-02.txt
grep "ERROR" redis_2026-02.txt
grep "WARN" redis_2026-02.txt



