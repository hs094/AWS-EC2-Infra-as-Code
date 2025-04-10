# AWS EC2 Terraform Starter

A simple Terraform project that provisions an AWS EC2 instance with SSH and HTTP access.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 0.14)
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/aws-ec2-terraform-starter.git
cd aws-ec2-terraform-starter
```

### 2. Create an AWS key pair

Create a key pair named `terraform-test` in the AWS console or using the AWS CLI:

```bash
aws ec2 create-key-pair --key-name terraform-test --query 'KeyMaterial' --output text > terraform-test.pem
chmod 400 terraform-test.pem
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the execution plan

```bash
terraform plan
```

### 5. Apply the configuration

```bash
terraform apply
```

When prompted, type `yes` to confirm.

### 6. Access your instance

Once provisioning is complete, you can SSH into your instance:

```bash
ssh -i terraform-test.pem ec2-user@<public-ip>
```

Replace `<public-ip>` with the public IP address shown in the Terraform output.

## Resources Created

- EC2 instance (t2.micro)
- Security group allowing SSH (port 22) and HTTP (port 80) access

## Cleanup

To destroy all resources created by Terraform:

```bash
terraform destroy
```

When prompted, type `yes` to confirm.

## License

MIT