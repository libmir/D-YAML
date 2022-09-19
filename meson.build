project('mir-yaml', 'd', version : '0.0.0', license: 'BSL-1.0')

description = 'YAML parser and emitter for the D programming language.'

subprojects = ['mir-core', 'mir-algorithm']

has_cpp_headers = false

sources_list = [
    'dyaml/composer',
    'dyaml/constructor',
    'dyaml/dumper',
    'dyaml/emitter',
    'dyaml/escapes',
    'dyaml/event',
    'dyaml/exception',
    'dyaml/linebreak',
    'dyaml/loader',
    'dyaml/package',
    'dyaml/parser',
    'dyaml/queue',
    'dyaml/reader',
    'dyaml/representer',
    'dyaml/resolver',
    'dyaml/scanner',
    'dyaml/serializer',
    'dyaml/tagdirective',
    'dyaml/test/common',
    'dyaml/test/compare',
    'dyaml/test/constructor',
    'dyaml/test/emitter',
    'dyaml/test/errors',
    'dyaml/test/inputoutput',
    'dyaml/test/reader',
    'dyaml/test/representer',
    'dyaml/test/resolver',
    'dyaml/test/tokens',
    'dyaml/token',
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

test_versions = ['dyaml_test']

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
