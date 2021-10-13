# terraform-examples
- the desrired state and the current state is compared only for the resources which are mentioned in the terraform file explicitly in the resource block.
- other manual changes will not show up after refreshing using ```terraform refresh```
- third party provider cannot be added using ```terraform init``` directly 
- we have to place the provider file into the specific dir, ```%APPDATA%\terraform.d\plugins``` in windows and ```~/.terraform.d/plugins``` in linux
- Methods to add variables are environment variables, terraform,tfvars file, custom var file and mention that during apply, cli command with -var directly.