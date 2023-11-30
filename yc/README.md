# Prepare for yc and managed Kubernetes cluster crerating: 

- yc:

```bash
yc init
yc config list
```

This step (yc init) is enough to create a VM. 

But to create a managed Kubernetes cluster, you also need to create a key and service accounts. 

- KMS symmetric key:

```
yc kms symmetric-key create \
  --name my-key \
  --default-algorithm aes-256 \
  --rotation-period 87600h
yc kms symmetric-key get my-key
yc kms symmetric-key list
```

- Service accounts:

```bash
yc iam service-account create --name my-k8s-sa
yc iam service-account get my-k8s-sa
yc iam service-account create --name my-node-sa
yc iam service-account get my-node-sa
yc iam service-account list
```

