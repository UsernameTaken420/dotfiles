Kubernetes solves the following problem: how do I abstract a heterogeneous fleet of nodes and APIs through a unified layer, encompassing networking, storage, scheduling and HA?
## Components
- Control Plane: handles the cluster settings and allows pods to be spun up, also coordinates workloads
- `kube-proxy`: manipulates iptables on every host so that a service is known and addressable across the cluster
- `kubelet`: agent inside pods that spins up containers
## Usage
- `kubectl create namespace [name]` create a namespace
- `kubectl --namespace [namespace] -f filename.yaml` create from file definition
- `kubectl --namespace [namespace] get all` display all resources deployed on namespace
- `kubectl get [resource type]` gets all resources of a certain type (i.e: pods, deployments, etc)
- `kubectl events` show recent events in the cluster
- `kubectl logs [pod name]` see the logs for a given pod
	- `-f` to follow the logs

`kubectl describe [resource]` prints information on the resource in the following format
```
Name:              nginx-deployment
Namespace:         podstest
Labels:            run=nginx-deployment
Annotations:       <none>
Selector:          app=nginx
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.43.221.45
IPs:               10.43.221.45
Port:              <unset>  80/TCP
TargetPort:        80/TCP
Endpoints:         10.42.0.14:80
Session Affinity:  None
Events:            <none>
```

`kubectl get pods -A --no-headers | fzf | awk '{print $2, $1}' | xargs -n 2 sh -c 'kubectl describe pod $0 -n $1'`