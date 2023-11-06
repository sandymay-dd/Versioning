enum CommitFormatError: Error {
    case invalid
    case invalidPrefix(Substring)
}
extension CommitFormatError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalid:
            """
            \u{001B}[0;31mInvalid commit message format.
            \u{001B}[0;33m
            Please use Conventional Commits.
            https://www.conventionalcommits.org
            """
        case .invalidPrefix(let prefix):
            """
            \u{001B}[0;31m"\(prefix)" is not an allowed commit prefix.
            \u{001B}[0;33m
            Allowed prefixes include feat, fix, test, refactor, ci.
            See the specification: https://www.conventionalcommits.org
            """
        }
    }
}
