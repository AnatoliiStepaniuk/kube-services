#Creating cluster:

Setup gcloud cli:
`gcloud config set project PROJECT-ID`
`gcloud config set compute/zone COMPUTE-ZONE`

Create a cluster:
`gcloud container clusters create my-cluster --num-nodes=1`

Create IPs:
```
gcloud compute addresses create service-a-ip
gcloud compute addresses create front-service-ip
```

And specify them in my-values.yaml (if you use Linux, avoid `.bak` in `sed` commands):
```
export SERVICE_A_IP=$(gcloud compute addresses describe service-a-ip | grep address: | sed 's/address: //g')
export FRONT_SERVICE_IP=$(gcloud compute addresses describe front-service-ip | grep address: | sed 's/address: //g')
cp kubergang/values.yaml kubergang/my-values.yaml
sed -i .bak 's/SERVICE_A_IP/'$SERVICE_A_IP'/g' kubergang/my-values.yaml
sed -i .bak 's/FRONT_SERVICE_IP/'$FRONT_SERVICE_IP'/g' kubergang/my-values.yaml
```

Update IPs in DNS records for service-a.kubergang.com and the.kubergang.com

#Helm commands:

`helm repo add kubergang https://anatoliistepaniuk.github.io/kube-services`

`helm repo update`

`helm search repo kubergang --versions`

`helm upgrade kubergang kubergang/kubergang --install --create-namespace --values=kubergang/my-values.yaml --version=1.3.6`

## Creating Chart Version

Make changes to templates, specify new chart version in Chart.yaml, and create new chart:
`./create_chart.sh`

Push changes to Github.

Now you can upgrade your release to new version:
`helm repo update`
`helm upgrade kubergang kubergang/kubergang --install --create-namespace --values=kubergang/my-values.yaml --version=1.3.7`

Validate installation:
`helm test kubergang`