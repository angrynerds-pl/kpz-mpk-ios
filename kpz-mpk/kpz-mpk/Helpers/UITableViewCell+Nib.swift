
import Foundation
import UIKit

protocol HavingReuseIdentifier: AnyObject {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: HavingXib, HavingReuseIdentifier { }

extension HavingXib where Self: UITableViewCell {

    static func register(to tableView: UITableView) {
        tableView.register(xib(), forCellReuseIdentifier: reuseIdentifier)
    }
}

extension HavingReuseIdentifier where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
