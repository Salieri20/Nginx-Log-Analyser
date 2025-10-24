# 🧾 Nginx-Log-Analyser

This project is part of [roadmap.sh](https://roadmap.sh/projects/nginx-log-analyser) DevOps projects
This Bash script analyzes an **Nginx access log** file and provides useful insights such as:
- The top 5 IP addresses making the most requests  
- The top 5 HTTP response status codes  
- The top 5 most requested paths  

It’s a simple yet powerful tool for quickly understanding traffic patterns and user behavior from your web server logs.

---

## 📂 Project Structure

```
.
├── nginx-access.log      # Nginx access log file (input)
└── logify.sh            # Bash script to analyze the log
```

---

## ⚙️ Requirements

- **Bash shell** (any Linux/Unix system)
- **awk**, **sort**, **uniq**, **head**, and **printf** utilities (default on most distributions)
- An **nginx-access.log** file in the same directory as the script

---

## 🚀 Usage

1. Make the script executable:
   ```bash
   chmod +x logify.sh
   ```

2. Run the script:
   ```bash
   ./logify.sh
   ```

3. Example output:
   ```
   Top 5 IP addresses with the most requests:
   192.168.1.10 - 320 requests
   10.0.0.5     - 289 requests
   172.16.2.3   - 233 requests
   ...

   Top 5 response status codes:
   200 - 5740 requests
   404 - 937 requests
   304 - 621 requests
   400 - 192 requests

   Top 5 most requested paths:
   /index.html             - 1250 requests
   /images/logo.png        - 740  requests
   /api/user               - 650  requests
   ...
   ```

---

## 🧠 Script Breakdown

### 🔹 Top 5 IP addresses
```bash
awk '{print $1}' nginx-access.log | sort -n | uniq -c | sort -nr | head -n 5
```
- Extracts the **client IP** (field 1)  
- Sorts and counts unique occurrences  
- Displays the top 5 IPs with the highest number of requests  

---

### 🔹 Top 5 response status codes
```bash
awk '$9 ~ /^[0-9]+$/ { print $9 }' nginx-access.log | sort -nr | uniq -c | sort -nr | head -n 5
```
- Extracts the **status code** (field 9)  
- Filters out non-numeric entries (e.g., “-”)  
- Shows the most frequent status codes  

---

### 🔹 Top 5 most requested paths
```bash
awk '{print $7}' nginx-access.log | sort -r | uniq -c | sort -rn | head -n 5
```
- Extracts the **requested URL path** (field 7)  
- Counts and lists the most accessed paths  

---

## 🧩 Customization

- To analyze a different log file:
  ```bash
  ./logify.sh /path/to/your/nginx-access.log
  ```
  (You can modify the script to accept a filename argument.)

- To show more than 5 results:
  ```bash
  head -n 10
  ```
  instead of `head -n 5`.

---


