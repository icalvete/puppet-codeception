class codeception::install {

  file { 'codeception_install_dir':
    ensure => directory,
    path   => $codeception::install_dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { 'codeception_composer_json':
    ensure  => present,
    path    => "${codeception::install_dir}/composer.json",
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    source  => "puppet:///modules/${module_name}/composer.json",
    require => File['codeception_install_dir']
  }

  exec{ 'codeception_install':
    command     => "${composer::install_dir}/composer.phar install --optimize-autoloader --no-dev",
    user        => 'root',
    cwd         => $codeception::install_dir,
    provider    => 'shell',
    environment => ["COMPOSER_HOME=${composer::install_dir}"],
    require     => File['codeception_install_dir', 'codeception_composer_json']
  }

  file { '/usr/local/bin/codecept':
    ensure => link,
    target => "${codeception::install_dir}/vendor/bin/codecept"
  }
}
