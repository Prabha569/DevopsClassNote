  --- KUBERNETES ---
  =====================================
Kubernetes Architecture:-

What is Kubernetes ?
Ans:- Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.

2. What is a Kubernetes cluster?

Ans:- A Kubernetes cluster is a set of nodes (machines) that run containerized applications. A cluster has at least one control plane/master node and multiple Node components/worker nodes. The master node manages the cluster, while the worker nodes host and run the applications

 Master Node: It is Responsible for the management of the Kubernetes cluster.
 Worker Node: It is Responsible for running the containers and workloads.

3. What are the components of the Kubernetes control plane/master node?

Ans:-  Master Node: It is Responsible for the management of the Kubernetes cluster. & its components is-
API Server:- The API server is the front-end interface for the Kubernetes control plane that exposes the Kubernetes API
Scheduler:- The Kubernetes scheduler is responsible for scheduling pods to run on available nodes in the cluster based on available resources and other scheduling requirements.
etcd:- etcd is a distributed, reliable, and highly available key-value store used to store the configuration data for the Kubernetes cluster

Controller Manager:- The controller-manager is responsible for running various controller processes such as replication controller & node controller that monitor the state of the cluster and make changes as necessary

Cloud Controller Manager:- The cloud-controller-manager is responsible for managing integration with cloud providers, such as AWS, GCP, or Azure.

4. What are the components of the Kubernetes Node components/worker nodes?

Ans:- Worker Node: It is Responsible for running the containers and workloads. & its components is-
Kubelet:-  The kubelet is an agent that runs on each node and communicates with the Kubernetes API server to manage the container lifecycle.

Kube-proxy:- The kube-proxy is responsible for managing network routing between pods and services in the Kubernetes cluster.

Container Runtime:- A container runtime is responsible for starting and stopping containers on a node. Examples include Docker, containerd, and CRI-O
Pod:- A Pod is the smallest deployable unit in Kubernetes that can contain one or more containers sharing the same network and storage.

 What is a Pod? How is it different from a container?
Difference:-
• Container = packaged application.
• Pod = wrapper around container(s) + metadata + networking.

5. Why is namespace used in Kubernetes?

Ans:- Namespaces in Kubernetes are used for dividing cluster resources between users, enabling multiple users, projects, or teams to operate within the same cluster while providing a scope of resources.

Kubernetes Objects:- &  k8s Networking
=======================================================
Pod:-
ReplicaSet:-
Deployment:-
Service:-
Namespace:-
ConfigMap:-
Secret:-
Volume:-
StatefulSet:-
DaemonSet:-
Job:-

Pod:-
Q)* What is a Pod? How is it different from a container?

Ans:- A Pod is the smallest deployable unit in Kubernetes that can contain one or more containers sharing the same network and storage.
Difference:-
• Container = packaged application.
• Pod = wrapper around container(s) + metadata + networking.

Pod is a collection of container who share shared storage & shared networking...

6. What is pause container & it role ?

Ans:- Pause container is a lightweight infrastructure container created first in every Kubernetes pod. It holds the pod's network namespace, IP address, and shared resources so that all containers inside the pod can share the same networking environment.

2. Networking:-

7. What is Kubernetes Networking ?

Ans:- Kubernetes networking enables communication between Pods, Services, and external users. Every Pod gets its own IP address and can communicate with other Pods without NAT.( Network Address Translation )

8. How do two containers communicate within the same Pod?

Ans:- Containers in the same Pod communicate using localhost (127.0.0.1) because they share the same network namespace.

9. How do Pods communicate with each other?

Ans:-Pods communicate using:
Pod IP Address
Kubernetes Services
DNS Names

10. How do Pods communicate across different Nodes ?

Ans:-Kubernetes networking ensures that Pods can communicate directly across nodes. The CNI plugin handles routing between nodes.

11. What is CNI?

Ans:- CNI (Container Network Interface) is responsible for configuring networking for Pods.  Examples:
Calico
Flannel
Cilium
Weave Net

12. What is a Network Policy?

Ans:- A Network Policy controls traffic flow between Pods, acting like a firewall within the Kubernetes cluster.

3. Service:-
13. What is a Service in Kubernetes?

Ans:- A Service provides a stable endpoint for accessing a group of Pods. Even if Pod IPs change, the Service IP remains constant.
👉 "Kubernetes Service is an abstraction that provides stable networking and load balancing for dynamic pods.
13. What are Kubernetes Services?

Answer: Services expose Pods and provide stable network access. Types:
ClusterIP – Internal communication
NodePort – Exposes service on a port across all nodes
LoadBalancer – Provisions an external load balancer
Ingress – Manages external access with routing rules

14. What are the different types of services in Kubernetes ?

Cluster IP:–  ClusterIP is the default Service type. It is used to expose the service on internal IP within cluster.

Node Port:– It is used to expose the service from outside.

Load Balancer:- It creates external load balancer and assigns external IP to service.

External Name Creating:– It is used expose the service using name.

15. What is Ingress?

Ans:- Ingress is an API object that manages external HTTP and HTTPS access to Services within a cluster.

16. What is CoreDNS?

Ans:- CoreDNS is the DNS server used by Kubernetes for Service discovery and name resolution.

17. What is Service Discovery?

Ans:- Service Discovery allows Pods to find and communicate with Services using DNS names instead of IP addresses.

18. Can Pods have the same IP address?

Ans:- No. Every Pod in a Kubernetes cluster must have a unique IP address.

19. Does a Pod IP change?

Ans:- Yes. When a Pod is recreated, it may receive a new IP address. That's why Services are used for stable communication.

20. Do containers inside the same Pod have different IPs?

Ans:- No. All containers inside a Pod share the same IP address and network namespace.

21. Who assigns an IP address to a Pod?

Ans:- Kubernetes itself does not assign Pod IPs. The CNI plugin (such as Calico, Flannel, or Cilium) assigns and manages Pod IP addresses.

4. Controller:-

22. What is a Controller in Kubernetes ?

Ans:- A Controller is a Kubernetes component that continuously monitors resources and ensures the actual state matches the desired state by creating, deleting, or updating resources automatically.
Example:
If you want 3 Pods running and one Pod crashes, the controller automatically creates a new Pod to maintain 3 running Pods.


5. ReplicaSet Controller:-

23. What is ReplicaSet in Kubernetes ?

Ans:- ReplicaSet is a Kubernetes controller that ensures a specified number of Pod replicas are always running. If a Pod fails or is deleted, ReplicaSet automatically creates a new Pod to maintain the desired state. It provides self-healing and scaling capabilities for Pods.

6. Deployment Controller:-

24. What is Deployment in Kubernetes ?

Ans:- Deployment is a Kubernetes controller that manages ReplicaSets and Pods. It ensures the desired number of Pod replicas are running and provides features such as scaling, self-healing, rolling updates, and rollback. Deployment is the most commonly used controller for managing applications in production environments.

 Deployment Controller ⭐ (Most Important)
---------------------------------
-> Manages ReplicaSets
-> Supports:
     > Rolling updates
      > Rollbacks
-> Zero downtime deployments

👉 Most commonly used in real-world applications
Memory Trick:
👉 Recreate = Stop old → Start new
👉 Rolling Update = Start new → Stop old (one by one)

25. What is Rolling Update in Kubernetes ?

Ans:- Rolling Update is the default Deployment strategy in Kubernetes. It updates Pods gradually by creating new Pods and deleting old Pods one by one. This ensures zero or minimal downtime and allows rollback if the new version has issues.

26. What is Recreate Strategy in Kubernetes ?

Ans:- Recreate is a Deployment strategy in Kubernetes where all old Pods are deleted before new Pods are created. It is simple to implement but causes downtime because the application becomes unavailable during the update process.

27. What is StatefulSet in Kubernetes?

Ans:- StatefulSet is a Kubernetes controller used to deploy and manage stateful applications. It provides stable Pod identities, persistent storage, and ordered deployment/scaling. It is commonly used for databases and distributed systems where each Pod must maintain its own state and identity.

Memory Trick
👉 Deployment = Stateless Apps (Nginx, Web Apps)

👉 StatefulSet = Stateful Apps (MySQL, MongoDB, Kafka)

StatefulSet = Fixed Name + Fixed Storage + Ordered Start/Stop


28. Difference Between Deployment and StatefulSet in Kubernetes
	
Feature	Deployment	StatefulSet
Purpose	Manages stateless applications	Manages stateful applications
Pod Identity	Pods get random names	Pods get fixed names (pod-0, pod-1)
Storage	Shared or ephemeral storage	Dedicated persistent storage per Pod
Scaling	Pods can be created/deleted in any order	Pods are created/deleted in order
Network Identity	No stable network identity	Stable hostname and network
		
Pod Replacement	New Pod may have different name	Recreated Pod keeps same name
Examples	Nginx, Apache, Frontend Apps	MySQL, PostgreSQL, MongoDB, Kafka

29. What is DaemonSet in Kubernetes?

Ans:- DaemonSet is a Kubernetes controller that ensures a copy of a Pod runs on every Node in the cluster. It is commonly used for logging, monitoring, and security agents that need to run on all Nodes. When new Nodes join the cluster, DaemonSet automatically schedules Pods on them.

Memory Trick:-

👉 Deployment = One App, Many Replicas

👉 StatefulSet = Fixed Identity + Storage

👉 DaemonSet = One Pod on Every Node


Volume:-
===========
30. What is a Volume in Kubernetes?

Ans:- A Volume is a storage mechanism that allows data to persist beyond container restarts and enables data sharing between containers.

31. Why is Volume needed?

Ans:- Containers are ephemeral. When a container restarts, data is lost. Volumes provide persistent storage.

Kubernetes volumes are broadly classified into two types:

1. Ephemeral Volume

Ans:- An Ephemeral Volume is a temporary storage volume that exists only for the lifetime of a Pod. When the Pod is deleted, the volume and its data are also removed.

Examples:-
emptyDir
configMap
secret
downwardAPI
rojected
CSI Ephemeral Volume

32. What is an emptyDir Volume?

Ans:- emptyDir is created when a Pod starts and deleted when the Pod is removed. It is used to share data between containers within the same Pod.

33. Can Ephemeral Volumes be shared between Pods?

Answer:
No. Ephemeral Volumes are created for a specific Pod and cannot be shared across multiple Pods.

34. What are common use cases of Ephemeral Volumes?

Answer:

Cache storage
Temporary files
Scratch space
Log processing
Sharing data between containers in the same Pod

35. Why are Ephemeral Volumes not suitable for databases?

Ans:- Because data is deleted when the Pod is deleted. Databases require persistent storage, so Persistent Volumes should be used.

36. Which Ephemeral Volume type is most commonly asked in interviews?

Ans:- emptyDir Volume is the most commonly asked Ephemeral Volume type in Kubernetes interviews.


2. Persistent Volume (PV) (Very Important)

Ans:- A Persistent Volume (PV) is a cluster-wide storage resource in Kubernetes that exists independently of Pods. It continues to exist even after a Pod is deleted, ensuring that application data is retained.

Examples:-
NFS Storage
AWS EBS
Azure Disk
Azure File
Google Persistent Disk
Ceph Storage
iSCSI

37. Why do we need Persistent Volumes?

Ans:- Pods are ephemeral (temporary). When a Pod is deleted, its local data is lost. Persistent Volumes provide permanent storage for applications such as databases.

38. What are the access modes of Persistent Volumes?

Ans:- ReadWriteOnce (RWO)
Mounted as read-write by one node.
ReadOnlyMany (ROX)
Mounted as read-only by multiple nodes.
ReadWriteMany (RWX)
Mounted as read-write by multiple nodes.

39. What are the reclaim policies of a Persistent Volume?

Ans:- Retain
Data remains even after PVC deletion.
Delete
Storage is deleted automatically.
Recycle (Deprecated)
Data is scrubbed and reused.

40. What happens if a Pod using a PV is deleted?

Ans:- The Pod is deleted, but the Persistent Volume and data remain intact.

41. Can multiple Pods use the same PV?

Ans:- Yes, if the storage supports ReadWriteMany (RWX) access mode.

42. What are the types of Persistent Volume provisioning in Kubernetes?

Ans:- There are two types of PV provisioning:
Static Provisioning
Dynamic Provisioning

43. What is Static Provisioning?

Ans:- In Static Provisioning, the Kubernetes administrator manually creates Persistent Volumes (PVs) before users create PVCs.

Example Flow:-

Admin Creates PV
       ↓
User Creates PVC
       ↓
PVC Binds to PV

44. What is Dynamic Provisioning?

Ans:- In Dynamic Provisioning, Kubernetes automatically creates a PV when a PVC requests storage. This is achieved using a StorageClass.

Example Flow:-

StorageClass
      ↓
User Creates PVC
      ↓
PV Auto Created
      ↓
PVC Bound to PV

45. Why is Dynamic Provisioning preferred over Static Provisioning?
Ans:-
No need for manual PV creation.
Faster and automated.
Easier to manage in large clusters.
Better scalability.

46. What is the role of StorageClass in Dynamic Provisioning?

Ans:- A StorageClass defines how storage should be provisioned. When a PVC refers to a StorageClass, Kubernetes automatically creates the required PV.

47. What is NFS Persistent Volume?

Ans:- NFS (Network File System) allows multiple Pods to access the same storage over a network.

Use Case: Shared storage among multiple Pods.

48. What is Azure File PV?

Ans:- Azure File provides shared file storage and supports multiple Pods accessing the same storage.

49-Why do we use Secrets with Persistent Volumes?

Ans:- Secrets are used with Persistent Volumes to securely store storage credentials such as usernames, passwords, access keys, and authentication tokens required to access external storage systems like NFS, Ceph, AWS EBS, or Azure Disks.













