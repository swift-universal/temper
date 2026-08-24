# Temper Engineering

Temper is the compositional front door for development-toolchain specializations.

## Architecture

- <doc:command-ownership-map>
- <doc:dependency-modes>
- <doc:verification-contract>

The umbrella stays deliberately thin: it composes typed command families and dispatches them asynchronously while each specialization retains its models, platform adapters, and lifecycle behavior.

