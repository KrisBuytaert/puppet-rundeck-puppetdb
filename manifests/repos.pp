class profile_rundeck_puppetdb::repos {

  yumrepo { 'passenger':
    ensure        => 'present',
    baseurl       => 'https://oss-binaries.phusionpassenger.com/yum/passenger/el/$releasever/$basearch',
    descr         => 'passenger',
    enabled       => '1',
    gpgcheck      => '0',
    gpgkey        => 'https://packagecloud.io/gpg.key',
    repo_gpgcheck => '1',
    sslcacert     => '/etc/pki/tls/certs/ca-bundle.crt',
    sslverify     => '1',
}
}

