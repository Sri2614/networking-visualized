# 🔄 Proxies & Reverse Proxies
## Visual Guide for Presentations

---

## 📌 Key Takeaways

- **Proxy = Intermediary:** Sits between client and server to add security, caching, or control.
- **Forward proxy:** Represents clients (hides client IP, content filtering, corporate access control).
- **Reverse proxy:** Represents servers (hides backend, SSL termination, load balancing, caching).
- **Key headers:** `X-Forwarded-For` preserves original client IP through proxy chains.
- **Command Tip:** Use `curl -x http://proxy:8080 http://example.com` to route requests through a proxy.

---

## 🎯 What is a Proxy?

**Proxy = Intermediary Server**

```
┌─────────────────────────────────────────────────────────────┐
│                    WITHOUT PROXY                             │
│                                                              │
│  ┌──────────┐                                              │
│  │  Client  │                                              │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ Direct connection                                  │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Internet   │                                           │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Server     │                                           │
│  └──────────────┘                                           │
│                                                              │
│  [!]  Client IP visible to server                            │
│  [!]  No caching                                             │
│  [!]  No filtering                                            │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                    WITH PROXY                                │
│                                                              │
│  ┌──────────┐                                              │
│  │  Client  │                                              │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ Request to proxy                                  │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Proxy     │                                           │
│  │   Server    │                                           │
│  │             │                                           │
│  │  • Receives request                                    │
│  │  • Forwards to server                                  │
│  │  • Returns response                                    │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ Request on behalf of client                      │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Server     │                                           │
│  │             │                                           │
│  │  Sees proxy IP, not client IP                         │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ Response                                           │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Proxy     │                                           │
│  │   Server    │                                           │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────┐                                              │
│  │  Client  │                                              │
│  └──────────┘                                              │
│                                                              │
│  [+] Client IP hidden                                        │
│  [+] Caching possible                                        │
│  [+] Content filtering                                       │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔄 Forward Proxy vs Reverse Proxy

### Forward Proxy (Client-Side)

```
┌─────────────────────────────────────────────────────────────┐
│              FORWARD PROXY                                   │
│              (Client-Side Proxy)                             │
│                                                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                │
│  │  Client  │  │  Client  │  │  Client  │                │
│  │  1       │  │  2       │  │  3       │                │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘                │
│       │             │             │                        │
│       │             │             │                        │
│       └─────────────┼─────────────┘                        │
│                     │                                        │
│                     │ Requests                               │
│                     │                                        │
│                     ▼                                        │
│            ┌──────────────┐                                  │
│            │   Forward    │                                  │
│            │   Proxy      │                                  │
│            │              │                                  │
│            │  Acts on behalf of clients                    │
│            └──────┬───────┘                                  │
│                   │                                          │
│                   │ Forwards requests                        │
│                   │                                          │
│                   ▼                                          │
│            ┌──────────────┐                                  │
│            │   Internet   │                                  │
│            │   Servers    │                                  │
│            └──────────────┘                                  │
│                                                              │
│  Use Cases:                                                  │
│  [+] Hide client IP addresses                                │
│  [+] Bypass geo-restrictions                                 │
│  [+] Content filtering (corporate)                           │
│  [+] Caching frequently accessed content                     │
│  [+] Anonymity                                               │
└─────────────────────────────────────────────────────────────┘
```

### Reverse Proxy (Server-Side)

```
┌─────────────────────────────────────────────────────────────┐
│              REVERSE PROXY                                   │
│              (Server-Side Proxy)                              │
│                                                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                │
│  │  Client  │  │  Client  │  │  Client  │                │
│  │  1       │  │  2       │  │  3       │                │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘                │
│       │             │             │                        │
│       │             │             │                        │
│       └─────────────┼─────────────┘                        │
│                     │                                        │
│                     │ Requests                               │
│                     │                                        │
│                     ▼                                        │
│            ┌──────────────┐                                  │
│            │   Reverse    │                                  │
│            │   Proxy      │                                  │
│            │              │                                  │
│            │  Acts on behalf of servers                     │
│            └──────┬───────┘                                  │
│                   │                                          │
│                   │ Routes to backend servers                │
│                   │                                          │
│         ┌─────────┼─────────┐                               │
│         │         │         │                               │
│         ▼         ▼         ▼                               │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐                   │
│  │ Backend  │ │ Backend  │ │ Backend  │                   │
│  │ Server 1 │ │ Server 2 │ │ Server 3 │                   │
│  └──────────┘ └──────────┘ └──────────┘                   │
│                                                              │
│  Use Cases:                                                  │
│  [+] Load balancing                                           │
│  [+] SSL/TLS termination                                      │
│  [+] Caching static content                                    │
│  [+] Hiding backend server details                            │
│  [+] Compression                                              │
│  [+] Security (WAF)                                           │
└─────────────────────────────────────────────────────────────┘
```

### Comparison Table

```
┌──────────────────┬──────────────────┬──────────────────┐
│ Feature          │ Forward Proxy    │ Reverse Proxy    │
├──────────────────┼──────────────────┼──────────────────┤
│ Location         │ Client side      │ Server side      │
│ Represents       │ Clients          │ Servers          │
│ Client Awareness │ Knows proxy     │ Doesn't know     │
│ Server Awareness │ Doesn't know    │ Knows proxy      │
│ Use Case         │ Anonymity, filter│ Load balance, SSL│
│ Example          │ Corporate proxy │ NGINX, HAProxy   │
└──────────────────┴──────────────────┴──────────────────┘
```

---

## 🔄 Reverse Proxy Functions

### Load Balancing

```
┌─────────────────────────────────────────────────────────────┐
│              REVERSE PROXY: LOAD BALANCING                   │
│                                                              │
│  ┌──────────┐                                              │
│  │  Client  │                                              │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ Request to example.com                            │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Reverse   │                                           │
│  │   Proxy      │                                           │
│  │  (NGINX)     │                                           │
│  │              │                                           │
│  │  Load balancing algorithm:                           │
│  │  • Round Robin                                          │
│  │  • Least Connections                                   │
│  │  • IP Hash                                              │
│  └──────┬───────┘                                           │
│         │                                                    │
│    ┌────┴────┐                                              │
│    │         │                                              │
│    ▼         ▼                                              │
│  ┌─────┐  ┌─────┐                                           │
│  │App  │  │App  │                                           │
│  │Server│ │Server│                                           │
│  │  1  │  │  2  │                                           │
│  └─────┘  └─────┘                                           │
│                                                              │
│  [+] Distributes load across servers                         │
│  [+] High availability                                       │
│  [+] Health checks                                           │
└─────────────────────────────────────────────────────────────┘
```

### SSL/TLS Termination

```
┌─────────────────────────────────────────────────────────────┐
│              REVERSE PROXY: SSL TERMINATION                  │
│                                                              │
│  ┌──────────┐                                              │
│  │  Client  │                                              │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ HTTPS (Encrypted)                                  │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Reverse   │                                           │
│  │   Proxy      │                                           │
│  │              │                                           │
│  │  • Receives HTTPS                                      │
│  │  • Decrypts (SSL termination)                         │
│  │  • Forwards HTTP to backend                           │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ HTTP (Unencrypted, internal)                     │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Backend   │                                           │
│  │   Server    │                                           │
│  │             │                                           │
│  │  Receives plain HTTP                                   │
│  │  (No SSL overhead)                                    │
│  └──────────────┘                                           │
│                                                              │
│  Benefits:                                                   │
│  [+] Centralized certificate management                     │
│  [+] Reduced backend server load                            │
│  [+] Easier certificate updates                              │
└─────────────────────────────────────────────────────────────┘
```

### Caching

```
┌─────────────────────────────────────────────────────────────┐
│              REVERSE PROXY: CACHING                         │
│                                                              │
│  Request Flow:                                              │
│                                                              │
│  ┌──────────┐                                              │
│  │  Client  │ Request for /static/image.jpg              │
│  └────┬─────┘                                              │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Reverse   │                                           │
│  │   Proxy      │                                           │
│  │              │                                           │
│  │  Check cache:                                           │
│  │  • Cache hit? [+] → Return cached content               │
│  │  • Cache miss? [X] → Forward to backend                │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ Cache miss                                        │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Backend   │                                           │
│  │   Server    │                                           │
│  │             │                                           │
│  │  Returns content                                       │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ Response                                          │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Reverse   │                                           │
│  │   Proxy      │                                           │
│  │              │                                           │
│  │  • Caches response                                     │
│  │  • Returns to client                                    │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────┐                                              │
│  │  Client  │ Receives content                            │
│  └──────────┘                                              │
│                                                              │
│  Next Request:                                              │
│  Client → Proxy → [+] Cache Hit → Client                    │
│                                                              │
│  [+] Faster response times                                   │
│  [+] Reduced backend load                                    │
└─────────────────────────────────────────────────────────────┘
```

---

## 🌐 NGINX Reverse Proxy Example

### Configuration

```
┌─────────────────────────────────────────────────────────────┐
│              NGINX REVERSE PROXY CONFIG                      │
│                                                              │
│  /etc/nginx/nginx.conf:                                     │
│  ┌────────────────────────────────────────────────────┐    │
│  │  upstream backend {                                │    │
│  │      server 192.168.1.10:8080;                    │    │
│  │      server 192.168.1.11:8080;                    │    │
│  │      server 192.168.1.12:8080;                    │    │
│  │  }                                                 │    │
│  │                                                    │    │
│  │  server {                                          │    │
│  │      listen 80;                                    │    │
│  │      server_name example.com;                      │    │
│  │                                                    │    │
│  │      location / {                                  │    │
│  │          proxy_pass http://backend;                │    │
│  │          proxy_set_header Host $host;              │    │
│  │          proxy_set_header X-Real-IP $remote_addr; │    │
│  │          proxy_set_header X-Forwarded-For          │    │
│  │              $proxy_add_x_forwarded_for;            │    │
│  │      }                                             │    │
│  │  }                                                 │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  Features:                                                   │
│  [+] Load balancing to backend servers                      │
│  [+] Header forwarding                                      │
│  [+] SSL termination (add SSL config)                      │
│  [+] Caching (add cache config)                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🛡️ Proxy Use Cases

### Corporate Forward Proxy

```
┌─────────────────────────────────────────────────────────────┐
│              CORPORATE FORWARD PROXY                         │
│                                                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                │
│  │Employee  │  │Employee  │  │Employee  │                │
│  │  1       │  │  2       │  │  3       │                │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘                │
│       │             │             │                        │
│       │             │             │                        │
│       └─────────────┼─────────────┘                        │
│                     │                                        │
│                     │ All web traffic                        │
│                     │                                        │
│                     ▼                                        │
│            ┌──────────────┐                                  │
│            │   Corporate │                                  │
│            │   Proxy      │                                  │
│            │              │                                  │
│            │  Functions:                                    │
│            │  • Content filtering                           │
│            │  • URL blocking                                │
│            │  • Bandwidth control                           │
│            │  • Logging                                     │
│            │  • Caching                                     │
│            └──────┬───────┘                                  │
│                   │                                          │
│                   │ Filtered traffic                         │
│                   │                                          │
│                   ▼                                          │
│            ┌──────────────┐                                  │
│            │   Internet   │                                  │
│            └──────────────┘                                  │
│                                                              │
│  [+] Security and compliance                                 │
│  [+] Bandwidth optimization                                  │
│  [+] Content control                                         │
└─────────────────────────────────────────────────────────────┘
```

### API Gateway Pattern

```
┌─────────────────────────────────────────────────────────────┐
│              API GATEWAY (REVERSE PROXY)                     │
│                                                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                │
│  │  Mobile  │  │   Web    │  │  Third   │                │
│  │   App    │  │   App    │  │  Party   │                │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘                │
│       │             │             │                        │
│       │             │             │                        │
│       └─────────────┼─────────────┘                        │
│                     │                                        │
│                     │ API Requests                           │
│                     │                                        │
│                     ▼                                        │
│            ┌──────────────┐                                  │
│            │   API        │                                  │
│            │   Gateway    │                                  │
│            │              │                                  │
│            │  Functions:                                    │
│            │  • Authentication                              │
│            │  • Rate limiting                               │
│            │  • Request routing                             │
│            │  • Load balancing                              │
│            │  • API versioning                              │
│            └──────┬───────┘                                  │
│                   │                                          │
│         ┌─────────┼─────────┐                               │
│         │         │         │                               │
│         ▼         ▼         ▼                               │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐                   │
│  │ User     │ │ Order    │ │ Payment  │                   │
│  │ Service  │ │ Service  │ │ Service  │                   │
│  └──────────┘ └──────────┘ └──────────┘                   │
│                                                              │
│  [+] Single entry point                                      │
│  [+] Centralized security                                    │
│  [+] Microservices routing                                   │
└─────────────────────────────────────────────────────────────┘
```

---

## 📋 Prerequisites

Before starting this topic, you should understand:
- TCP/IP and HTTP basics → [See HTTP/HTTPS Guide](../07-http-https/)
- DNS resolution → [See DNS Guide](../08-dns/)
- Load balancing concepts → [See Load Balancing Guide](../10-load-balancing/)
- Basic SSL/TLS concepts

---

## ⚠️ Common Mistakes

### Mistake 1: Confusing Forward and Reverse Proxy
```
❌ Wrong: Using terms interchangeably
✅ Correct: Forward=client-side (outbound), Reverse=server-side (inbound)
```

### Mistake 2: Not Passing Client IP
```
❌ Wrong: Backend sees proxy IP, not real client IP
✅ Correct: Set X-Forwarded-For and X-Real-IP headers
```

### Mistake 3: Proxy Timeout Issues
```
❌ Wrong: Using default timeouts for slow backends
✅ Correct: Configure appropriate proxy_read_timeout values
```

### Mistake 4: SSL Termination Without Internal Security
```
❌ Wrong: SSL terminated at proxy, plain HTTP to backend
✅ Correct: Re-encrypt to backend or use internal network security
```

---

## 🛠️ Command Reference

### NGINX Reverse Proxy
```nginx
# Basic reverse proxy
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend_server:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# SSL termination
server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://backend:8080;
    }
}

# Caching proxy
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m;

server {
    location / {
        proxy_cache my_cache;
        proxy_cache_valid 200 1h;
        proxy_pass http://backend;
    }
}
```

### HAProxy Configuration
```
frontend www
    bind *:80
    default_backend servers

backend servers
    server server1 192.168.1.1:80 check
    http-request set-header X-Forwarded-For %[src]
```

### Squid Forward Proxy
```bash
# Install and start
apt install squid
systemctl start squid

# Basic config (/etc/squid/squid.conf)
http_port 3128
acl localnet src 10.0.0.0/8
http_access allow localnet

# Use proxy
export http_proxy=http://proxy:3128
export https_proxy=http://proxy:3128
```

### Testing Proxy
```bash
# Test through proxy
curl -x http://proxy:3128 http://example.com

# Check headers through reverse proxy
curl -v https://example.com | grep -i "x-forwarded"
```

---

## 📊 Quick Reference Card

```
PROXY QUICK REFERENCE
=====================

Proxy Types:
  Forward Proxy - Client -> Proxy -> Internet
    - Hides client IP
    - Content filtering
    - Corporate access control

  Reverse Proxy - Internet -> Proxy -> Backend
    - Hides backend servers
    - SSL termination
    - Load balancing
    - Caching

Important Headers:
  X-Forwarded-For:    Client's original IP
  X-Real-IP:          Client's IP (single)
  X-Forwarded-Proto:  Original protocol (http/https)
  X-Forwarded-Host:   Original host header

Common Proxy Software:
  NGINX      - Reverse proxy, load balancer
  HAProxy    - High-performance TCP/HTTP proxy
  Squid      - Forward proxy, caching
  Envoy      - Cloud-native proxy, service mesh
  Traefik    - Cloud-native, auto-discovery

Proxy Functions:
  - Load balancing across backends
  - SSL/TLS termination
  - Caching static content
  - Request/response modification
  - Authentication and access control
```

---

## 🎯 Key Takeaways for Presentations

1. **Proxy = Middleman** - Intermediary between client and server
2. **Forward Proxy** - Represents clients (hides client IP)
3. **Reverse Proxy** - Represents servers (hides server details)
4. **Load Balancing** - Distributes requests across backend servers
5. **SSL Termination** - Handles encryption at proxy level
6. **Caching** - Stores responses for faster delivery
7. **API Gateway** - Specialized reverse proxy for APIs
8. **Security** - Content filtering, WAF, authentication

---

## 🧠 Quick Quiz

<details>
<summary><strong>Q1:</strong> What is the difference between a forward proxy and a reverse proxy?</summary>

**Answer:** Forward proxy represents clients (hides client IP); reverse proxy represents servers (hides backend).
</details>

<details>
<summary><strong>Q2:</strong> What HTTP header preserves the original client IP through a proxy chain?</summary>

**Answer:** X-Forwarded-For

This header contains a comma-separated list of IPs the request passed through.
</details>

<details>
<summary><strong>Q3:</strong> What is SSL/TLS termination?</summary>

**Answer:** Decrypting HTTPS traffic at the proxy/load balancer level.

This offloads encryption from backend servers and simplifies certificate management.
</details>

<details>
<summary><strong>Q4:</strong> Name two popular reverse proxy software solutions.</summary>

**Answer:** NGINX and HAProxy (also Envoy, Traefik, Apache)
</details>

---

## 📚 Further Reading

- Transparent proxies
- SOCKS proxy protocol
- Web Application Firewall (WAF)
- Proxy chaining

---

**Previous:** [Load Balancing](../10-load-balancing/) | **Next:** [CDN](../12-cdn/)
