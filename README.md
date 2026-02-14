# DormBound# DormBound 
### Network Optimization Utility for High-Density Dorm Environments

**DormBound** is a lightweight, batch-based performance tool designed to stabilize latency in complex dormitory network topologies. It is engineered to solve the "Dorm Jitter" caused by daisy-chained routers (ZTE gateways to TP-Link hallway units) that often struggle with standard Windows networking defaults.

##  Problem it Solves
In a shared dorm network, two major issues destroy gaming performance:
1. **Packet Fragmentation**: Standard 1500 MTU values often clash with dorm router overhead, causing packets to split and lag.
2. **Background Interference**: Windows constantly "scans" for other students' Wi-Fi signals, causing massive ping spikes during matches.

##  Key Features
* **Adaptive MTU Lock**: Forces a fragment-optimized **1428 MTU** for a smoother data flow through the ZTE/TP-Link chain.
* **WLAN Scan Suppression**: Disables background Wi-Fi scanning while active to eliminate jitter.
* **Bandwidth Shield**: Pauses the Windows Update service (`wuauserv`) to protect your 31 Mbps bandwidth.
* **Silent Mode**: Unlike "Live Monitors," this tool applies settings and goes silent to ensure zero "self-inflicted" spikes.

##  How to Use
1. Download `DormBound.bat`.
2. Right-click and **Run as Administrator** (required to modify network interfaces).
3. Select **[1] Smart Game Start** before your session.
4. Select **[2] Restore Normal** when you are finished to resume system updates.

##  Verification
To confirm the optimization is active, run the following in CMD:
```cmd
netsh interface ipv4 show subinterfaces
