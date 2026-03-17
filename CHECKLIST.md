
# Порядок запуска проекта

## 1. Подготовка bootstrap

```
cd bootstrap
cp terraform.tfvars.example terraform.tfvars
export TF_VAR_token="$(yc iam create-token)"
terraform init
terraform apply
```

Сохранить ключ сервисного аккаунта

```
terraform output -raw terraform_sa_key_json > ../sa-key.json
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

Проверка существования кластера и его имени

```
yc managed-kubernetes cluster list
```

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

kubectl get pods -n monitoring
kubectl get svc -n monitoring
```
Получить пароль Grafana:
```
kubectl -n monitoring get secret kube-prometheus-stack-grafana \
  -o jsonpath="{.data.admin-password}" | base64 -d ; echo
  ```

## 5. Сборка Docker image

```
git add .
git commit -m "test ci"
git push origin main
```

Результат:

собирается Docker image

image отправляется в Yandex Container Registry с тегом latest

Проверка:

открыть GitHub → Actions

убедиться, что workflow ci завершился успешно

## 6. Деплой приложения в Kubernetes

```
git tag v1.0.0
git push origin v1.0.0
```

Результат:

собирается Docker image с тегом v1.0.0

image отправляется в Container Registry

выполняется деплой в Kubernetes

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
