import UIKit
import Combine
import CombineCocoa

class IntroViewController: ViewController {

    let customView = IntroView()

    let items: [IntroModel] = [
        IntroModel(image: UIImage(named: "Intro1")!,
                   title: "Welcome to toyBox!",
                   description: "Welcome fun is a lovely toy application that will help you welcome your child into the world. It will provide you with a personalized greeting, a song, and the ability to change the wallpaper and background color."),
        IntroModel(image: UIImage(named: "Intro2")!,
                   title: "Sell old toys",
                   description: "The best toys are never too expensive, so here are some great deals for holiday shopping."),
        IntroModel(image: UIImage(named: "Intro3")!,
                   title: "Exchange them too",
                   description: "If you're looking for a toy that has the best of both worlds, a traditional toy and a modern one, then you'll love the latest applications available on the App Store."),
        IntroModel(image: UIImage(named: "Intro4")!,
                   title: "Let's start!",
                   description: "A toy merry-go-round is a fun and easy project for woodworking and carpentry enthusiasts. This easy-to-build project is easy to follow and provides a step-by-step guide complete with pictures.", hasSkipButton: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func setupCombineComponents() {

    }
}
