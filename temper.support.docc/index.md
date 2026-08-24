# Temper Support

Use Temper to select and manage development toolchains through one stable command surface.

Temper is the umbrella product. Toolchain specializations live beneath it; the first specialization is Swift and is invoked as `temper swift ...`.

## Start Here

- <doc:getting-started>
- <doc:toolchain-triage>
- <doc:source-installed-parity>

## Product Boundary

Temper owns toolchain selection and lifecycle. Build products such as Vaporize consume the selected compiler from `PATH`; they do not install, update, or choose Swift toolchains.

