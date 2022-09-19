project('mir-yaml', 'd', version : '0.0.0', license: 'BSL-1.0')

description = 'YAML parser and emitter for the D programming language.'

subprojects = ['mir-core', 'mir-algorithm']

has_cpp_headers = false

sources_list = [
    'mir/yaml/composer',
    'mir/yaml/constructor',
    'mir/yaml/dumper',
    'mir/yaml/emitter',
    'mir/yaml/escapes',
    'mir/yaml/event',
    'mir/yaml/exception',
    'mir/yaml/linebreak',
    'mir/yaml/loader',
    'mir/yaml/package',
    'mir/yaml/parser',
    'mir/yaml/queue',
    'mir/yaml/reader',
    'mir/yaml/representer',
    'mir/yaml/resolver',
    'mir/yaml/scanner',
    'mir/yaml/serializer',
    'mir/yaml/tagdirective',
    'mir/yaml/test/common',
    'mir/yaml/test/compare',
    'mir/yaml/test/constructor',
    'mir/yaml/test/emitter',
    'mir/yaml/test/errors',
    'mir/yaml/test/inputoutput',
    'mir/yaml/test/reader',
    'mir/yaml/test/representer',
    'mir/yaml/test/resolver',
    'mir/yaml/test/tokens',
    'mir/yaml/token',
]

sources = []
foreach s : sources_list
    sources += 'source/' + s + '.d'
endforeach

add_project_arguments([
    '-preview=dip1008',
    '-lowmem',
], language: 'd')

required_deps = []

foreach p : subprojects 
    required_deps += dependency(p, fallback : [p, 'this_dep'])
endforeach

directories = ['source']

if has_cpp_headers
    directories += 'include'
endif

directories = include_directories(directories)

this_lib = library(meson.project_name(),
    sources,
    include_directories: directories,
    install: true,
    version: meson.project_version(),
    dependencies: required_deps,
)

this_dep = declare_dependency(
    link_with: [this_lib],
    include_directories: directories,
    dependencies: required_deps,
)

test_versions = ['mir_yaml_test']

if has_cpp_headers
    install_subdir('include/',
        strip_directory :true,
        install_dir: 'include/',
    )
endif

install_subdir('source/',
    strip_directory : true,
    install_dir: 'include/d/' + meson.project_name(),
)

import('pkgconfig').generate(this_lib,
    description: description,
    subdirs: 'd/' + meson.project_name(),
)

test_subdirs = []
