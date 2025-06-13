<div align="center">

# asdf-otelcol [![Build](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/build.yml/badge.svg)](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/build.yml) [![Lint](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/lint.yml/badge.svg)](https://github.com/ChristianCiach/asdf-otelcol/actions/workflows/lint.yml)

[otelcol](https://opentelemetry.io/docs/collector/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [asdf-otelcol  ](#asdf-otelcol--)
- [Contents](#contents)
- [Install](#install)
  - [Selecting the Otelcol distribution](#selecting-the-otelcol-distribution)
- [Contributing](#contributing)
- [License](#license)

# Install

Plugin:

```shell
asdf plugin add otelcol https://github.com/ChristianCiach/asdf-otelcol.git
```

otelcol:

```shell
# Show all installable versions
asdf list all otelcol

# Install specific version
asdf install otelcol latest

# Set a version globally (on your ~/.tool-versions file)
asdf set --home otelcol latest

# Now otelcol commands are available
otelcol --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

## Selecting the Otelcol distribution

This plugin installs the "core" distribution of otelcol by default.

Another distribution can be selected by using the `ASDF_OTELCOL_DISTRIBUTION` environmental variable:

```shell
export ASDF_OTELCOL_DISTRIBUTION=contrib
asdf install otelcol latest
```

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ChristianCiach/asdf-otelcol/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Christian Ciach](https://github.com/ChristianCiach/)
