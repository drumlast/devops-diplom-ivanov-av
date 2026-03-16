
# Порядок запуска проекта

## 1. Подготовка bootstrap

```
cd bootstrap
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform apply
```

Сохранить ключ сервисного аккаунта

```
terraform output -raw sa_key > ../sa-key.json
```

## 2. Развёртывание инфраструктуры

```
cd ../terraform
cp terraform.tfvars.example terraform.tfvars
cp backend.hcl.example backend.hcl

terraform init -backend-config=backend.hcl
terraform apply
```

## 3. Получить kubeconfig

```
yc managed-kubernetes cluster get-credentials <cluster_name> --external
```

Проверка

```
kubectl get nodes
kubectl get pods -A
```

## 4. Установить мониторинг

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

kubectl apply -f ../k8s/namespaces/monitoring.yaml

helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack   --namespace monitoring   -f ../k8s/monitoring/values.yaml
```

## 5. Собрать docker image

```
docker build -t cr.yandex/<registry_id>/nginx-test:latest ../app
docker push cr.yandex/<registry_id>/nginx-test:latest
```

## 6. Деплой приложения

```
kubectl apply -f ../k8s/namespaces/app.yaml
kubectl apply -f ../k8s/app/deployment.yaml
kubectl apply -f ../k8s/app/service.yaml
```

## 7. Проверка

```
kubectl get svc -A
```

Получить внешний IP сервиса.

Открыть

```
http://<external_ip>
```

## 8. Удаление инфраструктуры

```
terraform destroy
```
