class nodeapp($node_version = "v0.10.38") {

    # Add some default path values
    Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

    exec { "apt-update":
        command => "/usr/bin/apt-get update"
    }

    Exec["apt-update"] -> Package <| |>

    # Install base packages
    class { essentials: }

    # Install and set up nginx web server
    class { nginx:
        require => [Class["essentials"]]
    }

    class { upstart:
        node_version => $node_version,
        require => [Class["essentials"]]
    }

    # Install node with nvm
    class { nvm:
        node_version => $node_version,
        require => [Class["essentials"]]
    }

    # Set up MySQL
    class { mysql: }

    # Make sure our code directory has proper permissions
    file { '/home/vagrant/code':
        ensure => "directory",
        owner  => "vagrant",
        group  => "vagrant"
    }
}