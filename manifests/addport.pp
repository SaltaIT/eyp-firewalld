#firewall-cmd --permanent --zone=public --add-port=5666/tcp
define firewalld::addport (
                            $permanent = true,
                            $port      = $name,
                            $zone      = 'public',
                            $protocol  = 'tcp',
                            $ensure    = 'present'
                          ) {
  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  if(!defined(Service['firewalld']))
  {
    fail('firewalld undefined, please check firewalld class and firewalld::ensure')
  }

  if($ensure=='present')
  {
    # command => "firewall-cmd --permanent --zone=public --add-port=5666/tcp",
    exec { "firewalld add port ${port} ${name} ${zone}":
      command => inline_template('firewall-cmd <% if @permanent %>--permanent<% end %> --zone=<%= @zone %> --add-port=<%= @port %>/<%= @protocol %>'),
      notify  => Service['firewalld'],
      unless  => "firewall-cmd --zone=${zone} --list-ports | grep '${port}/${protocol}'",
    }
  }
  else
  {
    exec { "firewalld remove port ${port} ${name} ${zone}":
      command => inline_template('firewall-cmd <% if @permanent %>--permanent<% end %> --zone=<%= @zone %> --remove-port=<%= @port %>/<%= @protocol %>'),
      notify  => Service['firewalld'],
      onlyif  => "firewall-cmd --zone=${zone} --list-ports | grep '${port}/${protocol}'",
    }
  }

}
