# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test seed7 https://github.com/susurri/asdf-seed7.git "s7c -?"
```

Tests are automatically run in GitHub Actions on push and PR.
