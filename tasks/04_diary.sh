function diary_init() {
    task_setup "diary" "Install components" "Install Diary components"
}

function diary_run() {
    if ask "Do you want to install Diary components?"; then
        log_info "Installing Users"
        echo "127.0.0.1 users.diary.local" | sudo tee -a /etc/hosts
        curl -i -X POST --url http://localhost:8001/services/ --data 'name=diary-users' --data 'url=http://users.diary:8000'
        curl -i -X POST --url http://localhost:8001/services/diary-users/routes --data 'hosts[]=users.diary.local'
    fi
}