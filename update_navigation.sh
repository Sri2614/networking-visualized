#!/bin/bash

# Update navigation links in each README

# 01-ip-addressing: Next should be 02-tcp-ip
sed -i '' 's|Next.*02-tcp-ip|Next: [TCP/IP \& OSI Model](../02-tcp-ip/)|g' 01-ip-addressing/README.md

# 02-tcp-ip: Previous 01, Next 03
sed -i '' 's|Previous.*01-ip-addressing|Previous: [IP Addressing](../01-ip-addressing/)|g' 02-tcp-ip/README.md
sed -i '' 's|Next.*03-dns|Next: [HTTP/HTTPS](../03-http-https/)|g' 02-tcp-ip/README.md

# 03-http-https: Previous 02, Next 04
sed -i '' 's|Previous.*02-tcp-ip|Previous: [TCP/IP \& OSI Model](../02-tcp-ip/)|g' 03-http-https/README.md
sed -i '' 's|Next.*04-http-https|Next: [DNS](../04-dns/)|g' 03-http-https/README.md
sed -i '' 's|Next.*05-load-balancing|Next: [DNS](../04-dns/)|g' 03-http-https/README.md

# 04-dns: Previous 03, Next 05
sed -i '' 's|Previous.*03-dns|Previous: [HTTP/HTTPS](../03-http-https/)|g' 04-dns/README.md
sed -i '' 's|Previous.*02-tcp-ip|Previous: [HTTP/HTTPS](../03-http-https/)|g' 04-dns/README.md
sed -i '' 's|Next.*04-http-https|Next: [Firewalls \& Security Groups](../05-firewalls/)|g' 04-dns/README.md
sed -i '' 's|Next.*05-load-balancing|Next: [Firewalls \& Security Groups](../05-firewalls/)|g' 04-dns/README.md

# 05-firewalls: Previous 04, Next 06
sed -i '' 's|Previous.*04-dns|Previous: [DNS](../04-dns/)|g' 05-firewalls/README.md
sed -i '' 's|Previous.*05-load-balancing|Previous: [DNS](../04-dns/)|g' 05-firewalls/README.md
sed -i '' 's|Next.*06-firewalls|Next: [Load Balancing](../06-load-balancing/)|g' 05-firewalls/README.md
sed -i '' 's|Next.*07-vpn-tunneling|Next: [Load Balancing](../06-load-balancing/)|g' 05-firewalls/README.md

# 06-load-balancing: Previous 05, Next 07
sed -i '' 's|Previous.*05-load-balancing|Previous: [Firewalls \& Security Groups](../05-firewalls/)|g' 06-load-balancing/README.md
sed -i '' 's|Previous.*04-http-https|Previous: [Firewalls \& Security Groups](../05-firewalls/)|g' 06-load-balancing/README.md
sed -i '' 's|Next.*06-load-balancing|Next: [Proxies \& Reverse Proxies](../07-proxies/)|g' 06-load-balancing/README.md
sed -i '' 's|Next.*06-firewalls|Next: [Proxies \& Reverse Proxies](../07-proxies/)|g' 06-load-balancing/README.md

# 07-proxies: Previous 06, Next 08
sed -i '' 's|Previous.*07-proxies|Previous: [Load Balancing](../06-load-balancing/)|g' 07-proxies/README.md
sed -i '' 's|Previous.*08-proxies|Previous: [Load Balancing](../06-load-balancing/)|g' 07-proxies/README.md
sed -i '' 's|Next.*08-proxies|Next: [CDN](../08-cdn/)|g' 07-proxies/README.md
sed -i '' 's|Next.*09-cdn|Next: [CDN](../08-cdn/)|g' 07-proxies/README.md

# 08-cdn: Previous 07, Next 09
sed -i '' 's|Previous.*08-cdn|Previous: [Proxies \& Reverse Proxies](../07-proxies/)|g' 08-cdn/README.md
sed -i '' 's|Previous.*09-cdn|Previous: [Proxies \& Reverse Proxies](../07-proxies/)|g' 08-cdn/README.md
sed -i '' 's|Next.*09-cdn|Next: [VPN \& Tunneling](../09-vpn-tunneling/)|g' 08-cdn/README.md
sed -i '' 's|Next.*10-docker-networking|Next: [VPN \& Tunneling](../09-vpn-tunneling/)|g' 08-cdn/README.md

# 09-vpn-tunneling: Previous 08, Next 10
sed -i '' 's|Previous.*07-vpn-tunneling|Previous: [CDN](../08-cdn/)|g' 09-vpn-tunneling/README.md
sed -i '' 's|Previous.*08-cdn|Previous: [CDN](../08-cdn/)|g' 09-vpn-tunneling/README.md
sed -i '' 's|Next.*09-vpn-tunneling|Next: [Docker Networking](../10-docker-networking/)|g' 09-vpn-tunneling/README.md
sed -i '' 's|Next.*10-docker-networking|Next: [Docker Networking](../10-docker-networking/)|g' 09-vpn-tunneling/README.md

# 10-docker-networking: Previous 09, Next 11
sed -i '' 's|Previous.*09-cdn|Previous: [VPN \& Tunneling](../09-vpn-tunneling/)|g' 10-docker-networking/README.md
sed -i '' 's|Previous.*10-docker-networking|Previous: [VPN \& Tunneling](../09-vpn-tunneling/)|g' 10-docker-networking/README.md
sed -i '' 's|Next.*10-docker-networking|Next: [Kubernetes Networking](../11-kubernetes-networking/)|g' 10-docker-networking/README.md
sed -i '' 's|Next.*11-kubernetes-networking|Next: [Kubernetes Networking](../11-kubernetes-networking/)|g' 10-docker-networking/README.md

# 11-kubernetes-networking: Previous 10
sed -i '' 's|Previous.*10-docker-networking|Previous: [Docker Networking](../10-docker-networking/)|g' 11-kubernetes-networking/README.md
sed -i '' 's|Previous.*11-kubernetes-networking|Previous: [Docker Networking](../10-docker-networking/)|g' 11-kubernetes-networking/README.md

echo "✅ Navigation links updated!"
