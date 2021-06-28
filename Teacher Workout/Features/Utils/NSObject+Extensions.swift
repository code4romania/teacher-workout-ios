import Foundation

extension NSObject {
    @objc var className: String {
        String(describing: type(of: self))
    }

    class var className: String {
        String(describing: self)
    }
}
