# 🌐 Networking Visualized

> **Master networking concepts through visual diagrams, practical examples, and hands-on commands**

**From IP Addresses to Service Mesh — Everything You Need to Know**

```
┌──────────────────────────────────────────────────────────────────────────┐
│                                                                          │
│  FUNDAMENTALS                                                            │
│  IP Addressing → TCP/IP → NAT → Routing → VLANs → IPv6                   │
│                                    │                                     │
│  APPLICATIONS                      ▼                                     │
│  HTTP/HTTPS → DNS → Firewalls → Load Balancing → Proxies → CDN          │
│                                    │                                     │
│  ADVANCED                          ▼                                     │
│  VPN → Docker Networking → Kubernetes → Monitoring → Service Mesh       │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

## 📋 Overview

A comprehensive visual guide covering **17 networking topics** from fundamentals to advanced concepts. Each topic includes:

| Feature | Description |
|---------|-------------|
| 📊 **Visual Diagrams** | ASCII art architecture and flow diagrams |
| 📋 **Prerequisites** | What you need to know before each topic |
| ⚠️ **Common Mistakes** | Pitfalls to avoid with correct approaches |
| 🛠️ **Command Reference** | Linux, Windows, and cloud CLI commands |
| 📝 **Quick Reference Cards** | At-a-glance summary for each topic |
| 🎯 **Key Takeaways** | Essential points to remember |

### Who Is This For?

- 🎓 **Students** learning networking fundamentals
- 💻 **DevOps Engineers** working with cloud infrastructure
- 🔧 **System Administrators** managing networks
- ☁️ **Cloud Engineers** designing VPCs and connectivity
- 🚀 **SREs** troubleshooting production issues

---

## 📚 Topics Covered

### 1. [IP Addressing & Subnetting](./01-ip-addressing/)
**Visual Guide to IP Addresses and Network Division**

- IP address format and binary representation
- Private vs Public IP addresses
- IP address classes (A, B, C)
- Subnetting with visual examples
- CIDR notation explained
- AWS VPC subnetting examples

**Key Visuals:**
- Binary to decimal conversion diagrams
- Subnet mask breakdowns
- Network segmentation examples
- DevOps use cases

---

### 2. [TCP/IP & OSI Model](./02-tcp-ip/)
**Understanding Network Layers**

- OSI Model (7 layers) with detailed breakdown
- TCP/IP Model (4 layers)
- Data encapsulation and decapsulation flows
- TCP vs UDP comparison
- Port numbers and their uses
- Container and Kubernetes networking

**Key Visuals:**
- Layer-by-layer architecture diagrams
- Data flow through layers
- TCP handshake visualization
- Port mapping examples

---

### 3. [NAT (Network Address Translation)](./03-nat/)
**IP Address Translation**

- Static NAT vs Dynamic NAT
- PAT (Port Address Translation)
- SNAT vs DNAT
- NAT traversal
- Cloud NAT (AWS, Azure, GCP)

**Key Visuals:**
- NAT flow diagrams
- Before/after IP mapping
- Cloud NAT architectures

---

### 4. [Routing & Routing Protocols](./04-routing/)
**Finding the Best Path**

- Static vs Dynamic routing
- Routing tables
- BGP (Border Gateway Protocol)
- OSPF (Open Shortest Path First)
- RIP (Routing Information Protocol)

**Key Visuals:**
- Routing path diagrams
- Protocol comparison
- Routing decision flows

---

### 5. [VLANs (Virtual LANs)](./05-vlans/)
**Logical Network Segmentation**

- VLAN concepts and benefits
- VLAN tagging (802.1Q)
- Trunk ports vs Access ports
- Inter-VLAN routing
- Network segmentation

**Key Visuals:**
- VLAN topology diagrams
- Tagging process flows
- Port type comparisons

---

### 6. [IPv6 Deep Dive](./06-ipv6/)
**Next Generation IP Addressing**

- IPv6 addressing format
- IPv6 vs IPv4 comparison
- IPv6 transition mechanisms
- IPv6 routing
- Address compression

**Key Visuals:**
- IPv6 address breakdown
- Transition scenarios
- Address format examples

---

### 7. [HTTP/HTTPS & Web Protocols](./07-http-https/)
**Web Communication Protocols**

- HTTP request/response cycle
- HTTPS and SSL/TLS encryption
- HTTP methods and status codes
- Headers and cookies
- RESTful API concepts
- Web security best practices

**Key Visuals:**
- Request/response flow diagrams
- SSL/TLS handshake process
- HTTP header structure
- API interaction examples

---

### 8. [DNS (Domain Name System)](./08-dns/)
**The Phonebook of the Internet**

- DNS hierarchy and architecture
- DNS resolution flow (step-by-step)
- DNS record types (A, AAAA, CNAME, MX, NS, TXT)
- DNS caching layers
- Real-world DNS scenarios
- AWS Route53 and Kubernetes DNS

**Key Visuals:**
- DNS query flow diagrams
- Record type examples
- Caching mechanism visualization
- Troubleshooting command reference

---

### 9. [Firewalls & Security Groups](./09-firewalls/)
**Network Security Fundamentals**

- Firewall types and architectures
- Security group rules
- Network ACLs
- Stateful vs Stateless firewalls
- Cloud security groups (AWS, Azure, GCP)
- Best practices

**Key Visuals:**
- Firewall rule flow diagrams
- Security group examples
- Network segmentation
- Attack prevention strategies

---

### 10. [Load Balancing](./10-load-balancing/)
**Distributing Traffic Across Servers**

- Load balancing algorithms (Round Robin, Least Connections, etc.)
- Layer 4 vs Layer 7 load balancing
- High availability setups
- Health checks and failover
- AWS ALB and NGINX examples
- Microservices load balancing

**Key Visuals:**
- Algorithm comparison diagrams
- Architecture patterns
- Health check mechanisms
- Cloud load balancer configurations

---

### 11. [Proxies & Reverse Proxies](./11-proxies/)
**Intermediary Servers**

- Forward proxies vs Reverse proxies
- Proxy use cases
- Caching proxies
- SSL termination
- Load balancing with proxies
- NGINX and HAProxy examples

**Key Visuals:**
- Proxy flow diagrams
- Forward vs Reverse comparison
- Caching mechanisms
- Configuration examples

---

### 12. [CDN (Content Delivery Network)](./12-cdn/)
**Global Content Distribution**

- CDN architecture
- Edge server locations
- Caching strategies
- Origin servers
- Cloud CDN solutions (CloudFront, Cloudflare)
- Performance optimization

**Key Visuals:**
- CDN network topology
- Request routing flows
- Cache hit/miss scenarios
- Geographic distribution

---

### 13. [VPN & Tunneling](./13-vpn-tunneling/)
**Secure Remote Access**

- VPN types and protocols
- Tunneling mechanisms
- Site-to-site VPNs
- Remote access VPNs
- Cloud VPN solutions
- Encryption and authentication

**Key Visuals:**
- VPN architecture diagrams
- Tunneling process flows
- Protocol comparison
- Cloud VPN setups

---

### 14. [Docker Networking](./14-docker-networking/)
**Container Network Models**

- Docker network types (bridge, host, overlay)
- Container communication
- Port mapping
- Docker Compose networking
- Multi-host networking
- Network isolation

**Key Visuals:**
- Docker network architectures
- Container communication flows
- Port mapping examples
- Network isolation diagrams

---

### 15. [Kubernetes Networking](./15-kubernetes-networking/)
**Container Orchestration Networking**

- Pod networking
- Service networking
- Ingress controllers
- CNI plugins
- Network policies
- Service mesh concepts

**Key Visuals:**
- Kubernetes network architecture
- Pod-to-pod communication
- Service discovery flows
- Ingress routing examples

---

### 16. [Network Monitoring & Troubleshooting](./16-network-monitoring/)
**Network Visibility and Problem Solving**

- Network monitoring tools (Wireshark, tcpdump)
- Packet analysis
- Network troubleshooting methodology
- Common network issues and solutions
- Performance metrics

**Key Visuals:**
- Troubleshooting flowcharts
- Packet capture examples
- Monitoring dashboards

---

### 17. [Service Mesh](./17-service-mesh/)
**Advanced Microservices Networking**

- Service mesh architecture
- Istio vs Linkerd comparison
- mTLS (mutual TLS)
- Traffic management
- Observability

**Key Visuals:**
- Service mesh architecture
- Sidecar pattern diagrams
- Traffic flow examples

---

## 🎓 Learning Path

### For Beginners
```
1. IP Addressing & Subnetting
   ↓
2. TCP/IP & OSI Model
   ↓
3. NAT (Network Address Translation)
   ↓
4. Routing & Routing Protocols
   ↓
5. HTTP/HTTPS & Web Protocols
   ↓
6. DNS
```

### For Intermediate/DevOps Engineers
```
1. Quick review of IP Addressing & NAT
   ↓
2. Firewalls & Security Groups
   ↓
3. Load Balancing (deep dive)
   ↓
4. Docker Networking
   ↓
5. Kubernetes Networking
```

### For Cloud Engineers
```
1. IP Addressing & Subnetting (VPC focus)
   ↓
2. NAT (Cloud NAT Gateway)
   ↓
3. Load Balancing (Cloud ALB/NLB)
   ↓
4. Firewalls & Security Groups (Cloud-specific)
   ↓
5. VPN & Tunneling (Cloud VPN)
   ↓
6. CDN (CloudFront/Cloudflare)
```

---

## 📊 Visual Elements Included

Each topic includes:

- **Architecture Diagrams** - Visual representations of concepts
- **Flow Charts** - Step-by-step processes
- **Comparison Tables** - Side-by-side feature comparison
- **Real-World Examples** - Practical scenarios
- **Code Examples** - Configuration snippets
- **Troubleshooting Guides** - Common issues and solutions
- **Quick Reference Cards** - Summary tables

---

## 🔗 Original Repository

Based on: [iam-veeramalla/a-to-z-of-networking](https://github.com/iam-veeramalla/a-to-z-of-networking)

This enhanced version adds:
- Visual diagrams and flows
- Presentation-ready formatting
- More detailed DevOps examples
- Step-by-step visual guides
- Comparison tables and quick references

---

## 📚 Additional Resources

### Books
- "Computer Networks" by Andrew Tanenbaum
- "TCP/IP Illustrated" by W. Richard Stevens

### Online Courses
- Cisco Networking Academy
- AWS Networking Fundamentals
- Kubernetes Networking Deep Dive

### Tools
- Wireshark (Network analysis)
- tcpdump (Packet capture)
- netstat/ss (Network statistics)
- dig/nslookup (DNS tools)

---

## 🎯 Quick Navigation

| Topic | Visual Focus | DevOps Focus |
|-------|-------------|--------------|
| [IP Addressing](./01-ip-addressing/) | Binary diagrams, Subnetting | AWS VPC |
| [TCP/IP & OSI](./02-tcp-ip/) | Layer diagrams, Flows | Container networking |
| [NAT](./03-nat/) | Translation flows | Cloud NAT |
| [Routing](./04-routing/) | Path selection | BGP, OSPF |
| [VLANs](./05-vlans/) | Segmentation | 802.1Q tagging |
| [IPv6](./06-ipv6/) | Address format | Transition |
| [HTTP/HTTPS](./07-http-https/) | Request/Response flows | API Gateway |
| [DNS](./08-dns/) | Query flows, Hierarchy | Route53, CoreDNS |
| [Firewalls](./09-firewalls/) | Rule flows | Security Groups |
| [Load Balancing](./10-load-balancing/) | Algorithm diagrams | ALB, NGINX |
| [Proxies](./11-proxies/) | Proxy flows | Reverse proxies |
| [CDN](./12-cdn/) | Distribution maps | CloudFront |
| [VPN](./13-vpn-tunneling/) | Tunnel diagrams | Cloud VPN |
| [Docker](./14-docker-networking/) | Network types | Docker Compose |
| [Kubernetes](./15-kubernetes-networking/) | Pod networking | CNI, Ingress |
| [Monitoring](./16-network-monitoring/) | Troubleshooting | Wireshark |
| [Service Mesh](./17-service-mesh/) | Sidecar pattern | Istio, Linkerd |

---

**Happy Learning! 🎉**
