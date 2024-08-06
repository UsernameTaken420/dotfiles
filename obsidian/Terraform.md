Provider-agnostic infrastructure management, defines target state and proposes changes in order to reach it.

```terraform
provider "aws" {
	profile = "profileName"
	region = "aws-region"
}

resource "aws_s3_bucket" "bucket_name" {
	bucket = "unique_name"
	acl = "private"
}
```

- `terraform init` to initialize terraform
- `terraform plan` to see proposed changes in order to achieve expected state
	- `-destroy` to see changes needed for teardown
- `terraform apply` to apply proposed changes
	- `-auto-approve` for no 'yes' prompt
- `terraform show [example.plan]` see a plan's changes

```terraform
resource "aws_s3_bucket" "website" {
	bucket = "s3-website-test.testcorp.com"
	acl = "public-read"
	policy = "${file("policy.json")}" // external policy

	website {
		index_document = "index.html"
		error_document = "error.html"
	}
}

resource "aws_security_group" "allow_tls" {
	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["1.2.3.4/32"]
	}
	egress {
		from_port = 0 // any port
		to_port = 0 
		protocol = "-1" // any protocol
	}
}

resource "aws_default_vpc" "default" {}
```
