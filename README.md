# Populating a cluster

* Create a file called .civotoken containing your Civo API token
* Create a variables file containing any variables without defaults or that you wish to override. For instance:
    ```
    environment    = "test"
    domain         = "civo-hackathon.link"
    email_address  = "my@example.com"
    kubeconfig     = "../terraform-civo/kubeconfig"
    ```
* Run `terraform init`
* Run `terraform plan -out plan.out -var-file my.tfvars`
* Run `terraform apply plan.out` if you're happy with the plan
