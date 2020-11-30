kubectl create secret docker-registry acr-credentials \
  --docker-server=k8simagescurso.azurecr.io \
  --docker-username=k8simagescurso \
  --docker-password=9xZY9w2TTz+qvn7Yiy9S/q8kHzz5RrvE \
  --docker-email=kennedywork202@gmail.com
  
kubectl get secret
kubectl get secret acr-credentials
kubectl describe secret acr-credentials