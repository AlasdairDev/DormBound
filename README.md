# DormBound

### Advanced Network Stack Optimizer for High-Interference Environments

**DormBound** is a precision network utility engineered to reclaim gaming performance in dormitory and high-density residential settings. It optimizes the Windows network layer to bypass common hardware bottlenecks found in shared environments.

---

##  Hardware Compatibility

DormBound is designed to be **router-agnostic**. It improves performance regardless of your gateway hardware, including:

* **Fiber Gateways**: Works with standard ISP units like **ZTE** or **Huawei**.
* **Third-Party Routers**: Optimized for daisy-chained setups involving **TP-Link Archer (A5/C50)**, **ASUS**, or **Tenda** units.
* **Mobile Solutions**: Highly effective for users on **5G Mobile WiFi (SCR-01)** or **Smart Rocket SIM** setups where signal stability is varying.

---

##  Technical Breakdown

### 1. Packet Fragmentation Mitigation (MTU 1428)

In a dorm, your data often travels through a "double-NAT" or daisy-chained router setup. Standard 1500-byte packets often exceed the "Maximum Transmission Unit" of these combined links, forcing the routers to chop up (fragment) your data.

* **The Fix**: DormBound locks your MTU to **1428**.
* **The Result**: Packets flow through the ZTE/TP-Link chain in a single burst, eliminating the micro-stutters and "packet loss" icons in games like *Valorant*.

### 2. WLAN Scan Suppression (Zero Jitter)

Windows background services periodically scan for nearby Wi-Fi signals to update the "Available Networks" list.

* **The Problem**: Every scan causes a massive 200ms+ ping spike as the Wi-Fi card briefly stops processing game data to listen for other routers.
* **The Fix**: DormBound disables **WLAN Autoconfig** while you play.
* **The Result**: 100% stable latency without the "periodic spikes" typical of student housing.

### 3. Bandwidth Reservation (Service Killswitch)

On a **31 Mbps** connection, a single background "Windows Update" or "Telemetry" burst can consume your entire overhead.

* **The Fix**: DormBound pauses the **wuauserv** service and disables **Task Offloading**.
* **The Result**: Your full bandwidth is dedicated to your gaming and Discord apps.

---

##  Usage Instructions

1. **Clone the Repo**: Download `DormBound.bat`.
2. **Elevation**: Right-click and **Run as Administrator** (Required to modify the `netsh` stack).
3. **Deploy**: Select **[1] Smart Game Start**.
4. **Revert**: Select **[2] Restore Normal** after your session to re-enable Windows Updates and standard MTU.

---

##  Performance Verification

After deployment, run the following command in an Admin CMD to verify the "Locked" state:

```cmd
netsh interface ipv4 show subinterfaces

```

*The **Wi-Fi** MTU column should now display **1428**.*

---
