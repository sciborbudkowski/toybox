import UIKit

struct SettingsSelectionOption {
    var title: String
    var state: Bool
}

enum SettingsCellType {
    case parent(String, [SettingsCellType])
    case switchOption(String, Bool)
    case externalLink(String, URL)
    case info(String, UIImage? = nil)
    case selection(String, [SettingsSelectionOption])
}

protocol SettingsCellContent {
    func createContent(for cellType: SettingsCellType)
}

class SettingsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var items: [SettingsCellType] = [
        SettingsCellType.info("toyBox\nVersion 0.1", UIImage(named: "AppIcon")),
        SettingsCellType.selection("Starting Screen", [
            SettingsSelectionOption(title: "Dashboard", state: true),
            SettingsSelectionOption(title: "Cart", state: false),
            SettingsSelectionOption(title: "Favorites", state: false)
        ]),
        SettingsCellType.switchOption("The switch is on", true),
        SettingsCellType.switchOption("The switch is off", false),
        SettingsCellType.externalLink("Some link here", URL(string: "https://www.google.com")!),
        SettingsCellType.parent("Testing parent", [
            SettingsCellType.switchOption("switch 1", true),
            SettingsCellType.switchOption("switch 2", false)
        ])
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsViewCell.identifier, for: indexPath) as? SettingsViewCell else {
            return UITableViewCell()
        }
        cell.createContent(for: items[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = items[indexPath.row]

        switch currentItem {
        case .info:
            break

        case .parent(_, let childItems):
            print(childItems.count)
            print(childItems)
            items = childItems
            tableView.reloadData()
            tableView.setNeedsUpdateConstraints()

        case .switchOption(_, _):
            break

        case .externalLink(_, let url):
            UIApplication.shared.open(url)

        case .selection(_, _):
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let test = items[indexPath.row]
        if case .info = test {
            return 175
        }

        return 40
    }
}
