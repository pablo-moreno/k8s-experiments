# kubectl examples

Create namespace 001

```bash
kubectl create namespace 001
```

Set 001 namespace as current context:

```bash
kubectl config set-context --current --namespace=001
```

Create deployment `hello-app`:

```bash
kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:1.0 --port=8080
```

Create service for deployment `hello-app`:

```bash
kubectl expose deployment hello-app
```

Create ingress with prefix rule:

```bash
kubectl create ingress hello-app --rule=hello.k8s.local/*=hello-app:8080
```

Scale deployment `hello-app` to 4 replicas:

```bash
kubectl scale deployment hello-app --replicas=4
```

Get minikube cluster ip:

```bash
minikube ip
```

> !! Edit `/etc/hosts` to add the domain `hello.k8s.local` associated with the `minikube ip` result.

Use `curl` to check that the load balancer is working:

```bash
watch curl http://hello.k8s.local
```


## Extra

Create another deployment for v2

```bash
kubectl create deployment hello-app-2 --image=gcr.io/google-samples/hello-app:2.0 --port=8080
```

Expose the deployment

```bash
kubectl expose deployment hello-app-2
```

Delete previous ingress: 

```bash
kubectl delete ingress hello-app
```

Create a new ingress with two rules:

```bash
kubectl create ingress hello-app --rule=hello.k8s.local/v1/*=hello-app:8080 --rule=hello.k8s.local/v2/*=hello-app-2:8080
```

Check redirections:

```bash
curl -sL http://hello.k8s.local/v1/
curl -sL http://hello.k8s.local/v2/
```
