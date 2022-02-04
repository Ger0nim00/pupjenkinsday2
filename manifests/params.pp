# @summary Operating systems related variables (and others)
class jenkins::params {

  $version               = 'latest'
  $port                  = 8000
  $install_java          = true
  $swarm_version         = '2.2'
  $service_enable        = true
  $service_ensure        = 'running'
  
}
