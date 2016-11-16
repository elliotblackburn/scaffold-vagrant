class nvm ($node_version) {

  Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin'], }

  exec { "install-node":
    command => "bash -c \"source /home/vagrant/nvm/nvm.sh && nvm install ${node_version}\"",
    require => [Vcsrepo['/home/vagrant/nvm']],
    creates => "/home/vagrant/nvm/${node_version}",
    timeout => 0,
    notify => [File["set-node-permissions"]]
  }

  # Ensure proper permissions for nvm (and node in general)
  file { "set-node-permissions":
    path => "/home/vagrant/nvm/${node_version}",
    ensure => "directory",
    recurse => true,
    owner  => "vagrant",
    group  => "vagrant",
    subscribe => [Exec["install-node"]]
  }

  vcsrepo { '/home/vagrant/nvm':
    ensure => present,
    provider => git,
    source => "https://github.com/creationix/nvm.git",
    user => "vagrant",
    group => "vagrant"
  }

  #exec { "source-nvm":
  #  command => "echo 'source /home/vagrant/nvm/nvm.sh' >> /home/vagrant/.bashrc",
  #  onlyif => "grep -q 'source /home/vagrant/nvm/nvm.sh' /home/vagrant/.bashrc; test $? -eq 1",
  #}
}
