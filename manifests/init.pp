# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class firewalld($ensure='masked')  inherits firewalld::params {

  Exec {
		path => '/bin:/sbin:/usr/bin:/usr/sbin',
	}

  case $ensure
  {
    'masked':
    {
      #https://tickets.puppetlabs.com/browse/PUP-1253
      #TODO: detectar versio de puppet i escollir el metode

      exec { 'systemctl stop and mask firewalld':
        command => "bash -c 'systemctl stop firewalld; systemctl mask firewalld'",
        unless => 'systemctl list-unit-files | grep "firewalld.service" | grep masked',
      }
    }
    default: { fail("unsupported firewalld::ensure: ${ensure}") }
  }


}
