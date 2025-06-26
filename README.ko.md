# Nix Flake 템플릿

<!--toc:start-->
- [Nix Flake 템플릿](#nix-flake-템플릿)
  - [템플릿 목록](#템플릿-목록)
  - [`trivial` &mdash; 기본 Nix Flake 템플릿](#trivial-mdash-기본-nix-flake-템플릿)
  - [`python-script` &mdash; Python 프로그램 스크립트 템플릿](#python-script-mdash-python-프로그램-스크립트-템플릿)
  - [`python-package` &mdash; Python 패키지 템플릿](#python-package-mdash-python-패키지-템플릿)
  - [`haskell-simple-app` &mdash; 간단한 Haskell 애플리케이션](#haskell-simple-app-mdash-간단한-haskell-애플리케이션)
  - [`cpp-cmake-project` &mdash; C++/CMake 프로젝트 템플릿](#cpp-cmake-project-mdash-ccmake-프로젝트-템플릿)
  - [`nodejs-app` &mdash; Node.js 애플리케이션 템플릿](#nodejs-app-mdash-nodejs-애플리케이션-템플릿)
  - [`rust-app` &mdash; Rust 애플리케이션 템플릿](#rust-app-mdash-rust-애플리케이션-템플릿)
<!--toc:end-->

## 템플릿 목록

```sh
nix flake show github:vst/nix-flake-templates
```

## `trivial` &mdash; 기본 Nix Flake 템플릿

이 템플릿은 특별한 작업을 수행하지 않습니다. [flake-utils]를 사용하여 여러 대상 시스템을 위한 Nix Flake를 만드는 방법을 보여줍니다.

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#trivial
```

리포지토리를 체크아웃하지 않고 Nix Flake에 정의된 기본 패키지를 실행할 수 있습니다:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/trivial" --no-write-lock-file
```

이 리포지토리를 체크아웃한 경우:

```sh
nix run ./templates/trivial
```

## `python-script` &mdash; Python 프로그램 스크립트 템플릿

이 템플릿은 Python 스크립트를 Nix Flake 출력으로 실행 가능한 프로그램으로 변환합니다.

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#python-script
```

리포지토리를 체크아웃하지 않고 Nix Flake에 정의된 기본 패키지를 실행할 수 있습니다:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/python-script" --no-write-lock-file
```

이 리포지토리를 체크아웃한 경우:

```sh
nix run ./templates/python-script
```

## `python-package` &mdash; Python 패키지 템플릿

이 템플릿은 다음과 같은 유용한 기능을 포함하는 Python 패키지를 제공합니다:

1. 패키지 메타데이터를 위한 `pyproject.toml`
1. 패키지 빌드를 위한 `setuptools`
1. 테스트 실행을 위한 `nox`
1. Python 코드 린팅 및 포맷팅을 위한 `ruff`
1. 타입 검사를 위한 `mypy`
1. 단위 테스트를 위한 `pytest`
1. TOML 파일 린팅 및 포맷팅을 위한 `taplo`

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#python-package
```

리포지토리를 체크아웃하지 않고 Nix Flake에 정의된 기본 패키지를 실행할 수 있습니다:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/python-package" --no-write-lock-file
```

이 리포지토리를 체크아웃한 경우:

```sh
nix run ./templates/python-package
```

> [!NOTE]
>
> Nix 환경이 아닌 환경에서 패키지를 테스트하여 예상대로 작동하는지 확인하는 것이 좋습니다.
>
> ```console
> $ docker run --rm -it debian:12.10 bash
> $ apt update
> $ apt install -y curl git python3 python3-pip python3-venv vim
> $ curl -fsSL https://github.com/tamasfe/taplo/releases/latest/download/taplo-full-linux-x86_64.gz |
>       gzip -d - |
>       install -m 755 /dev/stdin /usr/local/bin/taplo
> $ mkdir -p /tmp/test && cd /tmp/test
> $ git clone https://github.com/vst/nix-flake-templates.git
> $ cd nix-flake-templates/templates/python-package
> $ python3 -m venv .venv
> $ source .venv/bin/activate
> $ pip install --upgrade pip
> $ pip install -e .[test]
> $ nox
> $ zamazingo --name=there --count=3
> ```

## `haskell-simple-app` &mdash; 간단한 Haskell 애플리케이션

이 템플릿은 단일 Haskell 파일 Main.hs와 `.cabal` 파일로 구성된 매우 간단한 Haskell 애플리케이션 설정을 제공합니다. 개발 환경에는 애플리케이션 작업을 편안하게 수행하는 데 필요한 모든 종속성이 포함됩니다.

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#haskell-simple-app
```

## `cpp-cmake-project` &mdash; C++/CMake 프로젝트 템플릿

이 템플릿은 CMake를 사용하는 C++ 프로젝트를 위한 기본 설정을 제공합니다. 간단한
`main.cpp`, `CMakeLists.txt` 및 `cmake`와 C++ 컴파일러를 사용하여 개발 환경을
설정하는 `flake.nix`가 포함되어 있습니다.

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#cpp-cmake-project
```

리포지토리를 체크아웃하지 않고 Nix Flake에 정의된 기본 패키지를 실행할 수 있습니다:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/cpp-cmake-project" --no-write-lock-file
```

이 리포지토리를 체크아웃한 경우:

```sh
nix run ./templates/cpp-cmake-project
```

## `nodejs-app` &mdash; Node.js 애플리케이션 템플릿

이 템플릿은 간단한 Node.js 애플리케이션을 설정합니다. `package.json`,
`index.js` 스크립트 및 Node.js와 npm으로 개발 환경을 제공하는 `flake.nix`가
포함되어 있습니다.

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#nodejs-app
```

리포지토리를 체크아웃하지 않고 Nix Flake에 정의된 기본 패키지를 실행할 수 있습니다:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/nodejs-app" --no-write-lock-file
```

이 리포지토리를 체크아웃한 경우:

```sh
nix run ./templates/nodejs-app
```

## `rust-app` &mdash; Rust 애플리케이션 템플릿

이 템플릿은 Cargo 및 Nix 통합을 위한 [crane]을 사용하는 Rust 애플리케이션을 위한
기본 설정을 제공합니다. `src/main.rs`, `Cargo.toml` 및 Rust 툴체인,
`rust-analyzer`로 개발 환경을 구성하고 `crane`을 사용하여 패키지를 빌드하는
`flake.nix`가 포함되어 있습니다.

템플릿 사용:

```sh
nix flake init --template github:vst/nix-flake-templates#rust-app
```

리포지토리를 체크아웃하지 않고 Nix Flake에 정의된 기본 패키지를 실행할 수 있습니다:

```sh
nix run "github:vst/nix-flake-templates?dir=templates/rust-app" --no-write-lock-file
```

이 리포지토리를 체크아웃한 경우:

```sh
nix run ./templates/rust-app
```

<!-- REFERENCE -->

[flake-utils]: https://github.com/numtide/flake-utils
[crane]: https://github.com/ipetkov/crane
