docker build -t api-heroes .

docker run -p 80:3000 api-heroes

docker run -p 80:3000 --link mongo:mongo -e MONGO_URL=mongo api-heroes

docker run -p 80:3000 --link maratonakubernetes_mongodb:mongo -e MONGO_URL=mongo api-heroes

docker ps

docker stop dc5aa1bc5f6c

docker ps

docker-compose up 

docker login

docker build -t kennedyrs/api-heroes:v1 .

docker push kennedyrs/api-heroes:v1

docker images | grep api-heroes

docker rm 8efb0c8cd58d

docker rmi 8efb0c8cd58d

docker rmi af0250165384

docker images | grep api-heroes

docker rmi 8efb0c8cd58d

docker ps

docker ps -a

docker rm 2ffc44624865 900a7e137dba 99cd5fbdf2cc 61cffc6ca276 dc5aa1bc5f6c

docker rmi 8efb0c8cd58d

docker images | grep api-heroes

docker-compose up 

docker ps

docker ps -a



## AZURE
```bash
brew update && brew install azure-cli

az login

az account set --subscription "Avaliação Gratuita"

az group create --name k8s-curso --location eastus || brazilsouth

az acr create --resource-group k8s-curso --name k8snewimagescurso --sku Basic

az acr login --name k8snewimagescurso

az acr list --resource-group k8s-curso --output table

docker tag kennedyrs/api-heroes:v1 k8snewimagescurso.azurecr.io/api-heroes:v1

docker images

docker push k8snewimagescurso.azurecr.io/api-heroes:v1 

az acr list --resource-group k8s-curso --output table

ACR=k8snewimagescurso
RESOURCE=k8s-curso
LOCATION=brazilsouth

#-------- CONTAINER SERVICES -------#
az container create --resource-group k8s-curso \
  --name mongo --image mongo \
  --cpu 1 --memory 1 \
  --port 27017 \
  --ip-address public

az container logs --resource-group k8s-curso --name mongo

az container show --resource-group k8s-curso --query ipAddress.ip
MONGO_URL=52.255.208.121

az acr update -n k8snewimagescurso --admin-enabled true

az acr credential show -n k8snewimagescurso --query passwords
PASS=nopqteA=fqIAR7TzimsVo2+33G+9AF8W

az container create --resource-group k8s-curso \
  --name api-heroes --image k8snewimagescurso.azurecr.io/api-heroes:v1 \
  --cpu 1 --memory 1 \
  --port 3000 \
  --environment-variables MONGO_URL=52.255.208.121 \
  --registry-username k8snewimagescurso \
  --registry-password 9xZY9w2TTz+qvn7Yiy9S/q8kHzz5RrvE \
  --ip-address public

API-HEROES_URL=52.191.227.123:3000

az container logs --resource-group k8s-curso --name api-heroes


#-------- AKS -------#
az aks create -g k8s-curso \
  --name k8s-cluster \
  --dns-name-prefix k8s-cluster \
  --generate-ssh-keys \
  --node-count 2

az aks install-cli

az aks get-credentials --resource-group k8s-curso --name k8s-cluster --admin

kubectl get nodes

kubectl config view --raw

kubectl create clusterrolebinding kubernetes-dashboard \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:kubernetes-dashboard

az aks browse --resource-group k8s-curso --name k8s-cluster

clusterUser_k8s-curso_k8s-cluster
#-------- K8s - Pods -------#
kubectl run mongo --image mongo --port 27017

kubectl get pods

kubectl delete pod mongo

kubectl describe pods mongo

kubectl top pod mongo

kubectl get pods --output=wide
10.244.0.8

kubectl run api-heroes \
  --image kennedyrs/api-heroes:v1 \
  --env "MONGO_URL=10.244.0.8" \
  --env "PORT=4000" \
  --replicas 2

kubectl logs api-heroes

kubectl expose pod api-heroes --port 4000 --type LoadBalancer

kubectl get services -w

#-- Declarativo file

Arquivo manifesto json || yml

kubectl create -f heroes-pod.json

kubectl describe pods api-heroes-ff

kubectl delete pod api-heroes-ff

kubectl delete pod -l version=v1

kubectl logs api-heroes-ff

kubectl exec -it api-heroes-ff -- /bin/bash
kubectl exec -it api-heroes-ff -- /bin/sh

kubectl explain pods

kubectl get pod api-heroes-ff -o yaml
kubectl get pod api-heroes-ff -o json


#--------SECRETS

# ------ Services

## --- interativa


```