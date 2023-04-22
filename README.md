<div align="center">

# asdf-seed7 [![Build](https://github.com/susurri/asdf-seed7/actions/workflows/build.yml/badge.svg)](https://github.com/susurri/asdf-seed7/actions/workflows/build.yml) [![Lint](https://github.com/susurri/asdf-seed7/actions/workflows/lint.yml/badge.svg)](https://github.com/susurri/asdf-seed7/actions/workflows/lint.yml)


[seed7](https://seed7.sourceforge.net/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `gcc`(Linux), `make` and the development packages for X11 and ncurses

# Install

Plugin:

```shell
asdf plugin add seed7
# or
asdf plugin add seed7 https://github.com/susurri/asdf-seed7.git
```

seed7:

```shell
# Show all installable versions
asdf list-all seed7

# Install specific version
asdf install seed7 latest

# Set a version globally (on your ~/.tool-versions file)
asdf global seed7 latest

# Now seed7 commands are available
s7c -?
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/susurri/asdf-seed7/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [susurri](https://github.com/susurri/)
