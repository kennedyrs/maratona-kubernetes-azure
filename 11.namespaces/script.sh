kubectl get namespaces

kubectl create namespace development
kubectl create namespace production

kubectl --namespace development run nginx --image nginx

kubectl get pods --namespace development

kubectl config set-context $(kubectl config current-context) --namespace development

kubectl delete namespace development
kubectl delete namespace production

kubectl create -f 11.namespaces/1.namespace-dev.json -f 11.namespaces/2.namespace-prod.json