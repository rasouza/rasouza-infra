#!/usr/bin/env sh
echo "127.0.0.1 users.diary.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=diary-users' --data 'url=http://users.diary:8000'
curl -i -X POST --url http://localhost:8001/services/diary-users/routes --data 'hosts[]=users.diary.local'

echo "127.0.0.1 grafana.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=grafana' --data 'url=http://grafana.istio-system:3000'
curl -i -X POST --url http://localhost:8001/services/grafana/routes --data 'hosts[]=grafana.local'

echo "127.0.0.1 kiali.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=kiali' --data 'url=http://kiali.istio-system:20001'
curl -i -X POST --url http://localhost:8001/services/kiali/routes --data 'hosts[]=kiali.local'

echo "127.0.0.1 prometheus.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=prometheus' --data 'url=http://prometheus.istio-system:9090'
curl -i -X POST --url http://localhost:8001/services/prometheus/routes --data 'hosts[]=prometheus.local'

echo "127.0.0.1 jaeger.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=jaeger' --data 'url=http://tracing.istio-system:9411'
curl -i -X POST --url http://localhost:8001/services/jaeger/routes --data 'hosts[]=jaeger.local'

echo "127.0.0.1 api.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=api' --data 'url=http://localhost:8001'
curl -i -X POST --url http://localhost:8001/services/api/routes --data 'hosts[]=api.local'

echo "127.0.0.1 argocd.local" >> /etc/hosts
curl -i -X POST --url http://localhost:8001/services/ --data 'name=argocd' --data 'url=https://argocd-server.argocd'
curl -i -X POST --url http://localhost:8001/services/argocd/routes --data 'hosts[]=argocd.local'