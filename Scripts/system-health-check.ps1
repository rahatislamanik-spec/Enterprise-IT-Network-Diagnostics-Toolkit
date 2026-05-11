# Enterprise IT Health Check Toolkit
# Author: Md Rahat Islam Anik

Write-Host "====================================="
Write-Host " Enterprise IT Health Check Toolkit "
Write-Host "====================================="

# System Information
$computerName = scutil --get ComputerName
$currentUser = whoami
$osVersion = sw_vers -productVersion
$uptime = uptime

# Disk Usage
$diskUsage = df -h /

# Network Information
$ipAddress = ipconfig getifaddr en0
$gateway = route -n get default | grep gateway
$dnsServers = scutil --dns | grep 'nameserver\[[0-9]*\]'

# Ping Test
$pingTest = ping -c 4 google.com

# Report Output
$report = @"
<html>
<head>
<title>Enterprise IT Health Check Report</title>

<style>
body {
    font-family: Arial;
    background-color: #f4f4f4;
    padding: 20px;
}

h1 {
    color: #0078D4;
}

.section {
    background: white;
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 8px;
}

pre {
    background: #eeeeee;
    padding: 10px;
}
</style>

</head>

<body>

<h1>Enterprise IT Health Check Report</h1>

<div class='section'>
<h2>System Information</h2>

<pre>
Computer Name: $computerName
Current User: $currentUser
macOS Version: $osVersion

Uptime:
$uptime
</pre>

</div>

<div class='section'>
<h2>Disk Usage</h2>

<pre>
$diskUsage
</pre>

</div>

<div class='section'>
<h2>Network Information</h2>

<pre>
IP Address: $ipAddress

Gateway:
$gateway

DNS Servers:
$dnsServers
</pre>

</div>

<div class='section'>
<h2>Ping Test</h2>

<pre>
$pingTest
</pre>

</div>

</body>
</html>
"@

# Create Reports Folder if Missing
if (!(Test-Path "./Reports")) {
    New-Item -ItemType Directory -Path "./Reports"
}

# Save Report
$reportPath = "./Reports/system-health-report.html"
$report | Out-File $reportPath

Write-Host ""
Write-Host "Health check completed successfully."
Write-Host "Report saved to: $reportPath"

