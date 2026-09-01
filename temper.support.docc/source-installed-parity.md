# Source and Installed Parity

The source-built and installed executables must expose the same ownership boundary:

- `temper` is the umbrella command.
- `temper swift ...` is the Swift specialization.
- flattened commands such as `temper use` are rejected.
- build products consume the selected toolchain instead of duplicating lifecycle commands.

Verify a source checkout with:

```sh
swift build
swift test
swift run temper.cli@swift-universal.clia.sh --help
```

After installing a release, repeat the help checks with the installed `temper` executable. A mismatch means the installed artifact is stale or came from a different revision; it does not justify adding a compatibility command to the source product.
