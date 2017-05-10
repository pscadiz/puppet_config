### Define puppet_config::config_file
# Creates a config file for use with puppet_config::*_property defined type
# Do not call when config file to be edited already exists

define puppet_config::config_file (
	$filename  = undef,
	$directory = undef,
	$owner     = undef,
	$group     = undef,
) {

	file { $directory:
		ensure => $directory,
		group  => $group,
		owner  => $owner,
	}

	-> file { "${directory}/${filename}":
		ensure => file,
		group  => $group,
		owner  => $owner,
	}
}