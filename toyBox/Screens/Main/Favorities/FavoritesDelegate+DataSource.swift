import UIKit

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.identifier, for: indexPath) as? FavoriteViewCell else {
            return UITableViewCell()
        }

        let currentItem = items[indexPath.row]
        let model = FavoriteCellModel(image: currentItem.images.first,
                                      title: currentItem.name,
                                      place: currentItem.location.placeName,
                                      distance: LocationUpdater.shared.getDistance(to: currentItem.location),
                                      price: String(currentItem.price),
                                      id: currentItem.id)
        cell.configure(with: model)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toyViewController = ToyViewController(updateViewCount: true)
        toyViewController.configure(with: items[indexPath.row])
        navigationController?.pushViewController(toyViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
