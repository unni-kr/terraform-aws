# iFlight-Creq-Infra

#initialize
terraform init

#we need to specify the enivironment as command line argument
terraform plan -var="environment=test"

#apply the changes using
terraform apply -var="environment=test"
