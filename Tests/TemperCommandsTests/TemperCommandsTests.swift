import ArgumentParser
import TemperSwiftCommands
import Testing

@testable import TemperCommands

@Suite("Temper command composition")
struct TemperCommandsTests {
    @Test("Temper owns the umbrella command")
    func rootCommandName() {
        func requireAsyncCommand<Command: AsyncParsableCommand>(_: Command.Type) {}

        requireAsyncCommand(Temper.self)
        #expect(Temper.configuration.commandName == "temper")
    }

    @Test("Swift commands compose beneath Temper")
    func parsesSwiftCommandFamilyAsynchronously() async throws {
        let command = try await Temper.asyncParseAsRoot([
            "swift", "use", "--print-location",
        ])
        #expect(String(reflecting: type(of: command)) == "TemperSwiftCommands.Use")
    }

    @Test("Temper does not flatten Swift commands into its root")
    func rejectsFlattenedSwiftCommand() {
        #expect(throws: (any Error).self) {
            _ = try Temper.parseAsRoot(["use"])
        }
    }
}
