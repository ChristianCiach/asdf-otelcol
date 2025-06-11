<div align="center">

# asdf-otelcol [![Build](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/build.yml/badge.svg)](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/build.yml) [![Lint](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/lint.yml/badge.svg)](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/lint.yml)

[otelcol](https://opentelemetry.io/docs/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Install

Plugin:

```shell
asdf plugin add otelcol
# or
asdf plugin add otelcol https://github.com/ChristianCiach/asdf-otelcol.git
```

otelcol:

```shell
# Show all installable versions
asdf list-all otelcol

# Install specific version
asdf install otelcol latest

# Set a version globally (on your ~/.tool-versions file)
asdf global otelcol latest

# Now otelcol commands are available
otelcol --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ChristianCiach/asdf-otelcol/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Christian Ciach](https://github.com/ChristianCiach/)
