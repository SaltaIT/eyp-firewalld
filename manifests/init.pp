# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class firewalld (
                  $ensure = 'masked',
                  $enable = true,
                ) inherits firewalld::params {

  Exec {
		path => '/bin:/sbin:/usr/bin:/usr/sbin',
	}

  case $ensure
  {
    'masked':
    {
      #https://tickets.puppetlabs.com/browse/PUP-1253
      # Fix Version/s: PUP 4.2.0
      #TODO: detectar versio de puppet i escollir el metode

      #puppetversion => 3.8.7
      if(versioncmp($::puppetversion, '4.2.0')>=0)
      {
        service { 'firewalld':
          ensure => 'stopped',
          enable => 'mask',
        }
      }
      else
      {
        exec { 'systemctl stop and mask firewalld':
          command => "bash -c 'systemctl stop firewalld; systemctl mask firewalld'",
          unless => 'systemctl list-unit-files | grep "firewalld.service" | grep masked',
        }
      }
    }
    'running':
    {
      service { 'firewalld':
        ensure => $ensure,
        enable => $enable,
      }
    }
    default: { fail("unsupported firewalld::ensure: ${ensure}") }
  }


}
