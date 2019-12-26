#!/usr/bin/env sh
echo "\n127.0.0.1 users.diary.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=diary-users' --data 'url=http://users.diary:8000'
curl -i -X POST --url http://localhost:8001/services/diary-users/routes --data 'hosts[]=users.diary.local'

echo "\n127.0.0.1 grafana.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=grafana' --data 'url=http://grafana.istio-system:3000'
curl -i -X POST --url http://localhost:8001/services/grafana/routes --data 'hosts[]=grafana.local'

echo "\n127.0.0.1 kiali.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=kiali' --data 'url=http://kiali.istio-system:20001'
curl -i -X POST --url http://localhost:8001/services/kiali/routes --data 'hosts[]=kiali.local'

echo "\n127.0.0.1 prometheus.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=prometheus' --data 'url=http://prometheus.istio-system:9090'
curl -i -X POST --url http://localhost:8001/services/prometheus/routes --data 'hosts[]=prometheus.local'

echo "\n127.0.0.1 jaeger.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=jaeger' --data 'url=http://tracing.istio-system:9411'
curl -i -X POST --url http://localhost:8001/services/jaeger/routes --data 'hosts[]=jaeger.local'

echo "\n127.0.0.1 api.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=api' --data 'url=http://localhost:8001'
curl -i -X POST --url http://localhost:8001/services/api/routes --data 'hosts[]=api.local'

echo "\n127.0.0.1 argocd.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=argocd' --data 'url=https://argocd-server.argocd'
curl -i -X POST --url http://localhost:8001/services/argocd/routes --data 'hosts[]=argocd.local'

echo "\n127.0.0.1 logs.local" | sudo tee -a /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=logs' --data 'url=http://kibana.logging:5601'
curl -i -X POST --url http://localhost:8001/services/logs/routes --data 'hosts[]=logs.local'
