# Prepare for yc and managed Kubernetes cluster crerating: 

- yc:

```bash
yc init
yc config list
```

This step (yc init) is enough to create a VM. 

But to create a managed Kubernetes cluster, you also need to create a Key and Service Accounts and add roles for Service Accounts. 

- KMS symmetric key:

```
yc kms symmetric-key create \
  --name my-key \
  --default-algorithm aes-256 \
  --rotation-period 87600h
yc kms symmetric-key get my-key
yc kms symmetric-key list
```

- Service Accounts:

```bash
yc iam service-account create --name my-k8s-sa
yc iam service-account get my-k8s-sa
yc iam service-account create --name my-node-sa
yc iam service-account get my-node-sa
yc iam service-account list
```

- Roles for Service Accounts:

```bash
yc iam role list
yc iam service-account list
yc config list
yc resource-manager folder list-access-bindings <folder-id>
```

```bash
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role vpc.publicAdmin
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role load-balancer.admin
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role k8s.clusters.agent
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role logging.writer
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-node-sa-id> --role container-registry.images.puller
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-node-sa-id> --role container-registry.images.pusher
yc resource-manager folder list-access-bindings <folder-id>
```

When creating a cluster in the browser, using the management console, service accounts with the above roles are automatically created. 

These roles are enough for the cluster to work. 

But if you want and need it for some reason, then you can add, for example, some of the following roles: 

```bash
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role admin
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role editor
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role k8s.admin
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-k8s-sa-id> --role k8s.editor
yc resource-manager folder add-access-binding <folder-id> --subject serviceAccount:<my-node-sa-id> --role container-registry.images.scanner
yc resource-manager folder list-access-bindings <folder-id>
```

