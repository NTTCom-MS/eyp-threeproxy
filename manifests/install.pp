class threeproxy::install inherits threeproxy {

  if($threeproxy::manage_package)
  {
    package { $threeproxy::params::package_name:
      ensure => $threeproxy::package_ensure,
    }
  }

}
