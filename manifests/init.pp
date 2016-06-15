class rundeck_puppetdb (
  $puppetdburl = 'http://puppetdb:8081/'
) {
  # this proile will configure the rundeck plugin for puppetdb,
  # it will run a passenger instance which will query puppetdb and export a yaml file with the nodes
  # etc when queried.

  package { 'puppetdb-rundeck':
    ensure => '1.0-1',
  }

  package {'passenger':
    ensure => present,
  }

  package {'mod_passenger':
    ensure =>  present,
  }

  package {'rubygem-sinatra':
    ensure =>  present,
  }

  package {'rubygem-rack-protection':
    ensure =>  present,
  }

  package {'rubygem-tilt':
    ensure =>  present,
  }

  include apache
  include apache::mod::passenger


  file { '/opt/puppetdb-rundeck/public':
    ensure => 'directory',
    group  => '48',
    mode   => '0755',
    owner  => '48',
  }

  file { '/etc/httpd/conf.d/puppetdb-rundeck.conf':
    content => template('rundeck_puppetdb/puppetdb-rundeck.conf.erb'),
    group   => '0',
    mode    => '0644',
    owner   => '0',
  }
}

