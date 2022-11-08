# K3S-Master-and-Worker
This project is used to create a single server (Master and Worker Node) K3S deployment
You can add additional worker Nodes

## Prerequisites
Run the following command:
```
nano CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh
```
paste the content of file: [CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh](https://github.com/nic0michael/K3S-Master-and-Worker/blob/master/CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh)\
here.

now run this command:
```
chmod 775 CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh
```

## You need DNS records for all your servers
If you dont have DNSnames for your servers register with DynuDNS and get free DNS names for your four servers static IPs
https://www.dynu.com/en-US/ControlPanel/CreateAccount
after logging to the controllpannel select DDNS and create your DNS records for your servers

## You need to put your three servers details into the shell script
Before you can use this file you need to edit it and set these values
```
LOGIN_USER1="YourUserID"
LOGIN_USER2="YourUserID"
LOGIN_USER3="YourUserID"

MASTER_NODE_IP="10.154.2.88"
FIRST_WORKER_NODE_IP="10.154.2.113"
SECOND_WORKER_NODE_IP="10.154.2.93"

MASTER_NODE_NAME="buffalo.loseyourip.com"
FIRST_WORKER_NODE_NAME="tiger.loseyourip.com"
SECOND_WORKER_NODE_NAME="kudu.loseyourip.com"
```

 

Run the following command:
```
nano CreateMaster-and-WorkerDeploymentCommands4Ubuntu.sh
```

## Generate your deployment file
Run the following command 
```
./CreateMaster-and-WorkerDeploymentCommands4Ubuntu.shh > make-ubuntu-master-and-workers-cluster.txt
```

This will generate the file :  make-ubuntu-master-and-workers-cluster.txt\
Use this file it has all the commands you need to create your Master and additional worker Nodes

## Test your cluster
You can refer to the folowing article [Deploy tomcat on K3S](http://rino.kozow.com/dvp/posts/tomcat-on-a-single-instance-of-k3s/)\
to deploy Tomcat to your cluster so that you can test it
