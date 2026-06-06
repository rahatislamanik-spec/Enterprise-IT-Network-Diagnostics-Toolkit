# Evidence Map

This map connects the toolkit scripts to retained reports, sample outputs, screenshots, and hiring relevance.

## Artifact Summary

| Artifact | Count | Location |
|---|---:|---|
| PowerShell scripts | 9 | `Scripts/` |
| Retained HTML reports | 8 | `Reports/` |
| Diagnostic sample files | 27 | `Sample-Outputs/` |
| Screenshots | 26 | `Screenshots/` |

## Script Evidence

| Script | Purpose | Retained Evidence | Hiring Relevance |
|---|---|---|---|
| `01-dns-diagnostics.ps1` | DNS resolution, resolver review, reverse lookups | `Reports/01-dns-diagnostics-report.html`, `Sample-Outputs/dns-google.txt`, `Screenshots/03-dns-output.png` | DNS troubleshooting, support documentation |
| `02-network-connectivity.ps1` | Gateway and public host reachability, packet loss, RTT | `Reports/02-network-connectivity-report.html`, `Screenshots/04-connectivity-output.png` | Connectivity triage, escalation evidence |
| `03-port-service-check.ps1` | Port/service availability checks for common enterprise services | `Reports/03-port-service-report.html`, `Screenshots/05-port-scan.png` | Service availability troubleshooting |
| `04-wifi-diagnostics.ps1` | Wi-Fi SSID, RSSI, SNR, channel, and adapter data | `Reports/04-wifi-diagnostics-report.html`, `Sample-Outputs/wifi-status.txt`, `Screenshots/18-wifi-script-terminal.png` | Endpoint/network support |
| `05-network-adapter-health.ps1` | Interface health, IP/MAC/MTU, routing table | `Reports/05-network-adapter-report.html`, `Sample-Outputs/ifconfig-macos.txt`, `Screenshots/20-adapter-report-top.png` | Network configuration review |
| `06-traceroute-analysis.ps1` | Hop-by-hop path and timeout analysis | `Sample-Outputs/traceroute.txt` | Path troubleshooting and ISP/escalation notes |
| `07-ssl-cert-check.ps1` | SSL/TLS certificate expiry and issuer review | `Reports/07-ssl-cert-report.html`, `Screenshots/23-ssl-report-browser.png` | Certificate hygiene and web service support |
| `08-latency-baseline.ps1` | Jitter, packet loss, RTT baseline, sparklines | `Reports/08-latency-baseline-report.html`, `Sample-Outputs/latency-jitter.txt`, `Screenshots/24-latency-report-browser.png` | Performance baseline and trend evidence |
| `system-health-check.ps1` | Host, OS, disk, DNS, IP, and ping summary | `Reports/system-health-report.html` | Helpdesk intake and support handoff |

## Scope Notes

- Retained outputs include private lab/home network values to preserve authentic troubleshooting evidence.
- No production customer data, passwords, API keys, access tokens, or credentials are intentionally included.
- Port checks, ARP review, device discovery, and `nmap` output should only be used on authorized networks.
- Current scripts are macOS-focused because several commands depend on macOS-native tools.
