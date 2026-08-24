# ``TemperCommands/Temper``

@Metadata {
    @TechnologyRoot
}

Temper is the parent toolchain CLI. Each toolchain contributes a narrowly scoped
command family; the Swift family is provided by `TemperSwiftCommands` and is
invoked as `temper swift ...`.

## Ownership

- `TemperSwift` owns Swift toolchain models and non-CLI behavior.
- `TemperSwiftCommands` owns the Swift command family.
- `TemperCommands` composes command families without absorbing their internals.
- `Temper` and every hosted command family dispatch through an asynchronous
  ArgumentParser path.
- Build systems resolve a selected toolchain through Temper, then execute their
  own work through their process authority.
