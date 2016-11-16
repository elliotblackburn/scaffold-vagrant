$node_version = "v6.9.1"

file { '/etc/motd':
	content => "
 Node, MySQL, and NGinx Vagrant Box
 - OS:      Ubuntu trusty-server-cloudimg-amd64
 - Node:    ${node_version}
 - IP:      ${ipaddress_eth1}
 - Code:    ~/vagrant/code/app
\n"
}

# Make all the magic happen by instantiating the nodeapp class
class { nodeapp:
	node_version => $node_version
}
