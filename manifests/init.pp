class codeception () inherits codeception::params {

  include composer

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
