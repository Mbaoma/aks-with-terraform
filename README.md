# aks-with-terraform
setup AKS to deploy and manage containerized applications more easily with a fully managed Kubernetes service using Terraform as Iaac tool

### Configure Azure CLI
```bash
brew install azure-cli
```
If your OS is not Mac, check [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### Login to Azure
```bash
az login
```

### Install Terraform
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update
brew upgrade hashicorp/tap/terraform
```
For other OS types, check [here](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### Provision the AKS Cluster
```bash
terraform init
terraform plan
terraform apply
```

- Configure kubectl
```bash
az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)
```

Result
```bash
Merged "myk8s" as current context in /Users/omarrr/.kube/config
```

### Deploy an Nginx app
```bash
$ kubectl create -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/controllers/nginx-deployment.yaml
deployment.apps/nginx-deployment created
```

### Check deployments
```bash
$ kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           3m58s
```

### List of pods
```bash
$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-66b6c48dd5-gsh8k   1/1     Running   0          5m14s
nginx-deployment-66b6c48dd5-qzkhc   1/1     Running   0          5m14s
nginx-deployment-66b6c48dd5-ztvwf   1/1     Running   0          5m14s
```

### Delete clusters
```bash
terraform destroy --auto-approve
```
