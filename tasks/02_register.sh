function register_init() {
    task_setup "register" "Register APIs" "Register components in API Gateway"
}

function register_run() {
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=diary-users' --data 'url=http://users.diary:8000'
    curl -i -X POST --url http://localhost:8001/services/diary-users/routes --data 'hosts[]=users.diary.local'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=grafana' --data 'url=http://grafana.istio-system:3000'
    curl -i -X POST --url http://localhost:8001/services/grafana/routes --data 'hosts[]=grafana.local'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=kiali' --data 'url=http://kiali.istio-system:20001'
    curl -i -X POST --url http://localhost:8001/services/kiali/routes --data 'hosts[]=kiali.local'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=prometheus' --data 'url=http://prometheus.istio-system:9090'
    curl -i -X POST --url http://localhost:8001/services/prometheus/routes --data 'hosts[]=prometheus.local'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=jaeger' --data 'url=http://tracing.istio-system:9411'
    curl -i -X POST --url http://localhost:8001/services/jaeger/routes --data 'hosts[]=jaeger.local'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=api' --data 'url=http://localhost:8001'
    curl -i -X POST --url http://localhost:8001/services/api/routes --data 'hosts[]=api.local'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=argocd' --data 'url=https://argocd-server.argocd'
    curl -i -X POST --url http://localhost:8001/services/argocd/routes --data 'hosts[]=argocd.local&https_redirect_status_code=302&protocols[]=https'
    curl -i -X POST --url http://localhost:8001/services/ --data 'name=logs' --data 'url=http://kibana.logging:5601'
    curl -i -X POST --url http://localhost:8001/services/logs/routes --data 'hosts[]=logs.local'
}