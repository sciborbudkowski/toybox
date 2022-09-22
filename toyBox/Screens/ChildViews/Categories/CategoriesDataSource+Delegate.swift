import UIKit

class CategoriesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    lazy var items: [CategoryModel] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorName = "Color\(indexPath.row % 10)"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
        cell.model = items[indexPath.row]
        cell.background.backgroundColor = UIColor(named: colorName)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
