# Personal Websites

This repository contains two separate portfolio websites under the `leexusos.com` domain:

- `leezhang.leexusos.com`
- `jacquelinezhang.leexusos.com`

Both sites use the same plain HTML/CSS/JavaScript template approach for the first version, but they are built and deployed as separate Docker images.

## Repository Layout

```text
personal-websites/
  sites/
    lee/
      src/
        index.html
        profile-photo.jpeg
        styles.css
        script.js
      Dockerfile
      .dockerignore
    jacqueline/
      src/
        index.html
        profile-photo.jpeg
        styles.css
        script.js
      Dockerfile
      .dockerignore
  docker-compose.yml
  README.md
```

## Local Development

Run both sites locally:

```bash
docker compose up --build
```

Local URLs:

- `http://localhost:8080` for Lee
- `http://localhost:8081` for Jacqueline

## Azure Deployment Direction

Planned hosting target:

- Azure Container Registry for Docker images
- Azure Container Apps for running each website
- Custom subdomains for each portfolio
- Managed TLS certificates on the public endpoints

Manual deployment comes first. CI/CD automation can be added later.

## Terraform Bootstrap For Azure State

Step 1 of the Azure deployment creates the Terraform remote state backend in Azure.

Bootstrap target:

- Resource group: `rg-leenuxos`
- Storage account: `leenuxostfstate816`
- Blob container: `tfstate`
- Region: `South Central US`

Files live under `infra/bootstrap/`.

### Prerequisites

- Terraform installed locally
- Azure CLI installed locally
- Logged into Azure with the correct subscription selected

```bash
az login
az account set --subscription "<your-subscription-id>"
az account show --query "{name:name, id:id}" -o table
```

### Configure Bootstrap Variables

Copy the example variables file and fill in your Azure subscription ID:

```bash
cd infra/bootstrap
cp terraform.tfvars.example terraform.tfvars
```

### Run Bootstrap

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

### Expected Outputs

After apply, Terraform will output the backend values needed by the future main Azure deployment:

- backend resource group name
- backend storage account name
- backend container name
- recommended state key: `lee-prod.tfstate`

### Future Backend Configuration

The main Lee Azure stack should later use a backend config like this:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-leenuxos"
    storage_account_name = "leenuxostfstate816"
    container_name       = "tfstate"
    key                  = "lee-prod.tfstate"
  }
}
```

## Lee Production Azure Stack

Step 2 deploys Lee's production hosting resources in Azure using the remote backend from Step 1.

Files live under `infra/lee-prod/`.

Provisioned resources:

- Resource group for Lee production
- Azure Container Registry
- Log Analytics workspace
- Azure Container Apps environment
- User-assigned managed identity
- Role assignment granting `AcrPull` on ACR
- Public Azure Container App for Lee's site

### Step 2 Prerequisites

- Step 1 already applied successfully
- Azure CLI logged into the correct subscription
- Docker available locally
- Lee image built and pushed to ACR before the final app rollout

### Configure Step 2 Variables

```bash
cd infra/lee-prod
cp terraform.tfvars.example terraform.tfvars
```

Update names if needed, especially if the ACR name is already taken globally.

### Initialize And Plan Step 2

```bash
cd infra/lee-prod
terraform init
terraform fmt -check
terraform validate
terraform plan
```

### Build And Push Lee Image

After Step 2 resources exist, log into ACR, build Lee's image, and push it:

```bash
az acr login --name leenuxosleeacr816
docker build -t leenuxosleeacr816.azurecr.io/lee-site:latest ./sites/lee
docker push leenuxosleeacr816.azurecr.io/lee-site:latest
```

If deploying a different version, change `image_tag` in `terraform.tfvars` and apply again.

### Apply Step 2

```bash
terraform apply
```

### Expected Outputs

- ACR name and login server
- Container Apps environment name
- Container App name
- Default Azure FQDN for Lee's site

### Custom Domain Comes Later

The custom domain `leezhang.leenuxos.com` is not yet wired in this step. That will come after the app is running and the default Azure Container App FQDN is available.
