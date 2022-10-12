import UIKit

final class CategoriesView: View {

    let categoriesTableView: UITableView = {
        let view = UITableView()
        view.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
        view.allowsSelection = false
        return view
    }()

    override func setupConstraints() {
        super.setupConstraints()
        addSubviews([categoriesTableView])

        categoriesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        categoriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        categoriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        categoriesTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
