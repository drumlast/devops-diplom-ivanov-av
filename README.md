
# Дипломный практикум в Yandex Cloud

## Цели
Подготовить облачную инфраструктуру в Yandex Cloud, развернуть Kubernetes‑кластер,
задеплоить тестовое приложение, настроить мониторинг и CI/CD.

## Используемые инструменты
- Terraform
- Yandex Cloud
- Yandex Managed Service for Kubernetes
- Docker
- Kubernetes
- kube‑prometheus‑stack (Prometheus + Grafana)
- GitHub Actions

## Структура репозитория
```
bootstrap/        создание service account и bucket для Terraform backend
terraform/        основная инфраструктура (VPC, подсети, Kubernetes, registry)
app/              тестовое приложение (nginx)
k8s/              Kubernetes манифесты приложения и мониторинга
.github/workflows CI/CD pipeline
img/              скриншоты для отчёта
CHECKLIST.md      порядок запуска
```

## Результат выполнения задания

После выполнения CHECKLIST.md должны быть получены:

- инфраструктура созданная Terraform
- Kubernetes кластер
- docker image тестового приложения Docker image
- приложение доступно по HTTP
- Grafana доступна по HTTP
- CI/CD pipeline для сборки и деплоя
- возможность полностью удалить инфраструктуру командой

```
terraform destroy
```

## Скриншоты

### Инфраструктура
![infra](img/1-1.png)
![infra](img/1-2.png)

### Kubernetes
![k8s](img/2-1.png)

### Docker image list
![k8s](img/6.png)

### Grafana
![grafana](img/3.png)
![grafana](img/3-1.png)
![grafana](img/3-2.png)
![grafana](img/3-3.png)

### CI/CD
![cicd](img/5-1.png)
![cicd](img/5-2.png)
![cicd](img/5-3.png)
