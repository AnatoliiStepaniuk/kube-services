
`helm repo add kubergang https://anatoliistepaniuk.github.io/kube-services`

`helm repo update`

`helm search repo kubergang --versions`

`helm install kubergang kubergang/kubergang --version 1.3.0`

Make changes to templates, specify new chart version in Chart.yaml, and create new chart:
`./create_chart.sh`

Push changes to Github.

Now you can upgrade your release to new version:
`helm repo update`
`helm upgrade kubergang kubergang/kubergang --version 1.3.2`