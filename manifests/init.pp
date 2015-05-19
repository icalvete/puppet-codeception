class codeception () inherits codeception::params {

  anchor {'codeception::begin':
    before => Class['codeception::install']
  }
  class {'codeception::install':
    require => Anchor['codeception::begin']
  }
  anchor {'codeception::end':
    require => Class['codeception::install']
  }
}
