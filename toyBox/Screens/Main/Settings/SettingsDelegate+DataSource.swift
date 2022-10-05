import UIKit

enum SettingsCellType {
    case parent(String, [SettingsCellType])
    case switchOption(String, Bool)
    case externalLink(String, URL)
    case info(String, UIImage? = nil)
}

protocol SettingsCellContent {
    func createContent(for cellType: SettingsCellType)
}

class SettingsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var items: [SettingsCellType] = [
        SettingsCellType.parent("Title for parent", [
            SettingsCellType.info("Info 1"),
            SettingsCellType.info("Info 2"),
            SettingsCellType.info("Info 3")
        ]),
        SettingsCellType.switchOption("The switch is on", true),
        SettingsCellType.switchOption("The switch is off", false),
        SettingsCellType.externalLink("Some link here", URL(string: "https://www.google.com")!),
        SettingsCellType.info("2022-10-05 13:17:49.645271+0200 toyBox[89172:10031725] [Presentation] Attempt to present <UIAlertController: 0x14d009800> on <UINavigationController: 0x14b057000> (from <toyBox.DashboardViewController: 0x14a01a600>) which is already presenting <toyBox.LoaderViewController: 0x149b6a3a0>.", UIImage(named: "AppIcon"))
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let test = items[indexPath.row]
        if case .info = test {
            return 200
        }

        return 50
    }
}
