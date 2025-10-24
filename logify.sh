#! /bin/bash

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' nginx-access.log | sort -n | uniq -c | sort -nr | head -n 5 | awk '{print $2, "-", $1, "requests" }'
echo -e "\n"

echo "Top 5 response status codes:"
awk '$9 ~ /^[0-9]+$/ { print $9 }' nginx-access.log | sort -nr | uniq -c | sort -nr | head -n 5 | awk '{print $2, "-", $1, "requests"}' 
echo -e "\n"

echo "Top 5 most requested paths:"
awk '{print $7}' nginx-access.log | sort -r | uniq -c | sort -rn | head -n 5 | awk '{printf "%-25s%-3s%-5s%-5s",$2,"-",$1,"requests\n"}'
echo -e "\n"
