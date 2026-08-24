# Getting Started

Build Temper from its canonical product repository and inspect the composed command surface.

```sh
swift build
swift run temper --help
swift run temper swift --help
```

The Swift specialization provides lifecycle commands such as `list`, `list-available`, `install`, `use`, `update`, and `uninstall`. Always discover the exact arguments supported by the installed revision before making a machine-level change:

```sh
swift run temper swift use --help
```

## Verify Composition Without Changing a Toolchain

The following checks command composition and prints selection information without installing a toolchain:

```sh
swift test
swift run temper swift use --print-location
```

`swift test` verifies the umbrella boundary. `--print-location` is the read-oriented path used by the command-composition CUJ.

