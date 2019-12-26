function hosts_init() {
    task_setup "hosts" "Register DNS" "Register DNS"
}

function hosts_run() {
    log_info "Writing to /etc/hosts"

    echo -e "\n\n# Diary Infra\n" | sudo tee -a /etc/hosts
    echo "127.0.0.1 grafana.local" | sudo tee -a /etc/hosts
    echo "127.0.0.1 kiali.local" | sudo tee -a /etc/hosts
    echo "127.0.0.1 prometheus.local" | sudo tee -a /etc/hosts
    echo "127.0.0.1 jaeger.local" | sudo tee -a /etc/hosts
    echo "127.0.0.1 api.local" | sudo tee -a /etc/hosts
    echo "127.0.0.1 argocd.local" | sudo tee -a /etc/hosts
    echo "127.0.0.1 logs.local" | sudo tee -a /etc/hosts
}