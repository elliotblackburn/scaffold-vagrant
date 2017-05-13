class nodeapp($node_version = "6.9.1") {

    # Add some default path values
    Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

    exec { "apt-update":
        command => "/usr/bin/apt-get update"
    }

    Exec["apt-update"] -> Package <| |>

    class { essentials: }

    class { nginx:
        require => [Class["essentials"]]
    }

    class { nvm:
        node_version => $node_version,
        require => [Class["essentials"]]
    }

    class { mysql: }

    class { mongodb: }

    class { 'redis':
      conf_port => '6379',
      conf_bind => '0.0.0.0',
    }

    file { '/home/vagrant/code':
        ensure => "directory",
        owner  => "vagrant",
        group  => "vagrant"
    }
}
