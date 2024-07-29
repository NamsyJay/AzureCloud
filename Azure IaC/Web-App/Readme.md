![image](https://github.com/NamsyJay/AzureCloud/assets/50235388/76ed3c7c-05b1-43e8-a74b-0b5aa8cee800)

## This will guide you through the process of deploying a website to Microsoft Azure using Terraform. This step will equip you with the essential skills to seamlessly deploy your website with confidence.


```
Terraform init
```
### Initialises Terraform in the folder

```
Terraform plan
```
### Displays resources that will be provisioned in Azure

```
Terraform apply --auto-approve
```

## SECTION 2: ADVANCED COMMANDS IN TERRAFORM
### PART 1
### Remote Backend for Terraform State
It serves as a reference for Terraform to map real-world resources to your configuration, keep track of metadata, and improve performance for large infrastructures.

### Purpose Of The Terraform State
### 1. Mapping to Real-World Resources:
Terraform state acts as a database mapping your configuration to the actual resources created in your infrastructure. This helps Terraform understand what it has created, updated, or deleted.

### 2. Metadata Storage:
Terraform state stores additional information for resources, such as resource dependencies, which helps Terraform understand the order of operations during a run.

### 3. Performance Optimization:
Storing state allows Terraform to make targeted updates and deletions rather than re-checking every resource. This speeds up operations on large infrastructures.
### PART 2
### Create a Resource Group 
```
az group create --name tf-state-rg --location uksouth 
```

### View The Resource Group 
```
az group list --query "[?name=='tf-state-rg']"
```

### Create a Backend State File With Resource Group
```
az storage account create --name tfstatejay --location uksouth --resource-group tf-state-rg
```
### Create a Container
```
az storage container create --accountname tfsatejay --name tfstate --public-access off --account-key $ACCOUNT_KEY
```
