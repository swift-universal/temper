# Verification Contract

A Temper product change is ready to publish when all of these checks pass from the canonical repository:

1. `swift package dump-package` validates the manifest.
2. `swift build` succeeds with the default published dependency graph.
3. `swift test` passes the umbrella command-composition suite.
4. `SPM_USE_LOCAL_DEPS=true swift test` passes against the canonical sibling specialization.
5. `git diff --check` reports no whitespace errors.
6. The product Bead records the ownership decision, platform evidence, and any known limitation.

The composition suite must prove that `temper swift ...` parses through the asynchronous root and that the flattened `temper use` form remains invalid.

