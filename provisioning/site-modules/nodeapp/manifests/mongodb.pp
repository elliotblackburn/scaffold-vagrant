class mongodb {
    class { '::mongodb::server':
        port => 27018,
        auth => true
    }

    mongodb::db { 'app_dev':
        user => 'app',
        password_hash => '1ac864b7ec6a6e4fa0deea1c691a9ff4'
    }

    mongodb::db { 'app_test':
        user => 'app',
        password_hash => '1ac864b7ec6a6e4fa0deea1c691a9ff4'
    }

    mongodb::db { 'app_prod':
        user => 'app',
        password_hash => '1ac864b7ec6a6e4fa0deea1c691a9ff4'
    }
}