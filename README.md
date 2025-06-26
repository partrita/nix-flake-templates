# Nix Flake Templates

[한국어](./README.ko.md)

<!--toc:start-->
- [Nix Flake Templates](#nix-flake-templates)
  - [List of Templates](#list-of-templates)
  - [`trivial` &mdash; A Basic Nix Flake Template](#trivial-mdash-a-basic-nix-flake-template)
  - [`python-script` &mdash; A Python Program Script Template](#python-script-mdash-a-python-program-script-template)
  - [`python-package` &mdash; A Python Package Template](#python-package-mdash-a-python-package-template)
  - [`haskell-simple-app` &mdash; A Simple Haskell Application](#haskell-simple-app-mdash-a-simple-haskell-application)
  - [`cpp-cmake-project` &mdash; A C++/CMake Project Template](#cpp-cmake-project-mdash-a-ccmake-project-template)
  - [`nodejs-app` &mdash; A Node.js Application Template](#nodejs-app-mdash-a-nodejs-application-template)
  - [`rust-app` &mdash; A Rust Application Template](#rust-app-mdash-a-rust-application-template)
<!--toc:end-->

## List of Templates

```sh
nix flake show github:partrita/flake-templates
```

## `trivial` &mdash; A Basic Nix Flake Template

This template does nothing much. It demonstrates how to create a Nix Flake for
multiple target systems using [flake-utils].

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#trivial
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:partrita/flake-templates?dir=templates/trivial" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/trivial
```

## `python-script` &mdash; A Python Program Script Template

This template turns a Python script into an executable program as Nix Flake
output.

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#python-script
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:partrita/flake-templates?dir=templates/python-script" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/python-script
```

## `python-package` &mdash; A Python Package Template

This template provides a Python package with some goodies including:

1. `pyproject.toml` for package metadata
1. `setuptools` for building the package
1. `nox` for test runner
1. `ruff` for linting and formatting Python code
1. `mypy` for type checking
1. `pytest` for unit testing
1. `taplo` for linting and formatting TOML files

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#python-package
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:partrita/flake-templates?dir=templates/python-package" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/python-package
```

> [!NOTE]
>
> It is a good idea to test the package in a non-Nix environment to
> ensure that it works as expected.
>
> ```console
> $ docker run --rm -it debian:12.10 bash
> $ apt update
> $ apt install -y curl git python3 python3-pip python3-venv vim
> $ curl -fsSL https://github.com/tamasfe/taplo/releases/latest/download/taplo-full-linux-x86_64.gz |
>       gzip -d - |
>       install -m 755 /dev/stdin /usr/local/bin/taplo
> $ mkdir -p /tmp/test && cd /tmp/test
> $ git clone https://github.com/partrita/flake-templates.git
> $ cd nix-flake-templates/templates/python-package
> $ python3 -m venv .venv
> $ source .venv/bin/activate
> $ pip install --upgrade pip
> $ pip install -e .[test]
> $ nox
> $ zamazingo --name=there --count=3
> ```

## `haskell-simple-app` &mdash; A Simple Haskell Application

This template provides a very simple Haskell application setup with a single
Haskell file, Main.hs and a `.cabal` file. The development environment will
include all the dependencies needed to comfortably work on the application.

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#haskell-simple-app
```

## `cpp-cmake-project` &mdash; A C++/CMake Project Template

This template provides a basic setup for a C++ project using CMake. It includes a
simple `main.cpp`, a `CMakeLists.txt`, and a `flake.nix` that sets up a
development environment with `cmake` and a C++ compiler.

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#cpp-cmake-project
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:partrita/flake-templates?dir=templates/cpp-cmake-project" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/cpp-cmake-project
```

## `nodejs-app` &mdash; A Node.js Application Template

This template sets up a simple Node.js application. It includes a `package.json`,
an `index.js` script, and a `flake.nix` providing a development environment
with Node.js and npm.

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#nodejs-app
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:partrita/flake-templates?dir=templates/nodejs-app" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/nodejs-app
```

## `rust-app` &mdash; A Rust Application Template

This template provides a basic setup for a Rust application using Cargo and
[crane] for Nix integration. It includes a `src/main.rs`, a `Cargo.toml`, and a
`flake.nix` that configures a development environment with the Rust toolchain,
`rust-analyzer`, and builds the package using `crane`.

Use the template:

```sh
nix flake init --template github:partrita/flake-templates#rust-app
```

You can run the default package defined in the Nix Flake without checking out
the repository:

```sh
nix run "github:partrita/flake-templates?dir=templates/rust-app" --no-write-lock-file
```

If you have checked out this repository, then:

```sh
nix run ./templates/rust-app
```

<!-- REFERENCE -->

[flake-utils]: https://github.com/numtide/flake-utils
[crane]: https://github.com/ipetkov/crane
