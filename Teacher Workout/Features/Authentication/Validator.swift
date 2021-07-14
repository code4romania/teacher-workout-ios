import Foundation

enum ValidationType {
    case email
    case password
}

class Validator {
    static let shared = Validator()

    private init() {}

    func isValidData(data: String, type: ValidationType) -> Bool {
        var regExPattern: String = ""

        switch type {
        case .email:
            regExPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .password:
            regExPattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"
        }

        let predicate = NSPredicate(format: "SELF MATCHES %@", regExPattern)
        return predicate.evaluate(with: data)
    }

    func isSameData(first: String, second: String) -> Bool {
        first == second
    }
}
