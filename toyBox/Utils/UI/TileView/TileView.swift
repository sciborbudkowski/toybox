import UIKit

class TileView: View {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.FontKarla(.medium, ofSize: 16)
        label.textColor = .black
        return label
    }()

    let allButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "All >", attributes: [
            NSAttributedString.Key.font: UIFont.FontKarla(.medium, ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor(named: "Accent")!
        ]), for: .normal)
        return button
    }()

    private let topRowView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        return view
    }()

    private let tilesView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

    private let topButtonsView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()

    private let bottomButtonsView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()

    private let buttonTL: TileButton = {
        let button = TileButton()
        return button
    }()

    private let buttonTR: TileButton = {
        let button = TileButton()
        return button
    }()

    private let buttonBL: TileButton = {
        let button = TileButton()
        return button
    }()

    private let buttonBR: TileButton = {
        let button = TileButton()
        return button
    }()

    var buttons: [TileButton] = []

    override func setupConstraints() {
        addSubviews([topRowView, tilesView])

        topRowView.addArrangedSubview(titleLabel)
        topRowView.addArrangedSubview(allButton)

        topRowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topRowView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topRowView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        tilesView.addArrangedSubview(topButtonsView)
        tilesView.addArrangedSubview(bottomButtonsView)

        tilesView.topAnchor.constraint(equalTo: topRowView.bottomAnchor, constant: 5).isActive = true
        tilesView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tilesView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        topButtonsView.addArrangedSubview(buttonTL)
        topButtonsView.addArrangedSubview(buttonTR)

        topButtonsView.widthAnchor.constraint(equalTo: tilesView.widthAnchor).isActive = true

        buttonTL.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonTR.heightAnchor.constraint(equalToConstant: 100).isActive = true

        bottomButtonsView.addArrangedSubview(buttonBL)
        bottomButtonsView.addArrangedSubview(buttonBR)

        bottomButtonsView.widthAnchor.constraint(equalTo: tilesView.widthAnchor).isActive = true

        buttonBL.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonBR.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    override func setupProperties() {
        buttons = [buttonTL, buttonTR, buttonBL, buttonBR]
    }
}
