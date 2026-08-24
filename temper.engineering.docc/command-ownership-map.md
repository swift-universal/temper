# Command Ownership Map

| Surface | Owner | Responsibility |
| --- | --- | --- |
| `temper` | Temper | Umbrella help, composition, and asynchronous dispatch |
| `temper swift ...` | `temper-swift` | Swift discovery, installation, selection, update, removal, and platform behavior |
| selected `swift` on `PATH` | Temper plus its Swift specialization | Toolchain-selection result consumed by downstream products |
| build and project materialization | Vaporize | Executes work with the already selected compiler; retains macOS Xcode-provider behavior |

New toolchains should arrive as sibling specializations beneath Temper. Their internal lifecycle logic must not be copied into the umbrella or into build products.

