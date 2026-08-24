# Toolchain Triage

Diagnose the ownership boundary before changing a build product.

## The Command Is Missing

Run `temper --help`, then `temper swift --help`. If the root command exists but the Swift family does not, verify that the installed Temper build includes the `temper-swift` specialization.

## A Build Uses the Wrong Swift

First inspect the selected toolchain with Temper. Then start a new shell and verify `swift --version` and the resolved executable path. Vaporize and other build products intentionally use the selected `swift` from `PATH`; changing those products is not the repair for a selection problem.

## SwiftPM Cannot Resolve Dependencies

Use the default published graph unless you are developing the specialization locally. For a controlled local graph, set `SPM_USE_LOCAL_DEPS=true`; override the sibling specialization only when necessary with `TEMPER_SWIFT_PATH`.

Do not mix an isolated local transitive package with the published `temper-swift` graph. SwiftPM treats two locations with the same package identity as a conflict.

## Windows Notes

Temper’s command-composition suite is supported on Windows. Platform-specific install and archive behavior belongs to `temper-swift`; investigate its platform adapter and libarchive setup when a lifecycle operation fails after the umbrella command has parsed successfully.

