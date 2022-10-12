import UIKit

final class LoaderView: View {

    let loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.color = UIColor(named: "Accent")
        return view
    }()

    private let loadingLabel: Label = {
        let label = Label()
        label.text = "loading..."
        label.font = UIFont.fontKarla(.ligth, ofSize: 20)
        label.textColor = UIColor.white
        return label
    }()

    override func setupConstraints() {
        addSubviews([loadingIndicator, loadingLabel])

        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        loadingLabel.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 10).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    override func setupProperties() {
        backgroundColor = UIColor(named: "Background")!.withAlphaComponent(0.5)
    }
}
