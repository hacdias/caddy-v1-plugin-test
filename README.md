# caddy-plugin-test

> Docker image to test building Caddy plugins on CI.

## Requirements

1. Plugin must be a module.
2. The working directory must be the plugin root.
3. The plugin must not have a folder named `caddy`.

## Usage

Here's an example for Circle CI, where it first lints using [golangci-lint](https://github.com/golangci/golangci-lint)
and then builds the plugin with Caddy:

```yml
version: 2
jobs:
  lint:
    docker:
      - image: golangci/golangci-lint:v1.16
    steps:
      - checkout
      - run: golangci-lint run -v
  build:
    docker:
      - image: hacdias/caddy-plugin-test:latest
    steps:
      - checkout
      - run: caddy-build
workflows:
  version: 2
  build-workflow:
    jobs:
      - lint
      - build
```

## License

[MIT](LICENSE) © Henrique Dias
