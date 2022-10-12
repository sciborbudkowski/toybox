import UIKit

struct ToyPropertySections {
    var sectionName: String
    var properties: [ToyPropertyType]
}

final class ToyDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    lazy var sections = [ToyPropertySections]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].properties.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToyViewCell.identifier, for: indexPath) as? ToyViewCell else { return UITableViewCell() }
        let property = sections[indexPath.section].properties[indexPath.row]
        cell.model = ToyPropertyType(name: property.name, value: property.value)
        cell.setBackgroundColor(forRow: indexPath.row)

        return cell
    }

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
