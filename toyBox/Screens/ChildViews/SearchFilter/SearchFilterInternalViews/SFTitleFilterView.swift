import UIKit

class SFTitleFilterView: View {

    let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.bold, ofSize: 22)
        label.textColor = UIColor(named: "Text")
        label.text = "Options"
        return label
    }()

    let useTitleInSearchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.regular, ofSize: 18)
        label.textColor = UIColor(named: "Text")
        label.text = "Search in titles"
        return label
    }()

    let useTitleInSearchSwitch: UISwitch = {
        let view = UISwitch()
        view.onTintColor = UIColor(named: "Accent")
        view.isOn = true
        return view
    }()

    let useDescriptionInSearchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.regular, ofSize: 18)
        label.textColor = UIColor(named: "Text")
        label.text = "Search in descriptions"
        return label
    }()

    let useDescriptionInSearchSwitch: UISwitch = {
        let view = UISwitch()
        view.onTintColor = UIColor(named: "Accent")
        view.isOn = false
        return view
    }()

    override func setupProperties() {
        backgroundColor = UIColor(named: "PopupSectionBackground")
        layer.cornerRadius = 10
        layer.borderColor = UIColor(named: "PopupSectionFrame")?.cgColor
        layer.borderWidth = 1.0
    }

    override func setupConstraints() {
        constraintToAllEdges(of: self)
        addSubviews([categoryTitleLabel,
                     useTitleInSearchLabel, useTitleInSearchSwitch,
                     useDescriptionInSearchLabel, useDescriptionInSearchSwitch])

        categoryTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: distanceFromEdge).isActive = true
        categoryTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: distanceFromEdge).isActive = true

        useTitleInSearchSwitch.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: distanceBetweenGroups).isActive = true
        useTitleInSearchSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -distanceFromEdge).isActive = true
        useTitleInSearchLabel.centerYAnchor.constraint(equalTo: useTitleInSearchSwitch.centerYAnchor).isActive = true
        useTitleInSearchLabel.leadingAnchor.constraint(equalTo: categoryTitleLabel.leadingAnchor).isActive = true


        useDescriptionInSearchSwitch.topAnchor.constraint(equalTo: useTitleInSearchSwitch.bottomAnchor, constant: distanceBetweenControls).isActive = true
        useDescriptionInSearchSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -distanceFromEdge).isActive = true
        useDescriptionInSearchLabel.centerYAnchor.constraint(equalTo: useDescriptionInSearchSwitch.centerYAnchor).isActive = true
        useDescriptionInSearchLabel.leadingAnchor.constraint(equalTo: categoryTitleLabel.leadingAnchor).isActive = true

    }
}
