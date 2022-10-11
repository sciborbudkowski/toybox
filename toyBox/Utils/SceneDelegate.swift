import UIKit
import FirebaseAuthUI
import FirebaseFacebookAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI
import FirebaseEmailAuthUI
import FBSDKCoreKit
import FBSDKLoginKit
import Bagel

class SceneDelegate: UIResponder, UIWindowSceneDelegate, FUIAuthDelegate {

    var window: UIWindow?

    let providers: [FUIAuthProvider] = [
        FUIGoogleAuth(authUI: FUIAuth.defaultAuthUI()!),
        FUIFacebookAuth(authUI: FUIAuth.defaultAuthUI()!),
        FUIOAuth.twitterAuthProvider(),
        FUIEmailAuth()
    ]

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        authUI?.providers = providers

        window = UIWindow(windowScene: windowScene)

        let viewController = SignInViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

#if targetEnvironment(simulator)
        Bagel.start()
#endif
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}
