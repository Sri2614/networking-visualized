#!/bin/bash

# Reorganize folders for beginner-friendly learning order
# New order: IP → TCP/IP → HTTP → DNS → Firewalls → Load Balancing → Proxies → CDN → VPN → Docker → K8s

echo "Reorganizing folders for beginner-friendly learning order..."

# Create temporary numbered folders
mkdir -p temp/03-http-https
mkdir -p temp/04-dns
mkdir -p temp/05-firewalls
mkdir -p temp/06-load-balancing
mkdir -p temp/07-proxies
mkdir -p temp/08-cdn
mkdir -p temp/09-vpn-tunneling

# Move content to temp folders
echo "Moving files to temporary folders..."
cp -r 04-http-https/* temp/03-http-https/
cp -r 03-dns/* temp/04-dns/
cp -r 06-firewalls/* temp/05-firewalls/
cp -r 05-load-balancing/* temp/06-load-balancing/
cp -r 08-proxies/* temp/07-proxies/
cp -r 09-cdn/* temp/08-cdn/
cp -r 07-vpn-tunneling/* temp/09-vpn-tunneling/

# Remove old folders
echo "Removing old folders..."
rm -rf 03-dns 04-http-https 05-load-balancing 06-firewalls 07-vpn-tunneling 08-proxies 09-cdn

# Rename temp folders to final names
echo "Creating new folder structure..."
mv temp/03-http-https 03-http-https
mv temp/04-dns 04-dns
mv temp/05-firewalls 05-firewalls
mv temp/06-load-balancing 06-load-balancing
mv temp/07-proxies 07-proxies
mv temp/08-cdn 08-cdn
mv temp/09-vpn-tunneling 09-vpn-tunneling

# Remove temp directory
rmdir temp

echo "✅ Folders reorganized successfully!"
echo ""
echo "New order:"
echo "01-ip-addressing"
echo "02-tcp-ip"
echo "03-http-https"
echo "04-dns"
echo "05-firewalls"
echo "06-load-balancing"
echo "07-proxies"
echo "08-cdn"
echo "09-vpn-tunneling"
echo "10-docker-networking"
echo "11-kubernetes-networking"
