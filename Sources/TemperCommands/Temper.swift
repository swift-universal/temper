import ArgumentParser
import TemperSwiftCommands

/// The umbrella command for selecting and managing development toolchains.
@available(macOS 10.15, macCatalyst 13, iOS 13, tvOS 13, watchOS 6, *)
public struct Temper: AsyncParsableCommand {
    public static let configuration = CommandConfiguration(
        commandName: "temper",
        abstract: "Select and manage development toolchains.",
        subcommands: [
            TemperSwiftCommands.self,
        ]
    )

    public init() {}
}

@available(macOS 10.15, macCatalyst 13, iOS 13, tvOS 13, watchOS 6, *)
public extension Temper {
    /// Executes the root and every composed command family through ArgumentParser's
    /// asynchronous parsing and dispatch path.
    static func runMain(_ arguments: [String]? = nil) async {
        do {
            var command = try await asyncParseAsRoot(arguments)
            if var asyncCommand = command as? any AsyncParsableCommand {
                try await asyncCommand.run()
            } else {
                try command.run()
            }
        } catch {
            exit(withError: error)
        }
    }
}
