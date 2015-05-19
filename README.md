#puppet-codeception

Puppet manifest to codeception

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-codeception.png)](http://travis-ci.org/icalvete/puppet-codeception)

See [Codeception site](http://codeception.com/)

## Requires:

* https://github.com/icalvete/puppet-composer

##Example:

```puppet
node 'ubuntu01.smartpurposes.net' inherits test_defaults {
  include composer
  include codeception

  Class['php5'] -> Class['composer'] -> Class['codeception']
}
```

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
