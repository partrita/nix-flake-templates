{
  description = "A Collection of Personal Nix Flake Templates";

  outputs = { self, ... }: {
    templates = {
      trivial = {
        path = ./templates/trivial;
        description = "A trivial template that does nothing much.";
      };

      python-script = {
        path = ./templates/python-script;
        description = "A simple Python program script.";
      };

      python-package = {
        path = ./templates/python-package;
        description = "A Python package with CLI functionality.";
      };

      haskell-simple-app = {
        path = ./templates/haskell-simple-app;
        description = "A simple Haskell application template.";
      };

      cpp-cmake-project = {
        path = ./templates/cpp-cmake-project;
        description = "A C++/CMake project template.";
      };

      nodejs-app = {
        path = ./templates/nodejs-app;
        description = "A Node.js application template.";
      };

      rust-app = {
        path = ./templates/rust-app;
        description = "A Rust application template.";
      };

      defaultTemplate = self.templates.trivial;
    };
  };
}
