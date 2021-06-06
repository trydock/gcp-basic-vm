# gcp-basic-vm
Basic Standalone VM instance in GCP

## Prerequisite

- Create a GCP service account.
- Add permissions to create VM instance and Instance Templates.
- Add a key to service account.
- Download the json key file from the GCP service account.

## Usage:

Clone to your workstation.

Copy the sample config file.

```
cp -ar terraform.tfvars.sample terraform.tfvars
```

Update the config parameters in `terraform.tfvars` file.

- Update `gcp_cred_file` with the path to the key you download from GCP service account.
- Update `gcp_project` with the correct name of the GCP project you created.
- Update `gcp_region` with the preffered region where you want the resource to be created.
- Update `service_account` with the correct email of the service account.

Lets validate if the terraform files are valid, using.

```
terraform validate
```

Then issue plan, review the output.

```
terraform plan
```

Finally apply the terraform changes.

```
terraform apply
```

done.
