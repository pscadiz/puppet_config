### Define puppet_config::java_property
# Writes java properties configuration

define puppet_config::java_property (
    $file  = undef,
    $key   = undef,
    $value = undef,
) {

    augeas { "${file}/${key}/${value}":
        lens    => 'Properties.lns',
        incl    => ${file},
        changes => [ "set /files${file}/${key} ${value}" ],
    }
}