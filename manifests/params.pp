class ntp::params {
  $package_name       = 'ntp'
  $package_ensure     = 'present'
  $config_name        = 'ntp.conf'
  $config_file_mode   = '0644'
    ## Setting some defaults, but in roles/profiles will be overriden
  $servers            = ['0.centos.pool.ntp.org', '1.centos.pool.ntp.org']
  $service_ensure     = 'running'
  $service_enable     = true
  $service_hasstatus  = true
  $service_hasrestart = true

    ## Using a selector, separate with line break
  $service_name = $facts['os']['family'] ? {
    'Debian' => 'ntp',
    default  => 'ntpd',
  }
}
