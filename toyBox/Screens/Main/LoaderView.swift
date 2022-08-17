import UIKit

class LoaderView: View {

    let loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.color = UIColor(named: "Accent")
        return view
    }()

    override func setupConstraints() {
        addSubviews([loadingIndicator])

        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
