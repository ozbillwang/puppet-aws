# http://puppetlabs.com/blog/using-puppet-launch-puppet-enterprise-cluster-aws?ls=social-media&ccn=twitter-product-20141216&cid=701G0000000F68P
# http://puppetlabs.com/blog/provision-aws-infrastructure-using-puppet
# https://github.com/puppetlabs/puppetlabs-aws

$pe_username = 'admin@puppetlabs.com'
$pe_password = 'puppetlabs'
$pe_version_string = '3.7.0'

ec2_securitygroup { 'puppet':
  ensure           => present,
  region           => 'us-west-2',
  description      => 'Group for testing puppet AWS module',
  ingress          => [{
    security_group => 'puppet',
  },{
    protocol => 'tcp',
    port     => 443,
   cidr     => '0.0.0.0/0',
  }]
}

ec2_instance { 'puppet-master':
  ensure          => present,
  region          => 'us-west-2',
  image_id        => 'ami-3d50120d',
  instance_type   => 't2.micro',
  monitoring      => 'true',
  key_name         => 'aws.key',
  security_groups => ['puppet', 'security-group2'],
  user_data       => template('master-pe-userdata.erb'),
}
