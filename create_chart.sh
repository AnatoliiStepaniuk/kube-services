helm package kubergang -d docs/
helm repo index docs --url https://anatoliistepaniuk.github.io/kube-services
git add docs/*
