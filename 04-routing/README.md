# 🛣️ Routing & Routing Protocols
## Visual Guide for Presentations

---

## 📌 Key Takeaways

- **Routing = Path selection:** Routers determine the best path for packets to reach their destination.
- **Static vs Dynamic:** Static routes are manually configured; dynamic routes are learned automatically via protocols.
- **Key protocols:** RIP (simple, hop-count), OSPF (link-state, fast), BGP (internet-scale, policy-based).
- **Longest prefix match:** Router selects the most specific route (e.g., /28 over /24).
- **Command Tip:** Use `ip route show` (Linux) or `route print` (Windows) to view the routing table.

---

## 🎯 What is Routing?

**Routing = Finding the Best Path for Data Packets**

```
┌─────────────────────────────────────────────────────────────┐
│                    ROUTING CONCEPT                            │
│                                                              │
│  ┌──────────┐                                              │
│  │  Source  │                                              │
│  │  Device  │                                              │
│  │192.168.1.5│                                              │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ "I want to send data to 10.0.0.5"                │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Router     │                                           │
│  │              │                                           │
│  │  Consults routing table:                                │
│  │  "Which path is best?"                                  │
│  │                                                        │    │
│  │  Path 1: Via Router A (3 hops)                        │    │
│  │  Path 2: Via Router B (2 hops) [+] Best               │    │
│  │  Path 3: Via Router C (5 hops)                        │    │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ Chooses best path                                 │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Router B   │                                           │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────┐                                              │
│  │Destination│                                              │
│  │  Device   │                                              │
│  │ 10.0.0.5  │                                              │
│  └──────────┘                                              │
│                                                              │
│  [+] Router finds optimal path                               │
└─────────────────────────────────────────────────────────────┘
```

---

## 🗺️ Routing Table

### What is a Routing Table?

```
┌─────────────────────────────────────────────────────────────┐
│              ROUTING TABLE STRUCTURE                         │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │ Destination Network │ Gateway      │ Interface   │    │
│  ├────────────────────────────────────────────────────┤    │
│  │ 192.168.1.0/24     │ Direct       │ eth0        │    │
│  │ 10.0.0.0/8          │ 192.168.1.1  │ eth0        │    │
│  │ 172.16.0.0/16       │ 192.168.1.2  │ eth0        │    │
│  │ 0.0.0.0/0           │ 192.168.1.1  │ eth0        │    │
│  │                     │ (Default)    │             │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  How Router Uses Table:                                      │
│  1. Receives packet with destination IP                     │
│  2. Looks up destination in routing table                   │
│  3. Finds matching network (longest prefix match)          │
│  4. Forwards packet to gateway/interface                    │
│                                                              │
│  Example:                                                    │
│  Packet to: 10.0.0.5                                        │
│  → Matches: 10.0.0.0/8                                      │
│  → Gateway: 192.168.1.1                                     │
│  → Interface: eth0                                          │
│  → Forwards to 192.168.1.1                                 │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔀 Static vs Dynamic Routing

### Static Routing

```
┌─────────────────────────────────────────────────────────────┐
│              STATIC ROUTING                                  │
│              (Manually Configured)                            │
│                                                              │
│  ┌──────────┐                                              │
│  │  Router  │                                              │
│  │          │                                              │
│  │  Routes configured manually:                           │
│  │                                                        │    │
│  │  ip route 10.0.0.0/8 via 192.168.1.1                │    │
│  │  ip route 172.16.0.0/16 via 192.168.1.2             │    │
│  │                                                        │    │
│  │  [+] Simple                                            │    │
│  │  [+] Predictable                                       │    │
│  │  [+] No protocol overhead                              │    │
│  │  [!]  Manual configuration                             │    │
│  │  [!]  Doesn't adapt to changes                         │    │
│  └──────────┘                                              │
│                                                              │
│  Use Cases:                                                  │
│  • Small networks                                           │
│  • Simple topologies                                        │
│  • Default routes                                           │
│  • Security-sensitive paths                                 │
└─────────────────────────────────────────────────────────────┘
```

### Dynamic Routing

```
┌─────────────────────────────────────────────────────────────┐
│              DYNAMIC ROUTING                                 │
│              (Automatically Learned)                          │
│                                                              │
│  ┌──────────┐      ┌──────────┐      ┌──────────┐        │
│  │ Router A │      │ Router B │      │ Router C │        │
│  └────┬─────┘      └────┬─────┘      └────┬─────┘        │
│       │                 │                 │                │
│       │ Exchange routing information                      │
│       │                 │                 │                │
│       └─────────────────┼─────────────────┘                │
│                         │                                    │
│                         ▼                                    │
│            ┌──────────────┐                                  │
│            │  Routing     │                                  │
│            │  Protocol    │                                  │
│            │              │                                  │
│            │  • OSPF                                       │
│            │  • BGP                                        │
│            │  • RIP                                        │
│            │  • EIGRP                                      │
│            └──────────────┘                                  │
│                                                              │
│  [+] Automatic updates                                       │
│  [+] Adapts to network changes                              │
│  [+] Scalable                                               │
│  [!]  More complex                                          │
│  [!]  Protocol overhead                                     │
│                                                              │
│  Use Cases:                                                 │
│  • Large networks                                          │
│  • Complex topologies                                      │
│  • Networks that change frequently                         │
└─────────────────────────────────────────────────────────────┘
```

### Comparison Table

```
┌──────────────────┬──────────────────┬──────────────────┐
│ Feature          │ Static Routing   │ Dynamic Routing  │
├──────────────────┼──────────────────┼──────────────────┤
│ Configuration    │ Manual           │ Automatic        │
│ Updates          │ Manual            │ Automatic        │
│ Complexity       │ Simple            │ Complex          │
│ Overhead         │ None              │ Protocol traffic │
│ Scalability      │ Limited           │ High             │
│ Adaptability     │ No                │ Yes              │
│ Use Case         │ Small/Simple      │ Large/Complex    │
│ Security         │ More control      │ Less control     │
└──────────────────┴──────────────────┴──────────────────┘
```

---

## 🌐 Routing Protocols

### RIP (Routing Information Protocol)

```
┌─────────────────────────────────────────────────────────────┐
│              RIP (ROUTING INFORMATION PROTOCOL)              │
│                                                              │
│  ┌──────────┐                                              │
│  │  Router  │                                              │
│  │          │                                              │
│  │  Characteristics:                                       │
│  │  • Distance-vector protocol                            │
│  │  • Uses hop count (max 15 hops)                        │
│  │  • Updates every 30 seconds                            │
│  │  • Simple but limited                                  │
│  │                                                        │    │
│  │  [+] Easy to configure                                  │    │
│  │  [+] Good for small networks                            │    │
│  │  [!]  Slow convergence                                 │    │
│  │  [!]  Limited scalability                              │    │
│  └──────────┘                                              │
│                                                              │
│  Use Cases:                                                  │
│  • Small networks                                           │
│  • Learning/education                                       │
│  • Legacy systems                                           │
└─────────────────────────────────────────────────────────────┘
```

### OSPF (Open Shortest Path First)

```
┌─────────────────────────────────────────────────────────────┐
│              OSPF (OPEN SHORTEST PATH FIRST)                │
│                                                              │
│  ┌──────────┐                                              │
│  │  Router  │                                              │
│  │          │                                              │
│  │  Characteristics:                                       │
│  │  • Link-state protocol                                 │
│  │  • Uses cost (bandwidth-based)                         │
│  │  • Fast convergence                                    │
│  │  • Hierarchical (areas)                                │
│  │                                                        │    │
│  │  [+] Fast convergence                                   │    │
│  │  [+] Scalable                                           │    │
│  │  [+] Supports large networks                            │    │
│  │  [!]  More complex                                      │    │
│  │  [!]  CPU intensive                                    │    │
│  └──────────┘                                              │
│                                                              │
│  OSPF Areas:                                                │
│  ┌────────────────────────────────────────────────────┐    │
│  │  Area 0 (Backbone)                                 │    │
│  │  ────────────────────────────────────────────────    │    │
│  │                                                    │    │
│  │  ┌──────────┐  ┌──────────┐                      │    │
│  │  │ Area 1   │  │ Area 2   │                      │    │
│  │  └──────────┘  └──────────┘                      │    │
│  │                                                    │    │
│  │  [+] Hierarchical design                            │    │
│  │  [+] Reduces routing table size                     │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  Use Cases:                                                  │
│  • Enterprise networks                                      │
│  • Large organizations                                      │
│  • Internal routing                                         │
└─────────────────────────────────────────────────────────────┘
```

### BGP (Border Gateway Protocol)

```
┌─────────────────────────────────────────────────────────────┐
│              BGP (BORDER GATEWAY PROTOCOL)                   │
│                                                              │
│  ┌──────────┐                                              │
│  │  Router  │                                              │
│  │          │                                              │
│  │  Characteristics:                                       │
│  │  • Path-vector protocol                                │
│  │  • Used for internet routing                            │
│  │  • Policy-based routing                                 │
│  │  • Very scalable                                        │
│  │                                                        │    │
│  │  [+] Internet-scale routing                            │    │
│  │  [+] Policy control                                     │    │
│  │  [+] Handles millions of routes                        │    │
│  │  [!]  Complex                                           │    │
│  │  [!]  Slow convergence                                 │    │
│  └──────────┘                                              │
│                                                              │
│  BGP Peering:                                               │
│  ┌────────────────────────────────────────────────────┐    │
│  │  AS 100          AS 200          AS 300          │    │
│  │  ┌──────┐        ┌──────┐        ┌──────┐        │    │
│  │  │Router│◄──────►│Router│◄──────►│Router│        │    │
│  │  └──────┘        └──────┘        └──────┘        │    │
│  │                                                    │    │
│  │  Autonomous Systems exchange routes               │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  Use Cases:                                                  │
│  • Internet service providers                              │
│  • Multi-homed networks                                    │
│  • Large enterprises                                       │
│  • Cloud providers                                         │
└─────────────────────────────────────────────────────────────┘
```

### Protocol Comparison

```
┌──────────────────┬──────────────────┬──────────────────┬──────────────────┐
│ Feature          │ RIP              │ OSPF             │ BGP              │
├──────────────────┼──────────────────┼──────────────────┼──────────────────┤
│ Type             │ Distance-Vector  │ Link-State       │ Path-Vector      │
│ Metric           │ Hop Count        │ Cost             │ Path Attributes  │
│ Convergence      │ Slow             │ Fast             │ Slow             │
│ Scalability      │ Low (15 hops)    │ High             │ Very High        │
│ Use Case         │ Small networks   │ Enterprise       │ Internet         │
│ Complexity       │ Simple           │ Medium           │ Complex          │
│ Updates          │ Periodic         │ Event-driven     │ Event-driven     │
│ Standards        │ RFC 2453        │ RFC 2328         │ RFC 4271         │
└──────────────────┴──────────────────┴──────────────────┴──────────────────┘
```

---

## 🛣️ Routing Process Flow

```
┌─────────────────────────────────────────────────────────────┐
│              ROUTING DECISION PROCESS                        │
│                                                              │
│  Step 1: Packet Arrives                                    │
│  ┌──────────┐                                              │
│  │  Router  │                                              │
│  │          │                                              │
│  │  Receives packet:                                       │
│  │  Destination: 10.0.0.5                                 │
│  └────┬─────┘                                              │
│       │                                                    │
│       │                                                    │
│       ▼                                                    │
│  Step 2: Check Routing Table                               │
│  ┌──────────────┐                                           │
│  │  Routing     │                                           │
│  │  Table       │                                           │
│  │              │                                           │
│  │  Look for: 10.0.0.5                                    │
│  │  Match: 10.0.0.0/8                                      │
│  │  Gateway: 192.168.1.1                                  │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  Step 3: Longest Prefix Match                              │
│  ┌──────────────┐                                           │
│  │  Router      │                                           │
│  │              │                                           │
│  │  If multiple matches:                                   │
│  │  • 10.0.0.0/8 (matches)                                │
│  │  • 10.0.0.0/16 (matches, longer) [+]                   │
│  │  • 0.0.0.0/0 (default, shorter)                        │
│  │                                                        │    │
│  │  Choose longest prefix match                           │    │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  Step 4: Forward Packet                                    │
│  ┌──────────────┐                                           │
│  │  Router      │                                           │
│  │              │                                           │
│  │  Forwards to:                                           │
│  │  • Gateway: 192.168.1.1                                │
│  │  • Interface: eth0                                      │
│  │  • Next hop: Router B                                  │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────┐                                              │
│  │ Next Hop │                                              │
│  │  Router  │                                              │
│  └──────────┘                                              │
│                                                              │
│  [+] Process repeats at each router                         │
└─────────────────────────────────────────────────────────────┘
```

---

## 📋 Prerequisites

Before starting this topic, you should understand:
- IP addressing and subnetting → [See IP Addressing Guide](../01-ip-addressing/)
- Network topology concepts (LANs, WANs)
- Basic understanding of network devices (routers, switches)
- TCP/IP model basics → [See TCP/IP Guide](../02-tcp-ip/)

---

## ⚠️ Common Mistakes

### Mistake 1: Missing Default Route
```
❌ Wrong: No default route configured
✅ Correct: Always have a default route (0.0.0.0/0) for unknown destinations
```

### Mistake 2: Routing Loops
```
❌ Wrong: Router A points to B, B points to A for same destination
✅ Correct: Verify routes don't create loops; use traceroute to test
```

### Mistake 3: Overlapping Routes
```
❌ Wrong: Multiple conflicting routes for same network
✅ Correct: Ensure routes are specific and don't overlap unexpectedly
```

### Mistake 4: Ignoring Administrative Distance
```
❌ Wrong: Assuming all routes have equal priority
✅ Correct: Know AD values: Connected=0, Static=1, OSPF=110, BGP=20/200
```

---

## 🛠️ Command Reference

### Linux Commands
```bash
# View routing table
ip route show
route -n
netstat -rn

# Add static route
ip route add 10.0.0.0/8 via 192.168.1.1
ip route add 10.0.0.0/8 via 192.168.1.1 dev eth0

# Add default route
ip route add default via 192.168.1.1

# Delete route
ip route del 10.0.0.0/8

# Trace route to destination
traceroute 8.8.8.8
tracepath 8.8.8.8
mtr 8.8.8.8

# View routing cache
ip route show cache
```

### Cisco Router Commands
```
! View routing table
show ip route
show ip route summary

! Static route
ip route 10.0.0.0 255.0.0.0 192.168.1.1

! OSPF configuration
router ospf 1
 network 192.168.1.0 0.0.0.255 area 0

! BGP configuration
router bgp 65001
 neighbor 203.0.113.1 remote-as 65002

! Debug routing
debug ip routing
show ip protocols
```

### AWS/Cloud Commands
```bash
# AWS - Create route in route table
aws ec2 create-route \
  --route-table-id rtb-xxx \
  --destination-cidr-block 10.0.0.0/8 \
  --gateway-id igw-xxx

# View routes
aws ec2 describe-route-tables --route-table-ids rtb-xxx
```

---

## 📊 Quick Reference Card

```
ROUTING QUICK REFERENCE
=======================

Routing Types:
  - Static  - Manual, simple, no overhead
  - Dynamic - Automatic, adapts to changes

Dynamic Routing Protocols:
  - RIP   - Distance vector, max 15 hops, simple
  - OSPF  - Link-state, fast convergence, scalable
  - BGP   - Path vector, internet routing, complex

Administrative Distance (lower = preferred):
  Connected = 0    Static = 1    OSPF = 110
  eBGP = 20        iBGP = 200    RIP = 120

Route Selection (in order):
  1. Longest prefix match (most specific)
  2. Lowest administrative distance
  3. Lowest metric

Routing Table Entry:
  Destination | Netmask | Gateway | Interface | Metric

Key Commands:
  ip route show      - View routes (Linux)
  traceroute x.x.x.x - Trace path
  show ip route      - View routes (Cisco)
```

---

## 🎯 Key Takeaways for Presentations

1. **Routing = Path Selection** - Finding best path for packets
2. **Routing Table** - Database of network paths
3. **Static Routing** - Manual configuration, simple but inflexible
4. **Dynamic Routing** - Automatic, adapts to changes
5. **RIP** - Simple, hop-count based, limited scalability
6. **OSPF** - Link-state, fast convergence, enterprise-grade
7. **BGP** - Internet-scale, policy-based, very complex
8. **Longest Prefix Match** - Router selects most specific route

---

## 🧠 Quick Quiz

<details>
<summary><strong>Q1:</strong> What is the main difference between static and dynamic routing?</summary>

**Answer:** Static routes are manually configured; dynamic routes are learned automatically via protocols.
</details>

<details>
<summary><strong>Q2:</strong> Which routing protocol is used for internet-scale routing between autonomous systems?</summary>

**Answer:** BGP (Border Gateway Protocol)

BGP is the protocol that makes the internet work, routing traffic between ISPs and organizations.
</details>

<details>
<summary><strong>Q3:</strong> What does "longest prefix match" mean in routing?</summary>

**Answer:** The router selects the most specific route (highest CIDR number)

For example, /28 is more specific than /24, so the /28 route wins.
</details>

<details>
<summary><strong>Q4:</strong> What is the administrative distance of a directly connected network?</summary>

**Answer:** 0

Connected = 0, Static = 1, OSPF = 110, RIP = 120, BGP = 20 (external).
</details>

---

## 📚 Further Reading

- EIGRP (Enhanced Interior Gateway Routing Protocol)
- Route redistribution
- Route filtering and summarization
- MPLS (Multi-Protocol Label Switching)

---

**Previous:** [NAT](../03-nat/) | **Next:** [VLANs](../05-vlans/)
