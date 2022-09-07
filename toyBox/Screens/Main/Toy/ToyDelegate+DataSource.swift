import UIKit

struct ToyPropertySections {
    var sectionName: String
    var properties: [ToyPropertyType]
}

class ToyDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    lazy var sections = [ToyPropertySections]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("sections[section].properties.count", sections[section].properties.count)
        return sections[section].properties.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // print("sections.count", sections.count)
        return sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToyViewCell.identifier, for: indexPath) as? ToyViewCell else { return UITableViewCell() }
        let property = sections[indexPath.section].properties[indexPath.row]
        cell.model = ToyPropertyType(name: property.name, value: property.value)
        cell.setBackgroundColor(forRow: indexPath.row)

        return cell
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ToyHeaderView.identifier) as? ToyHeaderView else {
//            print("xxxxxx")
//            return UITableViewHeaderFooterView()
//        }
//        view.titleLabel.text = sections[section].sectionName
//        let view = UIView()
//        view.backgroundColor = .red
//
//        return view
//    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionName
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 33
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 33
    }

}
