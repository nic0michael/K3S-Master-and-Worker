#!/bin/sh

# CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh

# nano CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh
# chmod 775 CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh
# ./CreateMaster-and-WorkerDeploymentCommands4Ubuntu.shh > make-ubuntu-master-and-workers-cluster.txt

LOGIN_USER1="nickm"
LOGIN_USER2="tonia"
LOGIN_USER3="nickm"

#You need to change this token after the installation of the master node has been creaated
MASTER_TOKEN="K1026e692c09900990359e4959bea4c6b5bf943ddb7b2ca1d4bb7edfae7bff181da::server:c2f4a96a9a957e2c838c33c2f5707164"

MASTER_NODE_IP="10.154.2.88"
FIRST_WORKER_NODE_IP="10.154.2.113"
SECOND_WORKER_NODE_IP="10.154.2.93"


MASTER_NODE_NAME="buffalo.loseyourip.com"
FIRST_WORKER_NODE_NAME="tiger.loseyourip.com"
SECOND_WORKER_NODE_NAME="kudu.loseyourip.com"

MASTER_NODE_URL="https://$MASTER_NODE_IP:6443"


echo "## K3S_Master_and_Workers_create_commands_for_Ubuntu.txt ##"

echo "\n"
echo "#################"
echo "# PREREQUISITES #"
echo "#################"
echo "Download Ubuntu Server 22.04"
echo "Install five VM instances in VirtualBox with these IP Addresses:"
echo "1. ${MASTER_NODE_IP} for the Master Node"
echo "4. ${FIRST_WORKER_NODE_IP} for the First Worker Node"
echo "5. ${SECOND_WORKER_NODE_IP} for the Second Worker Node"
echo "\n"
echo "Use DynuDNS (https://www.dynu.com/en-US/ControlPanel) create three DDNS services :"
echo "1. ${MASTER_NODE_NAME} pointing to IP Address: ${MASTER_NODE_IP} for the Master Node"
echo "4. ${FIRST_WORKER_NODE_NAME} pointing to IP Address: ${FIRST_WORKER_NODE_IP} for the First Worker Node"
echo "5. ${SECOND_WORKER_NODE_NAME} pointing to IP Address: ${SECOND_WORKER_NODE_IP} for the Second Worker Node"
echo "\n"
echo "############################"
echo "# Create master node #"
echo "############################"
echo "ssh $LOGIN_USER1@$MASTER_NODE_IP"
echo "sudo su -"
echo "/usr/local/bin/k3s-killall.sh"
echo "/usr/local/bin/k3s-agent-uninstall.sh"
echo "/usr/local/bin/k3s-uninstall.sh"
echo "\n"
echo "node_ip=\"$MASTER_NODE_IP\""
echo "node_name=\"$MASTER_NODE_NAME\""
#echo "curl -sfL https://get.k3s.io | K3S_NODE_IP=\${node_ip} K3S_NODE_NAME=\${node_name} sh -s - server --cluster-init"
echo "curl -sfL https://get.k3s.io | K3S_NODE_IP=\${node_ip} K3S_NODE_NAME=\${node_name} sh -"
echo "\n"
echo "cat /var/lib/rancher/k3s/server/node-token"
echo "Update the token in this file"
echo "\n"


echo "############################"
echo "# Create First Worker Node #"
echo "############################"
echo "ssh $LOGIN_USER4@$FIRST_WORKER_NODE_IP"
echo "sudo su -"
echo "/usr/local/bin/k3s-killall.sh"
echo "/usr/local/bin/k3s-uninstall.sh"
echo "/usr/local/bin/k3s-agent-uninstall.sh"
echo "\n"
echo "k3s_token=\"$MASTER_TOKEN\""
echo "k3s_url=\"$MASTER_NODE_URL\""
echo "node_ip=\"$FIRST_WORKER_NODE_IP\""
echo "node_name=\"$FIRST_WORKER_NODE_NAME\""
echo "curl -sfL https://get.k3s.io | K3S_URL=\${k3s_url} K3S_TOKEN=\${k3s_token} K3S_NODE_IP=\${node_ip} K3S_NODE_NAME=\${node_name} sh -"
echo "\n"

echo "############################"
echo "# Create Second Worker Node #"
echo "############################"
echo "ssh $LOGIN_USER5@$SECOND_WORKER_NODE_IP"
echo "sudo su -"
echo "/usr/local/bin/k3s-killall.sh"
echo "/usr/local/bin/k3s-uninstall.sh"
echo "/usr/local/bin/k3s-agent-uninstall.sh"
echo "\n"
echo "k3s_token=\"$MASTER_TOKEN\""
echo "k3s_url=\"$MASTER_NODE_URL\""
echo "node_ip=\"$SECOND_WORKER_NODE_IP\""
echo "node_name=\"$SECOND_WORKER_NODE_NAME\""
echo "curl -sfL https://get.k3s.io | K3S_URL=\${k3s_url} K3S_TOKEN=\${k3s_token} K3S_NODE_IP=\${node_ip} K3S_NODE_NAME=\${node_name} sh -"
echo "\n"

echo "############################"
echo "\n"
echo "ssh $LOGIN_USER1@$MASTER_NODE_IP"
echo "sudo su -"
echo "kubectl get nodes"


echo "\n"
echo "#######################"
echo "# Destroy all servers #"
echo "#######################"
echo "ssh $LOGIN_USER1@$MASTER_NODE_IP"
echo "sudo su -"
echo "/usr/local/bin/k3s-killall.sh"
echo "/usr/local/bin/k3s-uninstall.sh"
echo "/usr/local/bin/k3s-agent-uninstall.sh"
echo "\n"
echo "ssh $LOGIN_USER4@$FIRST_WORKER_NODE_IP"
echo "sudo su -"
echo "/usr/local/bin/k3s-killall.sh"
echo "/usr/local/bin/k3s-uninstall.sh"
echo "/usr/local/bin/k3s-agent-uninstall.sh"
echo "\n"
echo "ssh $LOGIN_USER5@$SECOND_WORKER_NODE_IP"
echo "sudo su -"
echo "/usr/local/bin/k3s-killall.sh"
echo "/usr/local/bin/k3s-uninstall.sh"
echo "/usr/local/bin/k3s-agent-uninstall.sh"