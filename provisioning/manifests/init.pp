$node_version = "6.9.1"

file { '/etc/motd':
	content => "
 Node, MySQL, Redis, and NGinx Vagrant Box
 - OS:      Ubuntu trusty-server-cloudimg-amd64
 - Node:    ${node_version}
 - IP:      ${ipaddress_eth1}
 - Code:    ~/code/app
\n"
}

# Make all the magic happen by instantiating the nodeapp class
class { nodeapp:
	node_version => $node_version
}