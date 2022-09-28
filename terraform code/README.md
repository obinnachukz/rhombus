## TERRAFORM SCRIPT
* STEP 1: Update variable.tf and the mykey.tfvars with your information.
* STEP 2: Once updated, RUN the ```terraform init``` command.
* STEP 3: RUN ```terraform plan``` command to verify resources to provision.
* STEP 3a: Terraform plan command - ```terraform plan -var-file mykey.tfvars```
* STEP 4: RUN ```terraform apply``` command to provision EC2 instance.
* STEP 4a: Terraform apply command - ```terraform apply -var-file mykey.tfvars```
* STEP 4b: Enter ```yes``` after 4a.
* STEP 5: Verify EC2 instance is running.
* STEP 6: RUN ```terraform destroy``` command to terminate EC2 instance and other dependencies.
* STEP 6a: Terraform destroy command - ```terraform destroy -var-file mykey.tfvars```
* STEP 6b: Enter ```yes``` after 6a.
