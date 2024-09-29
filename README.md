1. Create a developer server, add ssh key to the github account, clone project files, push files to the repository.
   
2. Create a jenkins server, install jenkins, maven, java, git and start jenkins machine, generate token create webhook, install maven integration, github plugins add jdk,maven tools and build a maven project.
   
3. Create a tomcat server, install tomcat and java, modify 2 context.xml files, 1 tomact-users.xml file, add credentials in jenkins, buils a tomcat project by deploying a war file container.
   
4. Create a docker server, install docker, ssh conncet with jenkins, create ecr repo, add ssh server and exec commands push image in ecr.
  
5. Create a cluster server, install kubectl, eksctl, create cluster and nodegroup.
   
6. Create ansible server, ssh connect with cluster server
We have to make cluster server as a host to create and run deployment and service files automatically in jenkins via playbook.

Install ansible
![image](https://github.com/user-attachments/assets/78b65a42-27cd-42f0-897c-1474602e17ff)

![image](https://github.com/user-attachments/assets/56580e3f-1fac-44ec-9865-ecc537f62ac7)

Add ansible.cfg file in /etc/ansible
![image](https://github.com/user-attachments/assets/c2b078d6-0c19-4ad3-bbde-3b40603ac137)

Create hosts file in /etc/ansible and add cluster-server as a host.
![image](https://github.com/user-attachments/assets/ca9af298-183b-41cc-b502-76ef43148afe)

Create cluster.yml playbook in ansible
```yml
---
- hosts: cluster-server
  gather_facts: no
  tasks:
    - name: Deploy application in Kubernetes
      k8s:
        state: present
        definition:
          apiVersion: apps/v1
          kind: Deployment
          metadata:
            name: my-app
            namespace: default
            labels:
              app: my-app
          spec:
            replicas: 3
            selector:
              matchLabels:
                app: my-app
            template:
              metadata:
                labels:
                  app: my-app
              spec:
                containers:
                - name: my-app
                  image: 288761750357.dkr.ecr.ap-southeast-1.amazonaws.com/mansi-28:latest
                  imagePullPolicy: Always
                  ports:
                  - containerPort: 8080
            strategy:
              type: RollingUpdate
              rollingUpdate:
                maxSurge: 1
                maxUnavailable: 1
    - name: Copy service file to target
      copy:
        src: service.yml
        dest: /tmp/service.yml

    - name: Create Kubernetes Service
      command: kubectl apply -f /tmp/service.yml
      register: service_output

    - name: Rollout
      command: kubectl rollout undo deployment/my-app
```
Create service.yml file 

```yml
apiVersion: v1
kind: Service
metadata:
  name: regapp-service
  labels:
    app: my-app
spec:
  selector:
    app: my-app

  ports:
    - port: 8080
      targetPort: 8080

  type: LoadBalancer
```
![image](https://github.com/user-attachments/assets/0b54969c-d1a5-43be-a4d7-1f96dff8ce62)

(Install pyhton, pip, openshift in Kubernetes-server)

```yml
sudo yum install python3 -y
sudo yum install python3-pip -y
pip install openshift Kubernetes
```
Try running the cluster.yml playbook to check if the service is getting deployed
![image](https://github.com/user-attachments/assets/b5ce4507-7b8b-4545-9fb7-c8f283e2d76f)

Delete deployment and service 
![image](https://github.com/user-attachments/assets/31bc9389-a521-4be9-9317-8cba7679256a)











