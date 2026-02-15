# DormBound v1.0.0
### Advanced Network Stack Optimizer for Windows 11 & MSI Systems

**DormBound** is a specialized network utility designed to stabilize latency in high-density dormitory environments. It optimizes the Windows 11 network layer to bypass common hardware bottlenecks found in shared router chains (e.g., ZTE gateways to TP-Link hallway units).

---

##  Compatibility
- **Hardware**: Optimized for **MSI Gaming Laptops** (Compatible with all x64 systems).
- **OS**: **Windows 11** (Optimized for Windows Terminal).
- Network:

    - Fiber: Specifically tuned for 31+ Mbps symmetrical-leaning fiber lines.

    - Pocket Wi-Fi: Optimized for 4G LTE/5G Mobile Hotspots to stabilize jitter and prevent packet loss caused by cellular data deprioritization.

---

##  Optimization Modes

| Mode | MTU | Purpose |
| :--- | :--- | :--- |
| **Balanced** | **1428** | Best for quiet hours. Maximizes download speed while maintaining low jitter. |
| **Stability** | **1400** | Best for "Peak Hours." Forces smaller packets to prevent bufferbloat and 40ms+ lag spikes. |

---

##  Key Technical Features
* **Heuristic Analysis**: Detects network jitter before gaming; triggers an automatic **Winsock Reset** if latency exceeds a **15ms "Sweet Spot"**.
* **Scan Suppression**: Disables Windows 11 background Wi-Fi scanning (WLAN Autoconfig) to eliminate periodic 200ms spikes.
* **Service Lock**: Pauses the Windows Update service (`wuauserv`) to prevent background bandwidth hijacking.
* **Fragment Control**: Uses aggressive MTU locking to ensure packets fit through multi-hop dorm router headers without splitting.

---

##  How to Use
1. Download `DormBound.bat`.
2. **Right-click** and select **"Run as Administrator"**.
3. Choose **[1] Balanced** or **[2] Stability** based on your current dorm traffic.
4. Run **[3] Restore Normal** when you are finished gaming to resume standard Windows services.

