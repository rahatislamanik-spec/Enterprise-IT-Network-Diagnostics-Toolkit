# Enterprise IT Health Check Toolkit
# Script: System Health Check & HTML Report Generator
# Author: Md Rahat Islam Anik
# Platform: macOS (PowerShell 7+)
# Description: Collects system diagnostics — hostname, OS version, disk usage,
#   network configuration, and connectivity — then exports a clean HTML report
#   ready for ticket documentation, escalation notes, or IT audit evidence.

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host " Enterprise IT Health Check Toolkit  " -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# ── System Information ─────────────────────────────────────────────────────
Write-Host "Collecting system information..." -ForegroundColor Yellow

$computerName = & scutil --get ComputerName 2>/dev/null
$currentUser  = & whoami
$osVersion    = & sw_vers -productVersion
$osBuild      = & sw_vers -buildVersion
$uptimeRaw    = & uptime

# ── Disk Usage ─────────────────────────────────────────────────────────────
Write-Host "Collecting disk usage..." -ForegroundColor Yellow

$diskUsage = (& df -h /) -join "`n"

# ── Network Information ────────────────────────────────────────────────────
Write-Host "Collecting network information..." -ForegroundColor Yellow

# Try en0 first (Wi-Fi), fall back to en1, then any active interface
$ipAddress = & ipconfig getifaddr en0 2>/dev/null
if (-not $ipAddress) {
    $ipAddress = & ipconfig getifaddr en1 2>/dev/null
}
if (-not $ipAddress) {
    $ipAddress = "Not detected"
}

# Default gateway
$gatewayRaw = & bash -c "route -n get default 2>/dev/null | grep gateway"
$gateway    = if ($gatewayRaw) { $gatewayRaw.Trim() } else { "Not detected" }

# DNS servers — parse scutil output
$dnsRaw     = & bash -c "scutil --dns 2>/dev/null | grep 'nameserver\[[0-9]*\]' | head -5"
$dnsServers = if ($dnsRaw) { ($dnsRaw -split "`n" | ForEach-Object { $_.Trim() }) -join "`n" } else { "Not detected" }

# ── Connectivity Test ──────────────────────────────────────────────────────
Write-Host "Running connectivity test..." -ForegroundColor Yellow

$pingRaw  = & ping -c 4 google.com 2>&1
$pingText = ($pingRaw -join "`n")

# Parse packet loss for summary
$lossLine = $pingRaw | Where-Object { $_ -match "packet loss" }
$pingStatus = if ($lossLine -match "0\.0% packet loss") {
    "PASS — 0% packet loss"
} elseif ($lossLine) {
    "WARN — $($lossLine.Trim())"
} else {
    "FAIL — No response"
}

# ── Generate HTML Report ───────────────────────────────────────────────────
$timestamp   = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$reportTitle = "Enterprise IT Health Check Report"

$statusColor = if ($pingStatus -like "PASS*") { "#45d48a" } elseif ($pingStatus -like "WARN*") { "#f2c86d" } else { "#ff6b6b" }

$report = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>$reportTitle</title>
<style>
  body { font-family: 'Segoe UI', Arial, sans-serif; background: #f0f4f8; margin: 0; padding: 24px; color: #1e293b; }
  .header { background: #0078d4; color: white; padding: 24px 28px; border-radius: 10px; margin-bottom: 24px; }
  .header h1 { margin: 0 0 6px; font-size: 1.5rem; }
  .header p  { margin: 0; opacity: 0.85; font-size: 0.9rem; }
  .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 18px; }
  .section { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 1px 4px rgba(0,0,0,.08); }
  .section.full { grid-column: 1 / -1; }
  .section h2 { margin: 0 0 14px; font-size: 1rem; color: #0078d4; border-bottom: 2px solid #e2e8f0; padding-bottom: 8px; }
  .kv { display: flex; flex-direction: column; gap: 8px; }
  .kv-row { display: flex; gap: 10px; font-size: 0.875rem; }
  .kv-label { font-weight: 600; min-width: 140px; color: #475569; }
  .kv-value { color: #1e293b; }
  .status-badge { display: inline-block; padding: 3px 10px; border-radius: 20px; font-size: 0.8rem; font-weight: 600; background: $statusColor; color: white; }
  pre { background: #f8fafc; border: 1px solid #e2e8f0; padding: 14px; border-radius: 6px; font-size: 0.8rem; overflow-x: auto; white-space: pre-wrap; margin: 0; }
  .footer { margin-top: 20px; text-align: center; font-size: 0.78rem; color: #94a3b8; }
</style>
</head>
<body>

<div class="header">
  <h1>Enterprise IT Health Check Report</h1>
  <p>Generated: $timestamp &nbsp;|&nbsp; Author: Md Rahat Islam Anik &nbsp;|&nbsp; Enterprise IT Health Check Toolkit</p>
</div>

<div class="grid">

  <div class="section">
    <h2>System Information</h2>
    <div class="kv">
      <div class="kv-row"><span class="kv-label">Computer Name</span><span class="kv-value">$computerName</span></div>
      <div class="kv-row"><span class="kv-label">Current User</span><span class="kv-value">$currentUser</span></div>
      <div class="kv-row"><span class="kv-label">macOS Version</span><span class="kv-value">$osVersion (Build $osBuild)</span></div>
      <div class="kv-row"><span class="kv-label">Uptime</span><span class="kv-value">$($uptimeRaw.Trim())</span></div>
    </div>
  </div>

  <div class="section">
    <h2>Network Information</h2>
    <div class="kv">
      <div class="kv-row"><span class="kv-label">IP Address (en0)</span><span class="kv-value">$ipAddress</span></div>
      <div class="kv-row"><span class="kv-label">Default Gateway</span><span class="kv-value">$gateway</span></div>
      <div class="kv-row"><span class="kv-label">Connectivity</span><span class="kv-value"><span class="status-badge">$pingStatus</span></span></div>
    </div>
  </div>

  <div class="section full">
    <h2>DNS Servers</h2>
    <pre>$dnsServers</pre>
  </div>

  <div class="section full">
    <h2>Disk Usage</h2>
    <pre>$diskUsage</pre>
  </div>

  <div class="section full">
    <h2>Ping Test — google.com (4 packets)</h2>
    <pre>$pingText</pre>
  </div>

</div>

<div class="footer">Enterprise IT Health Check Toolkit &nbsp;·&nbsp; Md Rahat Islam Anik &nbsp;·&nbsp; $timestamp</div>

</body>
</html>
"@

# ── Export Report ──────────────────────────────────────────────────────────
if (!(Test-Path "./Reports")) {
    New-Item -ItemType Directory -Path "./Reports" | Out-Null
}

$reportPath = "./Reports/system-health-report.html"
$report | Out-File -FilePath $reportPath -Encoding UTF8

Write-Host ""
Write-Host "=====================================" -ForegroundColor Green
Write-Host " Health Check Complete               " -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host "Computer  : $computerName"  -ForegroundColor Cyan
Write-Host "User      : $currentUser"   -ForegroundColor Cyan
Write-Host "macOS     : $osVersion"     -ForegroundColor Cyan
Write-Host "IP        : $ipAddress"     -ForegroundColor Cyan
Write-Host "Network   : $pingStatus"    -ForegroundColor $(if ($pingStatus -like "PASS*") { "Green" } elseif ($pingStatus -like "WARN*") { "Yellow" } else { "Red" })
Write-Host ""
Write-Host "Report saved to: $reportPath" -ForegroundColor Green
