kubectl get pods --output wide

kubectl expose -f 3.replicasets/heroes-rc.json \
  --port 4000 \
  --type LoadBalancer


kubectl expose pod mongo \
  --port 27017 \
  --type NodePort \
  --name mongo-svc