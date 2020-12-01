az acr login --name k8simagescurso

docker build -t k8simagescurso.azurecr.io/api-heroes:latest .

docker push k8simagescurso.azurecr.io/api-heroes:latest

kubectl apply -f hero-deploy.json --record

kubectl get deploy api-heroes-deployment

kubectl rollout history deployment api-heroes-deployment

kubectl rollout status deployment api-heroes-deployment

kubectl rollout undo deployment api-heroes-deployment --to-revision 2

kubectl rollout pause deployment api-heroes-deployment 
kubectl rollout resume deployment api-heroes-deployment 

kubectl replace -f 6.rolling-updates/hero-deploy-2.json

kubectl set image deployment api-heroes-deployment \
  api-heroes=k8simagescurso.azurecr.io/api-heroes:v1 \
  --record