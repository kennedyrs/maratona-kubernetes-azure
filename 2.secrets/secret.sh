kubectl create secret docker-registry acr-credentials \
  --docker-server=k8snewimagescurso.azurecr.io \
  --docker-username=k8snewimagescurso \
  --docker-password=nopqteA=fqIAR7TzimsVo2+33G+9AF8W \
  --docker-email=kennedywork202@gmail.com
  
kubectl get secret
kubectl get secret acr-credentials
kubectl describe secret acr-credentials