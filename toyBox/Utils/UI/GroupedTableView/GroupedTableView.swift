//import UIKit
//
//class GroupedTableView: UITableView {
//
//    private weak var groupedDataSource: UITableViewDataSource?
//    private weak var groupedDelegate: UITableViewDelegate?
//
//    private(set) var sectionStates = [Bool]()
//
//    public var shouldHandleHeadersTap = true
//    public var didTapSectionHeaderView: ((_ sectionIndex: Int, _ isOpen: Bool) -> Void)?
//
//    override open var dataSource: UITableViewDataSource? {
//        set {
//            self.groupedDataSource = newValue
//            super.dataSource = self.groupedDataSource
//        }
//        get { return super.dataSource }
//    }
//
//    override open var delegate: UITableViewDelegate? {
//        set {
//            self.groupedDelegate = newValue
//            super.delegate = self.groupedDelegate
//        }
//        get { return super.delegate }
//    }
//
//    override open func forwardingTarget(for aSelector: Selector!) -> Any? {
//        if sel_isEqual(aSelector, #selector(tableView(_:viewForHeaderInSection))) {
//            return groupedDelegate?.responds(to: aSelector) ?? false
//        }
//    }
//}
