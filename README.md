# Enterprise IT Network Diagnostics Toolkit

### PowerShell · Network Diagnostics · Security Auditing · HTML Reporting · macOS · Git

**Md Rahat Islam Anik · Portfolio Project · 2026**

[![Live Project](https://img.shields.io/badge/Live%20Project-View%20Now-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)](https://rahatislamanik-spec.github.io/Enterprise-IT-Network-Diagnostics-Toolkit/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-rahatislamanik-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/rahatislamanik)
[![GitHub](https://img.shields.io/badge/GitHub-rahatislamanik--spec-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rahatislamanik-spec)

---

| 9 PowerShell Scripts | 8 Retained HTML Reports | 27 Diagnostic Files | 26 Screenshots |
|:---:|:---:|:---:|:---:|

---

## The Problem

Network issues account for the majority of IT helpdesk tickets. Without structured diagnostics, technicians run commands one by one — results scattered, nothing documented, nothing repeatable.

**Manual checks waste time.** Ad-hoc troubleshooting creates inconsistency and slows down triage.

**Reports make support visible.** Clean HTML output creates evidence for tickets, escalation notes, and future comparison.

**Automation shows maturity.** This toolkit demonstrates the mindset of an IT specialist who builds repeatable processes — not just reacts to incidents.

**Security auditing is proactive.** ARP-based device review and port checks help identify unknown devices and suspicious exposure during authorized troubleshooting.

---

## The Solution

A multi-script PowerShell diagnostic toolkit that runs structured network assessments and produces professional HTML reports — ready for ticket documentation, escalation, or handoff.

```
MacBook Air              PowerShell Scripts           Output
─────────────            ──────────────────           ──────────────────────
Network endpoint  →      DNS Resolution         →     HTML Report
IT support call          Connectivity Tests           Ticket evidence
Security audit           Port Scanning                Documentation ready
                         Wi-Fi Diagnostics            Sample output files
                         SSL/TLS Check                Screenshots
                         ARP Device Review             ↓
                         ARP Monitoring          GitHub Repository
                         Traceroute Analysis     Portfolio proof
                         Latency Baseline        Version control
```

---

## Scripts

| # | Script | What It Diagnoses |
|---|---|---|
| 01 | `01-dns-diagnostics.ps1` | DNS resolution, server check, reverse lookups, failure detection |
| 02 | `02-network-connectivity.ps1` | Gateway reachability, internet connectivity, packet loss |
| 03 | `03-port-service-check.ps1` | Critical enterprise ports (HTTP/S, RDP, SMB, SMTP, LDAP, SSH) |
| 04 | `04-wifi-diagnostics.ps1` | SSID, signal strength, RSSI, SNR, channel, band, nearby networks |
| 05 | `05-network-adapter-health.ps1` | All interfaces, IP/MAC addresses, MTU, routing table |
| 06 | `06-traceroute-analysis.ps1` | Hop-by-hop path analysis, latency per hop, timeout detection |
| 07 | `07-ssl-cert-check.ps1` | SSL/TLS certificate expiry, issuer, protocol version |
| 08 | `08-latency-baseline.ps1` | Extended ping, jitter, packet loss %, RTT sparklines |
| 09 | `system-health-check.ps1` | Hostname, OS version, disk usage, IP, DNS, ping test |

All scripts run on **macOS PowerShell 7+** and generate **professional HTML reports**.

---

## Sample Outputs (27 Files)

Real diagnostic data collected from a live network environment — sanitized for privacy.

For a phase-by-phase review, see [`docs/evidence-map.md`](docs/evidence-map.md).

**Network Configuration:** `ifconfig-macos.txt` · `routing-table.txt` · `arp-table.txt` · `gateway-info.txt` · `my-ip.txt` · `interface-traffic.txt`

**DNS Analysis:** `dns-google.txt` · `dns-resolver-config.txt`

**Performance Metrics:** `latency-jitter.txt` · `bandwidth-test.txt` · `traceroute.txt`

**Protocol Statistics:** `tcp-ip-statistics.txt` · `multicast-groups.txt` · `active-connections.txt`

**Security Audits:** `rogue-device-report.txt` · `rogue-detection.txt` · `rogue-devices-arp.txt` · `mac-vendor-lookup.txt` · `gateway-port-scan.txt` · `network-scan.txt` · `all-network-devices.txt` · `active-network-devices.txt` · `mac-addresses.txt` · `port-53-test.txt` · `broadcast-devices.txt` · `nmap-device-discovery.txt`

---

## Tech Stack

| Category | Tools |
|---|---|
| Scripting | PowerShell 7+ |
| Platform | macOS-focused implementation using native macOS networking tools |
| Reporting | HTML file output (self-contained) |
| Network Tools | ping · traceroute · ifconfig · arp · nc · dig · nslookup · nmap |
| Security | ARP monitoring · MAC vendor lookup · authorized port checking |
| Version Control | Git · GitHub |
| Deployment | GitHub Pages |
| Cost | $0 |

---

## Skills Demonstrated

`PowerShell Scripting` · `Network Diagnostics` · `DNS Troubleshooting` · `Port Checking` · `Wi-Fi Analysis` · `SSL/TLS Certificate Management` · `Latency & Jitter Analysis` · `ARP Device Review` · `ARP Monitoring` · `MAC Vendor Lookup` · `HTML Report Generation` · `Git Version Control` · `IT Support Documentation` · `Security Triage` · `macOS Automation`

---

## Scope & Safety Notes

- The scripts and sample outputs were captured from an authorized lab/home network environment.
- Private IP addresses, MAC addresses, DNS resolver IPs, and local host details are retained as evidence of real command output, not production customer data.
- Port checks, ARP review, network discovery, and `nmap` output should only be used on networks where you have permission to troubleshoot or audit.
- The current implementation is macOS-focused. The PowerShell structure can be adapted to Windows/Linux, but several commands rely on macOS tools such as `scutil`, `system_profiler`, `ifconfig`, and `route -n get`.

---

## Live Project

**[rahatislamanik-spec.github.io/Enterprise-IT-Network-Diagnostics-Toolkit](https://rahatislamanik-spec.github.io/Enterprise-IT-Network-Diagnostics-Toolkit/)**

---

## Author

**Md Rahat Islam Anik**
IT Systems Administrator · Network Diagnostics · PowerShell Automation

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin)](https://linkedin.com/in/rahatislamanik)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github)](https://github.com/rahatislamanik-spec)

---

## Visual Evidence

### PowerShell Execution
![PowerShell Start](Screenshots/01-powershell-start.png)
![PowerShell Running](Screenshots/02-powershell-running.png)

### Diagnostic Outputs
![DNS Output](Screenshots/03-dns-output.png)
![Connectivity Test](Screenshots/04-connectivity-output.png)
![Port Scan](Screenshots/05-port-scan.png)

### HTML Reports
![HTML Report](Screenshots/06-html-report.png)
![HTML Browser](Screenshots/07-html-browser.png)

### Network Commands
![Network Commands](Screenshots/08-network-cmds.png)

### Security Auditing
![ARP Device Review](Screenshots/09-rogue-detection.png)
![ARP Scan](Screenshots/10-arp-scan.png)

### Version Control & Repository
![Git History](Screenshots/11-git-history.png)
![GitHub Repo](Screenshots/12-github-repo.png)

### Project Structure
![Sample Outputs](Screenshots/13-sample-outputs.png)
![Security Files](Screenshots/14-security-files.png)
![Project Structure](Screenshots/15-project-structure.png)

### Live Site & Final Repo
![Live Site Browser](Screenshots/16-live-site-browser.png)
![Repo Final Structure](Screenshots/17-repo-final-structure.png)

### Scripts 04 & 05 — Wi-Fi & Network Adapter
![Wi-Fi Script Terminal](Screenshots/18-wifi-script-terminal.png)
![Adapter Routing Table](Screenshots/19-adapter-report-routing.png)
![Adapter Report Top](Screenshots/20-adapter-report-top.png)
![Adapter Report Interfaces](Screenshots/21-adapter-report-interfaces.png)
![Script Progress](Screenshots/22-script-progress.png)

### Scripts 07 & 08 — SSL & Latency Reports
![SSL Certificate Report](Screenshots/23-ssl-report-browser.png)
![Latency Baseline Report](Screenshots/24-latency-report-browser.png)
![HTML Reports Gallery](Screenshots/25-html-reports-gallery.png)
![HTML Report Detail](Screenshots/26-html-report-detail.png)

---

## 🌐 Portfolio Ecosystem

This project is part of a multi-repo enterprise IT portfolio covering the full IT lifecycle.

| Layer | Project | Focus |
|---|---|---|
| 01 — Network Foundation | **You are here** | DNS · Connectivity · Network Diagnostics |
| 02 — User Lifecycle | [Project Arabesque](https://github.com/rahatislamanik-spec/Project-Arabesque) | Onboarding · Offboarding · M365 Automation |
| 03 — Identity & Security | [Enterprise IT Security Operations Toolkit](https://github.com/rahatislamanik-spec/Enterprise-IT-Security-Operations-Toolkit) | Entra ID · Intune · Defender · Zero Trust |
| 04 — M365 Operations | [Meridian Institute M365 Lab](https://github.com/rahatislamanik-spec/Meridian-Institute-M365-Lab) | Exchange · Teams · SharePoint · Purview |

👉 [View Full Portfolio](https://rahatislamanik-spec.github.io/IT-Portfolio-Rahat-Islam-Anik/)
