#! /bin/bash

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' nginx-access.log | sort -n | uniq -c | sort -nr | head -n 5 | awk '{print $2, "-", $1, "requests" }'

