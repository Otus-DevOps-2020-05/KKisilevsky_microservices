# KKisilevsky_microservices
KKisilevsky microservices repository !

docker run -d --network=reddit --network-alias=db_post --network-alias=db_comment -v reddit_db:/data/db mongo:latest

docker run -d --network=reddit --network-alias=postik -e POST_DATABASE_HOST=db_post kkisilevsky/post:1.0

docker run -d --network=reddit --network-alias=commentik -e COMMENT_DATABASE_HOST=db_comment kkisilevsky/comment:1.0

docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST=postik -e COMMENT_SERVICE_HOST=commentik kkisilevsky/ui:1.0

> Создание Docker-machine

```
docker-machine create \
 --driver generic \
 --generic-ip-address=<ПУБЛИЧНЫЙ_IP_СОЗДАНОГО_ВЫШЕ_ИНСТАНСА> \
 --generic-ssh-user yc-user \
 --generic-ssh-key ~/.ssh/id_rsa \
 docker-host

```

> Работа с docker-machine в текущей сессии 

```
eval $(docker-machine env docker-host)
```

## GKE Terraform

curl https://sdk.cloud.google.com | bash

gcloud init

gcloud projects create cloud-nation-k8s

gcloud config set project cloud-nation-k8s

gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME


Привязать к платежному аккаунту !!

gcloud projects add-iam-policy-binding $PROJECT_NAME --member serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com --role roles/container.admin
gcloud projects add-iam-policy-binding $PROJECT_NAME --member serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com --role roles/compute.admin
gcloud projects add-iam-policy-binding $PROJECT_NAME --member serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com --role roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECT_NAME --member serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin

gcloud services enable compute.googleapis.com
gcloud services enable servicenetworking.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable container.googleapis.com



gcloud iam service-accounts keys create terraform-gke-keyfile.json --iam-account=$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com

gsutil mb -p $PROJECT_NAME -c regional -l europe-west4 gs://k8s-infra-bucket/

gsutil versioning set on gs://k8s-infra-bucket/

gsutil iam ch serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com:legacyBucketWriter gs://k8s-infra-bucket/

terraform init

terraform fmt .

terrafrom plan

terrafrom apply

gcloud container clusters list
gcloud container clusters get-credentials gke-cluster --zone europe-west4-a

## Install Dashboard

kubectl apply -f dashboard.yaml ### (namespace kubernetes-dashboard)

kubectl proxy

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#!/login

