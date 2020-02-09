# Terminal 
A tiny container equiped with a shell to learn some tricks :/

# Build 
```
docker build  --build-arg USER=sailor  -t yurilz/terminal:latest . 
```
# Installation 

## Install Nginx Ingress Controller 
[https://kubernetes.github.io/ingress-nginx/deploy/](Follow this documentation to install it)
## Install jetstack Cert-Manager 
[https://github.com/jetstack/cert-manager](source)

```
kubectl create ns cert-manager; kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.12.0/cert-manager.yaml
```
## Create Let's Encrypt Issue 
``
cat <<EOF | kubectl create -f -
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
  namespace: cert-manager
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: <your-email> 
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-prod
    # Enable the HTTP-01 challenge provider
    solvers:
    - http01:
        ingress:
          class: nginx
EOF
``

## Install Terminal 

```
helm install my-terminal ./terminal-chart
```
