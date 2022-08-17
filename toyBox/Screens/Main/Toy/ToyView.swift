import UIKit
import Kingfisher

class ToyView: View {

    let nameLabel: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.regular, ofSize: 20)
        label.text = "Some test text here"
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

    let nameLabelValue: Label = {
        let label = Label()
        label.textColor = UIColor(named: "Text")
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.text = "LEGO"
        return label
    }()
}
