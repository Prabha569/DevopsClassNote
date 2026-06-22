================================
Kubernetes Day-01 [ 16-May-26 ]
================================

Kubernetes me one Master Node/Control plane  & 2/3 Worker Node -> called K8s cluster

Control Plane Components:-
-------------------------
API Server:-
Scheduler:-
Controller:-
ETCD:-

Worker Node Components:-
-----------------------
Kubelet:-
Kube-proxy:-
Container Runtime:-
Pod:-

Where this cluster can be created:-
Onprem:-
Cloud:-

ChatGPT:- On Prem pr k8s cluster banana hai to kya kya karna padega ?

===============================
Kubernetes Day-02 [ 17-May-26 ]
===============================

Kubernetes Basic Introduction:-
Kubernetes + Container Orchestration Tool
Architecture of K8s
Smallest Unit of k8s = Pod
Pod = Maa of Containers
Namespace:-
Logical Separate places for Kubernetes objects
K8s Networking:-
K8s service- ClusterIP, NodePort, LoadBalancer
Network Policy to block traffic Between pods
Ingress Controller for k8s
Gateway API for k8s
Controllers in k8s-ReplicaSet, Deployment, StatefulSet, DaemonSet
Storage in K8s
Persistent Volumes, PVC
Pod are ephemeral
Agar Configuration sensitive nahi ho->to ConfigMaps otherwise Secrets
Configmaps & secrets
Helm Packaging tool
Prometheus/Graphana, Grafana Loki, Promtail, Pixie, New Relic, Datadog
Service Mesh Istio (Security)
Custom CRD In Go Lang
Kubernetes Best Practices
Side Container & init Container
Upgrade Clusters, Gatekeeper(OPA)
Kubernetes Dashboard
CI-- GitHub Actions , SonarQube, Prisma, Trivy
CD--AgroCD(GitOps)
MLOps
GCP & AWS

Type:- Azure k8s service Architecture

===============================
Kubernetes Day-03 [ 24-May-26 ]
===============================

Deploy k8s Landing Zone using Gemini CLI
Deploy one Netflix pod imperative & Declarative
Create k8s cluster in portal

===============================
Kubernetes Day-04 [ 30-May-26 ]
===============================

Deploy k8s Landing Zone using Gemini CLI
Deploy one Netflix pod imperative & Declarative
Create k8s cluster in portal

Resource:-
  - Resource Group
  - AKS
  - ACR
Terraform Folder Structure:-
modules
  - azurerm_resource_group
  - azurerm_kubernetes_services
  - azurerm_container_registry
environment
  - dev
    - main.tf
    - provider.tf
    - terraform.tfvars

Child, parent concept se generic terraform module banaenge
jisme child module me foreach, nested map, dynamic block, optional attribute, conditional iteration, & logic use karke banayege

ChatGPT:- I want main.tf of resource group child module with for each ..

Kya chahiye?--> AI Harness -->LLM model
AI Harness-(tool)--> Claude Code, Gemini CLI, GitHub Copilot, Codex, Antigravity
Install Gemini CLI
type- gemini cli & copy the npn install -g ..... & pest in power shell

1. Gemini Pro - 1 Saal Free (jio)
2. Install gemini cli
3. Create a folder in computer
4. open terminal in that folder
5. Invoke gemini and login to gemini

Create terraform module for resource group, aks, acr with  foreach, nested map, dynamic block, optional attribute, conditional iteration, on the best practice of the terraform
Can you create a environment folder & dev folder inside that where we will call these module to create rg, aks & acr...


=================================
Kubernetes Day-05 [ 31-May-26 ]
=================================

Requirement:- Run nginx image in  k8s pod from DockerHub

Requirement:- Run nginx image in  k8s pod from ACR
AKS cluster-> Node pool-> Node-> pod-> Container
kubectl is a tool that connects to the API Server & request something
kubectl install process

Pod Banane ka Tarika:-
-------------------
Imperative:-
   - kubectl Command
2**. Declarative:-**
   - YAML file
   - kubectl apply

Portal pr aks cluster banakar local per connection banana hai through kubectl
kubectl ke through Aks cluster connection karne per local per ek .kube/config file Banega jisme aks cluste ka sab details hai
uske bad imperative process se kubectl command se pod banayege
$ kubectl run nginx-pod --image nginx
To see the pod / details
  $ kubectl get pods
  $ kubectl describe pod nginx-pod
To access the pod
$ kubectl port-forward pod/nginx-pod 8080:80

Pod Creation Flow:-
kubectl-->API Server-->ETCD-->Scheduler(watch)<-->API Server-->ETCD(node name update)<-->kubelet(watch)-->containerd--> pod Running-->API Server--> ETCD

===============================
Kubernetes Day-06 [ 06-Jun-26 ]
===============================
Cluster UI-Azure Portal
Install kubectl
az login
az aks get-credentials
kubectl help
kubectl run first-pod --image nginx
kubectl get pods
kubectl exic -it podName bash
kill 1
Automatically new container bn jaega.

Same previous class
How to create multiple container inside pod ?



===============================
Kubernetes Day-07 [ 07-Jun-26 ]
===============================
YAML ka rules:-
Rule1- key:value
     name: aman
     city: indore

Rule2- Indentation (Relationship)
  - Space hi sab kuch
  person
    name: aman
    city: indore
    role: joru_ka_gulam

Rule3- Nested Structure
  home:
    owner: tinku
    room:
      colour: blue
      size: 10feet
 
Rule4- List
  vegetables:
  - alu
    piaz
    bhindi

Rule5- List of object
 person:
  - name: aman
    role: brother
  - name: asish
    role: padana


Declarative Steps:
 - Create file nginx-pod.yaml
 
  API Version: v1
  Kind: Pod
  Metadata:
    name: nginx-pod
  Spec:
   containers:
   - name: nginx
     image: nginx:latest
   - name: firefox
     image: firefox:latest

kubectl apply -f  nginx.yaml
kubectl get pods
kubectl port-forward pod/nginx-pod 9090:80

===============================
Kubernetes Day-08 [ 13-Jun-26 ]
===============================
Kubernetes Document:-
Ek pod ke ander 2 container- firefox & nginx
Best practice- 1 pod ke ander 1 container

1. Ek pod.yaml banana pdega
2. ek pod ke andar ek container ka code likhenge
3. Port forward karke feel karenge
4. Ek aur container add karenge firefox ka
5. Firefox ke port ko forward karenge, firefox se nginx access karenge
6. kubectl apply -f pod.yaml ko apply karenge
7. kubectl get pods
8. kubectl describe pod <Pod Name>

$ kubectc api-resources

kubectl cluster-info ->Basic cluster details
kubectl api-resource --> cluster me kya kya hai sakta haai  usi ke details mil jaegi..
kubectl explain pod --recursive > pod_document.txt

dual_pod.yaml
============

apiVersion: v1
kind: Pod
metadata:
  name: dual-pod
spec:
  containers:
   - name: nginx-container
     image: nginx
 
   - name: firefox-container
     image: linuxserver/firefox
 

$ kubectl get nodes
$ kubectl get pods


===============================
Kubernetes Day-09 [ 14-Jun-26 ]
===============================
1. Ek pod ke ander 2-container banake access karna hai(yaml file)
=> Ip address pod level pr milega

2. Two different pod in Same node ?
   mario-pod

3. Namespace kya hota hai ? kyu hota hai..

4. Two pod in Same namespace/different namespace