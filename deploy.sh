#!/bin/bash

echo "============================================================"
echo "FINAL EXAM - CPE212 Automating Server Management"
echo "Role-Based Multi-Node Deployment"
echo "Student: El Cid A. Bacong"
echo "Section: CPE31S4"
echo "Date: $(date)"
echo "============================================================"

echo ""
echo "TARGET SERVERS:"
echo "   Web Servers:  192.168.56.105, 192.168.56.106 (Ubuntu - Nginx)"
echo "   Monitoring:   192.168.56.110 (CentOS - Prometheus Stack)"

echo ""
echo "1. Testing SSH connectivity..."
ansible all -i inventory -m ping

echo ""
echo "2. Creating directory structure..."
mkdir -p roles/{nginx,tasks,templates,handlers} roles/{prometheus,tasks,templates,files} roles/{motd,tasks,templates}

echo ""
echo "3. Running Ansible playbook with roles..."
echo "Please enter sudo password when prompted:"
ansible-playbook -i inventory playbook.yaml -K

echo ""
echo "============================================================"
echo "ROLE-BASED DEPLOYMENT COMPLETED!"
echo ""
echo "ACCESS INFORMATION:"
echo "   Nginx Server 1:  http://192.168.56.105"
echo "   Nginx Server 2:  http://192.168.56.106"
echo "   Prometheus:      http://192.168.56.110:9090"
echo "   Node Exporter:   http://192.168.56.110:9100/metrics"
echo "   Grafana:         http://192.168.56.110:3000"
echo "   Grafana Login:   admin / admin123"
echo ""
echo "Verify MOTD: ssh ubuntu@192.168.56.105"
echo "               ssh ubuntu@192.168.56.106" 
echo "               ssh centos@192.168.56.110"
echo ""
echo "🔗 Repository: https://github.com/ElCidBacong/Final_Exam_Bacong"
echo "============================================================"
