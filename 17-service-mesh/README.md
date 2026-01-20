# 🕸️ Service Mesh
## Visual Guide for Presentations

---

## 🎯 What is a Service Mesh?

**Service Mesh = Infrastructure Layer for Service-to-Service Communication**

```
WITHOUT SERVICE MESH
====================

  +----------+  +----------+  +----------+
  | Service  |  | Service  |  | Service  |
  |    A     |  |    B     |  |    C     |
  +----------+  +----------+  +----------+
        |             |             |
        v             v             v
  Each service handles:
    - Retry logic
    - Circuit breaking
    - Load balancing
    - Security (mTLS)
    - Observability

  Problems:
    [!] Code duplication
    [!] Hard to maintain
    [!] Inconsistent implementation
    [X] Business logic mixed with infrastructure code


WITH SERVICE MESH
=================

            +------------------+
            |   Service Mesh   |
            |    (Sidecar)     |
            +--------+---------+
                     |
      +--------------+--------------+
      |              |              |
      v              v              v
  +-------+     +-------+     +-------+
  | App A |     | App B |     | App C |
  +-------+     +-------+     +-------+

  Mesh Handles:
    - Retry logic
    - Circuit breaking
    - Load balancing
    - Security (mTLS)
    - Observability
    - Traffic management

  Benefits:
    [+] Infrastructure separated from business logic
    [+] Consistent behavior across services
    [+] Centralized control
```

---

## 🏗️ Service Mesh Architecture

### Sidecar Pattern

```
┌─────────────────────────────────────────────────────────────┐
│              SIDECAR PATTERN                                 │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │ Pod                                                │    │
│  │ ────────────────────────────────────────────────    │    │
│  │                                                    │    │
│  │  ┌──────────────┐  ┌──────────────┐              │    │
│  │  │ Application │  │ Service Mesh │              │    │
│  │  │ Container    │  │ Proxy        │              │    │
│  │  │              │  │ (Sidecar)    │              │    │
│  │  │  Port: 8080  │  │ Port: 15001  │              │    │
│  │  └──────┬───────┘  └──────┬───────┘              │    │
│  │         │                  │                        │    │
│  │         │                  │                        │    │
│  │         └────────┬─────────┘                        │    │
│  │                  │                                    │    │
│  │                  │ All traffic goes through proxy   │    │
│  │                  │                                    │    │
│  │                  ▼                                    │    │
│  │          ┌──────────────┐                            │    │
│  │          │   Network     │                            │    │
│  │          └──────────────┘                            │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  How It Works:                                               │
│  1. App sends request → Sidecar proxy                      │
│  2. Sidecar handles: security, routing, observability      │
│  3. Sidecar forwards to destination sidecar               │
│  4. Destination sidecar → App                              │
│                                                              │
│  [+] Transparent to application                             │
│  [+] No code changes needed                                 │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔐 Service Mesh Features

### mTLS (Mutual TLS)

```
┌─────────────────────────────────────────────────────────────┐
│              MUTUAL TLS (mTLS)                               │
│                                                              │
│  ┌──────────┐                                              │
│  │ Service  │                                              │
│  │   A      │                                              │
│  │          │                                              │
│  │  Sidecar Proxy                                         │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ Encrypted with Service A's certificate            │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │   Network    │                                           │
│  │  (Encrypted) │                                           │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │ Encrypted traffic                                 │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────────┐                                           │
│  │ Service      │                                           │
│  │   B          │                                           │
│  │              │                                           │
│  │  Sidecar Proxy                                          │
│  │  Validates Service A's certificate                     │
│  │  Decrypts traffic                                      │
│  └──────┬───────┘                                           │
│         │                                                    │
│         │                                                    │
│         ▼                                                    │
│  ┌──────────┐                                              │
│  │ Service  │                                              │
│  │   B      │                                              │
│  │  (App)   │                                              │
│  └──────────┘                                              │
│                                                              │
│  [+] Both sides authenticate                                 │
│  [+] End-to-end encryption                                   │
│  [+] Automatic certificate management                        │
└─────────────────────────────────────────────────────────────┘
```

### Traffic Management

```
┌─────────────────────────────────────────────────────────────┐
│              TRAFFIC MANAGEMENT                               │
│                                                              │
│  ┌──────────┐                                              │
│  │  Client  │                                              │
│  └────┬─────┘                                              │
│       │                                                    │
│       │ Request                                            │
│       │                                                    │
│       ▼                                                    │
│  ┌──────────────┐                                           │
│  │ Service Mesh │                                           │
│  │              │                                           │
│  │  Traffic Rules:                                         │
│  │  • 90% → v1 (stable)                                   │
│  │  • 10% → v2 (canary)                                   │
│  │  • Retry failed requests                               │
│  │  • Circuit breaker for failures                        │
│  │  • Timeout handling                                    │
│  └──────┬───────┘                                           │
│         │                                                    │
│    ┌────┴────┐                                              │
│    │         │                                              │
│    ▼         ▼                                              │
│  ┌─────┐  ┌─────┐                                           │
│  │ v1  │  │ v2  │                                           │
│  │(90%)│  │(10%)│                                           │
│  └─────┘  └─────┘                                           │
│                                                              │
│  [+] Canary deployments                                      │
│  [+] A/B testing                                             │
│  [+] Gradual rollouts                                        │
└─────────────────────────────────────────────────────────────┘
```

---

## 🛠️ Service Mesh Solutions

### Istio

```
┌─────────────────────────────────────────────────────────────┐
│              ISTIO ARCHITECTURE                              │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │ Control Plane                                    │    │
│  │ ────────────────────────────────────────────────    │    │
│  │                                                    │    │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐      │    │
│  │  │ Istiod   │  │ Pilot    │  │ Citadel  │      │    │
│  │  │          │  │          │  │          │      │    │
│  │  │ Config   │  │ Traffic  │  │ Security │      │    │
│  │  │ Mgmt     │  │ Mgmt     │  │ (mTLS)   │      │    │
│  │  └──────────┘  └──────────┘  └──────────┘      │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │ Data Plane                                        │    │
│  │ ────────────────────────────────────────────────    │    │
│  │                                                    │    │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐      │    │
│  │  │ Envoy    │  │ Envoy    │  │ Envoy    │      │    │
│  │  │ Proxy    │  │ Proxy    │  │ Proxy    │      │    │
│  │  │(Sidecar) │  │(Sidecar) │  │(Sidecar) │      │    │
│  │  └──────────┘  └──────────┘  └──────────┘      │    │
│  │                                                    │    │
│  │  Handles: Traffic, security, observability        │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  Features:                                                   │
│  [+] Traffic management                                      │
│  [+] Security (mTLS)                                         │
│  [+] Observability (metrics, tracing, logs)                  │
│  [+] Policy enforcement                                      │
└─────────────────────────────────────────────────────────────┘
```

### Linkerd

```
┌─────────────────────────────────────────────────────────────┐
│              LINKERD ARCHITECTURE                            │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │ Control Plane                                    │    │
│  │ ────────────────────────────────────────────────    │    │
│  │                                                    │    │
│  │  ┌──────────┐                                     │    │
│  │  │ Linkerd  │                                     │    │
│  │  │ Control  │                                     │    │
│  │  │ Plane    │                                     │    │
│  │  │          │                                     │    │
│  │  │ Config, metrics, API                          │    │
│  │  └──────────┘                                     │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  ┌────────────────────────────────────────────────────┐    │
│  │ Data Plane                                        │    │
│  │ ────────────────────────────────────────────────    │    │
│  │                                                    │    │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐      │    │
│  │  │ Linkerd  │  │ Linkerd  │  │ Linkerd  │      │    │
│  │  │ Proxy    │  │ Proxy    │  │ Proxy    │      │    │
│  │  │(Sidecar) │  │(Sidecar) │  │(Sidecar) │      │    │
│  │  └──────────┘  └──────────┘  └──────────┘      │    │
│  │                                                    │    │
│  │  Ultra-lightweight Rust-based proxy              │    │
│  └────────────────────────────────────────────────────┘    │
│                                                              │
│  Features:                                                   │
│  [+] Simple and fast                                         │
│  [+] Low resource usage                                      │
│  [+] Automatic mTLS                                          │
│  [+] Built-in observability                                  │
└─────────────────────────────────────────────────────────────┘
```

### Comparison Table

```
┌──────────────────┬──────────────────┬──────────────────┐
│ Feature          │ Istio           │ Linkerd          │
├──────────────────┼──────────────────┼──────────────────┤
│ Complexity       │ High             │ Low              │
│ Resource Usage   │ Higher           │ Lower            │
│ Features         │ Extensive        │ Focused          │
│ Learning Curve   │ Steep            │ Gentle           │
│ Community        │ Large            │ Growing          │
│ Use Case         │ Enterprise       │ Simplicity       │
│ Proxy            │ Envoy            │ Linkerd-proxy    │
│ Language         │ C++              │ Rust             │
└──────────────────┴──────────────────┴──────────────────┘
```

---

## 📋 Prerequisites

Before starting this topic, you should understand:
- Kubernetes networking → [See Kubernetes Networking Guide](../15-kubernetes-networking/)
- Container concepts → [See Docker Networking](../14-docker-networking/)
- TLS/SSL basics → [See HTTP/HTTPS Guide](../07-http-https/)
- Microservices architecture concepts

---

## ⚠️ Common Mistakes

### Mistake 1: Adding Service Mesh Too Early
```
❌ Wrong: Implementing service mesh for simple applications
✅ Correct: Start with service mesh when you have 10+ microservices
```

### Mistake 2: Underestimating Resource Overhead
```
❌ Wrong: Not accounting for sidecar memory/CPU usage
✅ Correct: Plan for ~50-100MB memory per sidecar; monitor resource usage
```

### Mistake 3: Complex Policies Before Understanding
```
❌ Wrong: Implementing complex traffic rules immediately
✅ Correct: Start with observability, then add traffic management gradually
```

### Mistake 4: Not Testing mTLS Impact
```
❌ Wrong: Enabling strict mTLS without testing
✅ Correct: Use permissive mode first, test thoroughly, then strict mode
```

---

## 🛠️ Command Reference

### Istio Commands
```bash
# Install Istio
istioctl install --set profile=demo

# Verify installation
istioctl verify-install

# Enable sidecar injection for namespace
kubectl label namespace default istio-injection=enabled

# Check proxy status
istioctl proxy-status

# Analyze configuration
istioctl analyze

# Dashboard
istioctl dashboard kiali
istioctl dashboard grafana
istioctl dashboard jaeger
```

### Istio Traffic Management
```yaml
# VirtualService (routing rules)
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: reviews
spec:
  hosts:
  - reviews
  http:
  - match:
    - headers:
        end-user:
          exact: test
    route:
    - destination:
        host: reviews
        subset: v2
  - route:
    - destination:
        host: reviews
        subset: v1
```

### Linkerd Commands
```bash
# Install Linkerd
linkerd install | kubectl apply -f -

# Check installation
linkerd check

# Inject sidecar
kubectl get deploy -o yaml | linkerd inject - | kubectl apply -f -

# Dashboard
linkerd dashboard

# View stats
linkerd stat deploy
linkerd top deploy
linkerd tap deploy/webapp
```

### mTLS Configuration (Istio)
```yaml
# PeerAuthentication (mTLS mode)
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: default
  namespace: istio-system
spec:
  mtls:
    mode: STRICT  # or PERMISSIVE
```

### Debugging
```bash
# Istio - check proxy config
istioctl proxy-config clusters <pod-name>
istioctl proxy-config routes <pod-name>

# Linkerd - debug
linkerd check --proxy
linkerd diagnostics proxy-metrics <pod-name>
```

---

## 📊 Quick Reference Card

```
SERVICE MESH QUICK REFERENCE
============================

Service Mesh Components:
  Data Plane   - Sidecar proxies (Envoy, Linkerd-proxy)
  Control Plane - Configuration, policies, telemetry

Core Features:
  Traffic Management:
    - Load balancing
    - Canary deployments
    - A/B testing
    - Circuit breakers
    - Retries, timeouts

  Security:
    - mTLS (mutual TLS)
    - Authorization policies
    - Certificate rotation

  Observability:
    - Distributed tracing
    - Metrics (Prometheus)
    - Service topology

Istio vs Linkerd:
  Istio:   Feature-rich, complex, enterprise-grade
  Linkerd: Simple, lightweight, easy to operate

When to Use Service Mesh:
  * 10+ microservices
  * Need for mTLS between services
  * Complex traffic routing requirements
  * Observability across services

Key Commands:
  istioctl proxy-status  - Check proxies
  istioctl analyze       - Config validation
  linkerd check          - Verify installation
  linkerd stat deploy    - View deployment stats
```

---

## 🎯 Key Takeaways for Presentations

1. **Service Mesh = Infrastructure Layer** - Handles service communication
2. **Sidecar Pattern** - Proxy runs alongside each service
3. **mTLS** - Automatic mutual TLS encryption
4. **Traffic Management** - Canary, A/B testing, retries
5. **Observability** - Metrics, tracing, logs
6. **Istio** - Feature-rich, enterprise-grade
7. **Linkerd** - Simple, lightweight, fast
8. **Transparent** - No application code changes needed

---

## 📚 Further Reading

- Service mesh patterns
- Canary deployments
- Distributed tracing
- Service mesh performance

---

**Previous:** [Network Monitoring](../16-network-monitoring/) | **Back to:** [Main README](../README.md)
