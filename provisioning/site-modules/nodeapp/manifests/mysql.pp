class mysql {
  class { '::mysql::server':
    root_password => 'secret'
  }

  include '::mysql::server'

  mysql_database { 'app_prod':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  mysql_database { 'app_dev':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  mysql_database { 'app_test':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  mysql_user { 'app@localhost':
    ensure                   => 'present',
    password_hash            => mysql_password('secret'),
    max_connections_per_hour => '0',
    max_queries_per_hour     => '0',
    max_updates_per_hour     => '0',
    max_user_connections     => '0',
  }

  mysql_grant { 'app@localhost/app\_%.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'app@localhost'
  }

  mysql_user { 'developer@localhost':
    ensure                   => 'present',
    password_hash            => mysql_password('secret'),
    max_connections_per_hour => '0',
    max_queries_per_hour     => '0',
    max_updates_per_hour     => '0',
    max_user_connections     => '0',
  }

  mysql_grant { 'developer@localhost/*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'developer@localhost'
  }
}
