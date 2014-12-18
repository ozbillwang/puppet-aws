puppet-aws
==========

Run and manage aws ec2 instance from puppet directly

### Prepare the environment

    apt-get install puppet # for examaple, on Ubuntu
    gem install aws-sdk-core
    puppet module install puppetlabs-aws

### set aws credentials
```
~/.aws/credentials

[default]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key
```

### clone this repository to your local disk.

### run the command to create a new ec2 instance (make sure there is no same name's ec2 instance and security group).

    puppet apply pe_master.pp --test --templatedir templates
