# Dependency Modes

Temper supports a published default graph and one controlled local-development graph.

## Published Mode

With no environment override, SwiftPM resolves `temper-swift` from `swift-universal/temper-swift` on `main`. This branch pin is intentional until the specialization publishes a compatible release tag.

## Controlled Local Mode

Set `SPM_USE_LOCAL_DEPS=true` to use the canonical sibling checkout at:

```text
../../universal/domain/build/toolchains/temper-swift
```

Set `TEMPER_SWIFT_PATH` only when that specialization checkout is elsewhere. The override must identify a directory containing `Package.swift`.

Temper does not expose a separate local override for `swift-argument-parser`. The specialization and umbrella must share one compatible package identity; a one-sided override creates an invalid duplicate graph.

