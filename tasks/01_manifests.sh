function manifests_init() {
    task_setup "manifests" "Apply manifests" "Apply Kubernetes manifests"
}

function manifests_run() {
    log_info "Applying base manifests"
    kubectl apply -f base

    log_info "Applying Argo CD manifests"
    kubectl create ns argocd
    kubectl apply -n argocd -f /argocd

    return ${E_SUCCESS}
}