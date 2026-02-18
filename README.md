# DormBound Pro v2

**DormBound Pro** is a lightweight, high-performance network optimization script designed specifically for competitive gaming in complex dorm environments. It is optimized for "Daisy-Chained" router setups (e.g., A5 -> TL-WR -> C50) to ensure the lowest possible jitter and zero packet fragmentation.

##  Pro Features
* **Multimedia Class Scheduling (MMCSS) Tweak**: Modifies the Windows Registry to prioritize game packets over background Windows tasks.
* **System Responsiveness Optimization**: Sets kernel-level priority to gaming processes to eliminate micro-stutters.
* **Task Offload Bypass**: Forces the CPU to handle packet timing, bypassing cheap Wi-Fi chip processing lag.
* **Daisy-Chain MTU Lock**: Smart-locks MTU to 1400 to prevent fragmentation across multiple router hops.
* **Background Scan Freeze**: Disables Windows Wi-Fi "searching" to kill 500ms+ lag spikes.

##  Quick Start
1. **Right-click** `DormBound.bat` and **Run as Administrator**.
2. Select **[2] STABILITY MODE** for the best performance on daisy-chained routers.
3. Keep the window open while playing.
4. Select **[3] RESTORE NORMAL** when finished to re-enable standard Wi-Fi scanning.

##  Requirements
* Windows 10/11
* Administrative Privileges
* Works with Riot Vanguard & Easy Anti-Cheat (Safe/No Injection).
