To create cluster, run:

`kubectl apply -f .`

This will create 2 services: Public (A) and Private (B)
Both have REST routes `/a` and `/b `
(`/b` should be unavailable, since Service B is private)

Public service A also has route `/ab` with will fetch data from private `/b` route.


Kubernetes templates were generated with this commands:
 
`kubectl create deployment service-b --image=anatoliistepaniuk/service-b:latest --dry-run=client -o=yaml > deployment-b.yaml | kubectl apply -f deployment-b.yaml`

`kubectl expose deployment service-b --type=ClusterIP --port=80 --target-port=8080 --dry-run=client -o=yaml > service-b.yaml | kubectl apply -f service-b.yaml`

`kubectl create deployment service-a --image=anatoliistepaniuk/service-a:latest --dry-run=client -o=yaml > deployment-a.yaml | kubectl apply -f deployment-a.yaml`

`kubectl expose deployment service-a --type LoadBalancer --port 80 --target-port 8081 --dry-run=client -o=yaml > service-a.yaml | kubectl apply -f service-a.yaml`

Repositories for services:

https://github.com/AnatoliiStepaniuk/service-a

https://github.com/AnatoliiStepaniuk/service-b
