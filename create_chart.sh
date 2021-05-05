helm package . -d docs/
helm repo index docs --url https://anatoliistepaniuk.github.io/kube-services --merge docs/index.yaml
git add docs/*
