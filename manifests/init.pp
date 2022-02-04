# @summary main class of Jenkins module

class jenkins (
  $port            = $jenkins::params::port,
  $version         = $jenkins::params::version,
  $install_java    = $jenkins::params::install_java,
 
) inherits jenkins::params{

  include jenkins::install
  include jenkins::service
}
