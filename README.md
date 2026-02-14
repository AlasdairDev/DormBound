# DormBound
### Advanced Network Stack Optimizer 

**DormBound** is a precision network utility engineered to reclaim gaming performance in dormitory and high-density residential settings. It optimizes the Windows 11 network layer to bypass common hardware bottlenecks found in shared environments.

---

##  Compatibility
DormBound is designed to be Universal but is specifically "Battle-Tested" for:
* **Hardware**: Verified on MSI Gaming Series (Compatible with all x64 systems).
* **OS**: Optimized for Windows 11.
* **Network**: Router-agnostic; highly effective for ZTE, TP-Link, and Huawei gateways in multi-hop or "Double-NAT" configurations.

---

##  Technical Breakdown

### 1. Heuristic Auto-Adaptability
Features an integrated diagnostic engine that analyzes connection health before deployment. 
* If latency exceeds the **15ms "Sweet Spot"**, the script automatically triggers a **Winsock Reset** to clear the network catalog.

### 2. Packet Fragmentation Mitigation (MTU 1428)
Locks the MTU to **1428** to ensure packets fit through the complex dorm router chain without being split. This preserves the **4ms baseline** during high-traffic periods.

### 3. WLAN Scan Suppression
Disables **WLAN Autoconfig** to prevent the Windows 11 background "Wi-Fi search" that causes massive periodic ping spikes.

### 4. Service Killswitch
Temporarily pauses the **Windows Update Service (wuauserv)** to prevent sudden bandwidth hijacking.

---

##  Usage Instructions
1. Save the script as **DormBound.bat**.
2. Right-click and **Run as Administrator**.
3. Select **[1] Smart Game Start** before launching your game.
4. Select **[2] Restore Normal** to return to system defaults.

