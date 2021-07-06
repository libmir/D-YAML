# D:YAML - Mir Fork

[![Build Status](https://github.com/libmir/mir-yaml/actions/workflows/d.yml/badge.svg)](https://github.com/libmir/mir-yaml/actions)
[![Circle CI](https://circleci.com/gh/libmir/mir-yaml.svg?style=svg)](https://circleci.com/gh/libmir/mir-yaml)
[![codecov](https://codecov.io/gh/libmir/mir-yaml/branch/master/graph/badge.svg)](https://codecov.io/gh/libmir/mir-yaml)
[![code.dlang.org](https://img.shields.io/dub/v/mir-yaml.svg)](http://code.dlang.org/packages/mir-yaml)

## Introduction

D:YAML is an open source YAML parser and emitter library for the D programming language.
It is [almost](docs/articles/spec_differences.md) compliant to the YAML 1.1 specification.
D:YAML is based on [PyYAML](http://www.pyyaml.org) created by Kirill Simonov.

D:YAML is designed to be easy to use while supporting the full feature set of YAML.
To start using it in your project, see the [Getting Started](docs/tutorials/getting_started.md) tutorial.

## Mir specific Features
  - Integration with Mir serialisation engine. See also the [example](examples/mir_serde).
  - Precise number printing (Ryu) and parsing (required by YAML spec).
  - Support for Arbitrary timestamp precision (required by YAML spec).
  - Support for [Timestamp](http://mir-algorithm.libmir.org/mir_timestamp.html) (Mir), `YearMonthDay` (Mir), `Date` (Mir and Phobos), `DateTime`, `SysTime`.
  - `Node.mapping` and `Node.sequence` are full featured [Mir slices](http://mir-algorithm.libmir.org/mir_ndslice.html).

## Features
  - Easy to use, high level API and detailed debugging messages.
  - Detailed API documentation and tutorials.
  - Code examples.
  - Supports all YAML 1.1 constructs. All examples from the YAML 1.1
    specification are parsed correctly.
  - Reads from and writes from/to YAML files or in-memory buffers.
  - UTF-8, UTF-16 and UTF-32 encodings are supported, both big and
    little endian (plain ASCII also works as it is a subset of UTF-8).
  - Support for both block (Python-like, based on indentation) and flow
    (JSON-like, based on bracing) constructs.
  - Support for YAML anchors and aliases.
  - Support for default values in mappings.
  - Support for custom tags (data types), and implicit tag resolution
    for custom scalar tags.
  - All tags (data types) described at <http://yaml.org/type/> are
    supported, with the exception of `tag:yaml.org,2002:yaml`, which is
    used to represent YAML code in YAML.
  - Remembers YAML style information between loading and dumping if
    possible.
  - Reuses input memory and uses slices to minimize memory allocations.
  - There is no support for recursive data structures. There are no
    plans to implement this at the moment.

## Directory structure

| Directory     | Contents                       |
|---------------|--------------------------------|
| `./`          | This README, utility scripts.  |
| `./docs`      | Documentation.                 |
| `./source`    | Source code.                   |
| `./examples/` | Example projects using D:YAML. |
| `./test`      | Unittest data.                 |

## Installing and tutorial

See the [Getting Started](docs/tutorials/getting_started.html).
Tutorial and other tutorials that can be found in the in the [`docs` directory](docs/).

API documentation is available [here](https://mir-yaml.dpldocs.info/dyaml.html).

## Credits

D:YAML was created by Ferdinand Majerech aka Kiith-Sa and is handled by the [dlang-community](https://github.com/dlang-community) organization since 2017, and [libmir](https://github.com/libmir) organization since 2021.
Parts of code based on [PyYAML](http://www.pyyaml.org) created by Kirill Simonov.
