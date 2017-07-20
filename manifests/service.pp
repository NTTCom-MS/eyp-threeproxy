class threeproxy::service inherits threeproxy {

  #
  validate_bool($threeproxy::manage_docker_service)
  validate_bool($threeproxy::manage_service)
  validate_bool($threeproxy::service_enable)

  validate_re($threeproxy::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${threeproxy::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $threeproxy::manage_docker_service)
  {
    if($threeproxy::manage_service)
    {
      service { $threeproxy::params::service_name:
        ensure => $threeproxy::service_ensure,
        enable => $threeproxy::service_enable,
      }
    }
  }
}
