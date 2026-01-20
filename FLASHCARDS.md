# Networking Flashcards

Use these flashcards for spaced repetition learning. Cover the answer and try to recall before revealing!

**How to Use:**
1. Read the question
2. Try to answer before clicking to reveal
3. Review cards at increasing intervals (1 day, 3 days, 1 week, 2 weeks)
4. Import into Anki, Quizlet, or RemNote for digital practice

---

## IP Addressing

<details>
<summary><strong>Q:</strong> What are the three private IP address ranges?</summary>

**A:**
- **10.0.0.0/8** (10.0.0.0 - 10.255.255.255)
- **172.16.0.0/12** (172.16.0.0 - 172.31.255.255)
- **192.168.0.0/16** (192.168.0.0 - 192.168.255.255)
</details>

<details>
<summary><strong>Q:</strong> How do you calculate usable hosts in a subnet?</summary>

**A:** `2^(32-CIDR) - 2`

Example: /24 = 2^8 - 2 = 254 usable hosts

Subtract 2 for network address (all host bits = 0) and broadcast (all host bits = 1).
</details>

<details>
<summary><strong>Q:</strong> What is CIDR notation?</summary>

**A:** Classless Inter-Domain Routing - represents IP + subnet mask in one notation.

Example: `192.168.1.0/24` means:
- IP: 192.168.1.0
- Subnet mask: 255.255.255.0 (first 24 bits are network)
</details>

<details>
<summary><strong>Q:</strong> What command shows IP configuration on Linux?</summary>

**A:** `ip addr` or `ip a`

On Windows: `ipconfig`
</details>

---

## TCP/IP Model

<details>
<summary><strong>Q:</strong> Name the 4 layers of the TCP/IP model.</summary>

**A:**
1. **Application** (HTTP, DNS, SSH, FTP)
2. **Transport** (TCP, UDP)
3. **Internet** (IP, ICMP)
4. **Link/Network Access** (Ethernet, Wi-Fi)
</details>

<details>
<summary><strong>Q:</strong> What are the 3 steps of TCP three-way handshake?</summary>

**A:**
1. **SYN** - Client sends synchronization request
2. **SYN-ACK** - Server acknowledges and sends its own SYN
3. **ACK** - Client acknowledges server's SYN
</details>

<details>
<summary><strong>Q:</strong> TCP vs UDP - key differences?</summary>

**A:**
| TCP | UDP |
|-----|-----|
| Connection-oriented | Connectionless |
| Reliable delivery | No guarantee |
| Ordered packets | Unordered |
| Slower | Faster |
| Web, email, file transfer | Streaming, gaming, DNS |
</details>

<details>
<summary><strong>Q:</strong> What are the common port numbers?</summary>

**A:**
- **22** - SSH
- **80** - HTTP
- **443** - HTTPS
- **53** - DNS
- **3306** - MySQL
- **5432** - PostgreSQL
- **6379** - Redis
</details>

---

## DNS

<details>
<summary><strong>Q:</strong> What are the main DNS record types?</summary>

**A:**
- **A** - Domain → IPv4 address
- **AAAA** - Domain → IPv6 address
- **CNAME** - Alias to another domain
- **MX** - Mail server
- **NS** - Nameserver
- **TXT** - Text records (SPF, DKIM)
- **PTR** - Reverse DNS (IP → domain)
</details>

<details>
<summary><strong>Q:</strong> What is DNS TTL?</summary>

**A:** Time-To-Live - how long (in seconds) a DNS record is cached before re-querying.

- Low TTL (60-300s): Fast propagation, more queries
- High TTL (3600-86400s): Fewer queries, slower updates
</details>

<details>
<summary><strong>Q:</strong> What is the DNS hierarchy?</summary>

**A:**
```
. (Root)
├── .com (TLD)
│   └── google.com (Domain)
│       └── www.google.com (Subdomain)
├── .org
├── .net
└── ...
```
</details>

<details>
<summary><strong>Q:</strong> Command to trace DNS resolution path?</summary>

**A:** `dig +trace example.com`

Shows query through root → TLD → authoritative nameservers.
</details>

---

## NAT

<details>
<summary><strong>Q:</strong> What are the three types of NAT?</summary>

**A:**
- **Static NAT** - 1:1 permanent mapping
- **Dynamic NAT** - Pool of public IPs
- **PAT/NAPT** - Many:1 using ports (most common)
</details>

<details>
<summary><strong>Q:</strong> SNAT vs DNAT?</summary>

**A:**
- **SNAT** (Source NAT) - Modifies source IP (outbound traffic)
- **DNAT** (Destination NAT) - Modifies destination IP (inbound/port forwarding)
</details>

---

## Routing

<details>
<summary><strong>Q:</strong> What is the "longest prefix match" rule?</summary>

**A:** Router selects the most specific route (highest CIDR number).

Example: If routes exist for /24 and /28, the /28 route wins because it's more specific.
</details>

<details>
<summary><strong>Q:</strong> Name 3 dynamic routing protocols.</summary>

**A:**
- **RIP** - Distance vector, simple, max 15 hops
- **OSPF** - Link-state, fast convergence, scalable
- **BGP** - Path vector, internet-scale, policy-based
</details>

---

## Firewalls & Security

<details>
<summary><strong>Q:</strong> Security Group vs Network ACL (AWS)?</summary>

**A:**
| Feature | Security Group | Network ACL |
|---------|---------------|-------------|
| Level | Instance | Subnet |
| Stateful | Yes | No |
| Rules | Allow only | Allow & Deny |
| Evaluation | All rules | Order matters |
</details>

<details>
<summary><strong>Q:</strong> What is the "default deny" principle?</summary>

**A:** Block all traffic by default, only allow what is explicitly needed (whitelist approach).
</details>

---

## Load Balancing

<details>
<summary><strong>Q:</strong> Layer 4 vs Layer 7 load balancing?</summary>

**A:**
- **L4** - Routes by IP/port, faster, TCP/UDP level
- **L7** - Routes by URL/headers/cookies, smarter, HTTP level
</details>

<details>
<summary><strong>Q:</strong> Name 4 load balancing algorithms.</summary>

**A:**
1. **Round Robin** - Equal distribution
2. **Weighted Round Robin** - Distribution by weight
3. **Least Connections** - Fewest active connections
4. **IP Hash** - Same client → same server
</details>

---

## Docker Networking

<details>
<summary><strong>Q:</strong> Name the 5 Docker network drivers.</summary>

**A:**
1. **bridge** - Default, single host
2. **host** - No isolation, uses host network
3. **overlay** - Multi-host (Swarm/K8s)
4. **macvlan** - Container gets MAC on physical network
5. **none** - No networking
</details>

<details>
<summary><strong>Q:</strong> Docker port mapping syntax?</summary>

**A:** `-p HOST:CONTAINER`

Example: `-p 8080:80` maps host port 8080 to container port 80.
</details>

---

## Kubernetes Networking

<details>
<summary><strong>Q:</strong> What are the Kubernetes Service types?</summary>

**A:**
- **ClusterIP** - Internal only (default)
- **NodePort** - Exposes on all nodes (30000-32767)
- **LoadBalancer** - Cloud load balancer
- **ExternalName** - DNS CNAME record
</details>

<details>
<summary><strong>Q:</strong> Kubernetes DNS format for services?</summary>

**A:** `<service>.<namespace>.svc.cluster.local`

Example: `my-svc.default.svc.cluster.local`

Short form (same namespace): `my-svc`
</details>

<details>
<summary><strong>Q:</strong> What is a CNI plugin?</summary>

**A:** Container Network Interface - handles pod networking implementation.

Examples: Calico, Flannel, Cilium, Weave
</details>

---

## Service Mesh

<details>
<summary><strong>Q:</strong> What is a service mesh?</summary>

**A:** Infrastructure layer for service-to-service communication that provides:
- mTLS encryption
- Traffic management (canary, A/B)
- Observability (metrics, tracing)
- Without code changes
</details>

<details>
<summary><strong>Q:</strong> Istio vs Linkerd?</summary>

**A:**
- **Istio** - Feature-rich, complex, enterprise-grade
- **Linkerd** - Simple, lightweight, easy to operate
</details>

---

## Network Troubleshooting

<details>
<summary><strong>Q:</strong> OSI layer troubleshooting order?</summary>

**A:** Start from bottom, work up:
1. **Physical** - Cables, lights, hardware
2. **Data Link** - MAC, switch, ARP
3. **Network** - IP, routing, ping, traceroute
4. **Transport** - TCP/UDP, ports, connections
5. **Application** - DNS, HTTP, logs
</details>

<details>
<summary><strong>Q:</strong> Essential network troubleshooting commands?</summary>

**A:**
- `ping` - Connectivity test
- `traceroute` / `mtr` - Path discovery
- `dig` / `nslookup` - DNS queries
- `ss -tulpn` - Listening ports
- `tcpdump` / `Wireshark` - Packet capture
- `curl -v` - HTTP debugging
</details>

---

## Quick Reference Commands

| Task | Linux | Windows |
|------|-------|---------|
| IP config | `ip addr` | `ipconfig` |
| Routes | `ip route` | `route print` |
| DNS lookup | `dig` | `nslookup` |
| Connections | `ss -tulpn` | `netstat -an` |
| Ping | `ping` | `ping` |
| Trace route | `traceroute` | `tracert` |

---

## Contributing

To add new flashcards:
1. Follow the existing `<details>` format
2. Keep questions concise
3. Provide clear, accurate answers
4. Group by topic
