#firewall-cmd --permanent --zone=public --add-port=5666/tcp
define firewalld::addport (
                            $permanent = true,
                            $port      = $name,
                            $zone      = 'public',
                          ) {

}
