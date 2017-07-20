class threeproxy::config inherits threeproxy {

  #/etc/3proxy.cfg
  file { '/etc/3proxy.cfg':
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template("${module_name}/3proxyconf.erb"),
  }

}
