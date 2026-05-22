find . -name "*.txt" -mtime -1

grep -c "ERROR" application.txt
grep -c "WARN" application.txt
grep "ERROR" application.txt
grep "WARN" application.txt

grep -c "ERROR" db.txt
grep -c "WARN" db.txt
grep "ERROR" db.txt
grep "WARN" db.txt
