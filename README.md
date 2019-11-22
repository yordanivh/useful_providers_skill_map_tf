# useful_providers_skill_map_tf
This Repo contains TF example for useful providers


## What this Repo does

Assuming that you are familiar with the concepts of IaC and have worked with Terraform tool in the past here is a bit of information about this repo.

I am showing here how to use the providers `template_file` and `random_id`.

We use the `random id` provider to assign a random id to the server it can be linked to the ami_id value of the created server by using keepers value.

We also use the `template file` provider to which we give a shell script `setup.sh` and give it a value for a variable part of a template. This can be usefull when creating many instances and providing names for each one for example.

In this case the template is a shell script setup.sh containing `echo "Deploying ${animal}"`
`animal` variable could have different values assigned to it so the setup.sh script is used as a template.

## How to use this repo

Copy the files locally on you computer.
Initiate Terraform `terraform init`.
After that `terraform plan` and if there are no issues `terraform apply`.
Terraform will ask you to specify a value for variable animal and the output will look something like this.

```
yhalachev@Yordans-MacBook-Pro useful_providers_skill_map_tf (newbranch) $ terraform apply
data.template_file.setup: Refreshing state...

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_id.server will be created
  + resource "random_id" "server" {
      + b64         = (known after apply)
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 4
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_id.server: Creating...
random_id.server: Creation complete after 0s [id=eOhQxg]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

id = 78e850c6
template = echo "Deploying tiger"
```

