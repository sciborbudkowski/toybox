import UIKit
import Kingfisher
import CollapseTableView

class ToyView: View {

    let nameLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 20)
        label.text = "Some test text here"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.kf.setImage(with: URL(string: "https://ecsmedia.pl/c/lego-speed-champions-fast-furious-1970-dodge-charger-r-t-76912-w-iext116366406.jpg"))
        return view
    }()

    let brandLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.text = "Brand:"
        return label
    }()

    let brandLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "LEGO"
        return label
    }()

    let genderLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.text = "Gender:"
        return label
    }()

    let genderLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "boy"
        return label
    }()

    let seriesLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.text = "Series:"
        return label
    }()

    let seriesLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "LEGO SPEED CHAMPIONS"
        return label
    }()

    let quantityLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.text = "Elements:"
        return label
    }()

    let quantityLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "234"
        return label
    }()

    let ageLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.text = "Age:"
        return label
    }()

    let ageLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "8+ years"
        return label
    }()

    let colorLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 16)
        label.text = "Color:"
        return label
    }()

    let colorLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "various"
        return label
    }()

    let mainTableView: CollapseTableView = {
        let view = CollapseTableView()
        view.register(ToyViewCell.self, forCellReuseIdentifier: ToyViewCell.identifier)
        return view
    }()

    override func setupConstraints() {
        addSubviews([nameLabel, imageView, mainTableView])

        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        mainTableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
