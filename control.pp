class control {
    class { '::keystone':
        admin_token     => 'super_secret',
        package_ensure  => 'latest',
        public_endpoint => 'http://localhost:5000',
        admin_endpoint  => 'http://localhost:35357',
    }
    class { '::keystone::roles::admin':
        email    => 'root@localhost',
        password => 'admin_pass',
    }

    # XXX this needs to be in hiera, ensure all clients are the latest
    # another keystone dep, need latest
#    class { '::openstacklib::openstackclient':
#        package_ensure => 'latest',
#    }
    $keystone_deps = ['python-pbr', 'python-tz']
    package { $keystone_deps:
        ensure => 'latest',
        before => Service['keystone']
    }
}

include ::control
