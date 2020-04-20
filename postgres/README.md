## NOTES
#### Please be patient while the chart is being deployed

PostgreSQL can be accessed through Pgpool via port 5432 on the following DNS name from within your cluster:

    postgresql-ha-1587408021-pgpool.postgres.svc.cluster.local

Pgpool acts as a load balancer for PostgreSQL and forward read/write connections to the primary node while read-only connections are forwarded to standby nodes.

To get the password for "postgres" run:

    export POSTGRES_PASSWORD=$(kubectl get secret --namespace postgres postgresql-ha-1587408021-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)

To get the password for "repmgr" run:

    export REPMGR_PASSWORD=$(kubectl get secret --namespace postgres postgresql-ha-1587408021-postgresql -o jsonpath="{.data.repmgr-password}" | base64 --decode)

To connect to your database run the following command:

    kubectl run postgresql-ha-1587408021-client --rm --tty -i --restart='Never' --namespace postgres --image bitnami/postgresql:11 --env="PGPASSWORD=$POSTGRES_PASSWORD"  \
        --command -- psql -h postgresql-ha-1587408021-pgpool -p 5432 -U postgres -d postgres

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace postgres svc/postgresql-ha-1587408021-pgpool 5432:5432 &
    psql -h 127.0.0.1 -p 5432 -U postgres -d postgres