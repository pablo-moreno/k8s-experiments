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
