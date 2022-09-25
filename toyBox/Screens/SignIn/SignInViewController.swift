import UIKit
import Combine
import CombineCocoa
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAuthUI
import FirebaseEmailAuthUI
import GoogleSignIn
import AuthenticationServices

class SignInViewController: ViewController {

    private let customView = SignInView()

    private var twitterAuthProvider = OAuthProvider(providerID: "twitter.com")
    private var authState: AuthStateDidChangeListenerHandle?

    fileprivate var currentNonce: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func loadView() {
        view = customView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        authState = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }

            if user != nil {
                if Settings.shared.isAppFirstRun {
                    let introViewController = IntroViewController()
                    self.present(introViewController, animated: true)
                }

                if let userId = user?.uid {
                    Secrets.shared.userId = userId
                } else {
                    do {
                        try Auth.auth().signOut()
                        AccessToken.current = nil
                    } catch let error {
                        self.showErrorAlert(button: "OK", title: "Error", message: "Error signing out: \(error.localizedDescription)")
                    }
                }
                
                let tabBarViewController = TabBarViewController()
                self.navigationController?.pushViewController(tabBarViewController, animated: true)
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        Auth.auth().removeStateDidChangeListener(authState!)
    }

    override func setupCombineComponents() {
        customView.loginButton.tapPublisher.sink { [weak self] _ in
            guard let emailFieldTextValidation = self?.customView.usernameField.text?.isEmailAddressValid(),
                  let email = self?.customView.usernameField.text,
            emailFieldTextValidation else {
                self?.showErrorAlert(button: "OK", title: "Error", message: "Email address is either empty or incorrect.")
                return
            }

            guard let password = self?.customView.passwordField.text, password != "" else {
                self?.showErrorAlert(button: "OK", title: "Error", message: "Password can not be empty.")
                return
            }

            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                if let error = error, result == nil {
                    self?.showErrorAlert(button: "OK", title: "Error", message: "Authentication failed: \(error.localizedDescription)")
                    return
                }
            }
        }.store(in: &cancellables)

        customView.fbButton.gesture().sink { _ in
            let loginManager = LoginManager()
            loginManager.logIn(permissions: [], from: self) { [weak self] result, error in
                if let error = error {
                    self?.showErrorAlert(button: "OK", title: "Error", message: error.localizedDescription)
                    return
                }
                
                guard let facebookToken = AccessToken.current?.tokenString else { return }
                let credential = FacebookAuthProvider.credential(withAccessToken: facebookToken)
                Auth.auth().signIn(with: credential) { [weak self] result, error in
                    if let error = error {
                        self?.showErrorAlert(button: "OK", title: "Error", message: error.localizedDescription)
                        return
                    }
                }
            }
        }.store(in: &cancellables)

        customView.googleButton.gesture().sink { _ in
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            let config = GIDConfiguration(clientID: clientID)

            GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
                if let error = error {
                    print("error 1:", error.localizedDescription)
                    return
                }

                guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }

                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

                Auth.auth().signIn(with: credential) { result, error in
                    if let error = error {
                        print("error 2:", error.localizedDescription)
                        return
                    }
                }
            }
        }.store(in: &cancellables)

        customView.twitterButton.gesture().sink { [weak self] _ in
            self?.twitterAuthProvider.getCredentialWith(nil) { credential, error in
                if error != nil {
                    print("error 1", error?.localizedDescription ?? "")
                    return
                }
                if let credential = credential {
                    Auth.auth().signIn(with: credential) { authResult, error in
                        if error != nil {
                            print("error 2", error ?? "")
                        } else {
                            Auth.auth().currentUser?.link(with: credential) { result, error in
                                if let error = error {
                                    print("error 3", error)
                                }
                            }
                        }
                    }
                }
            }
        }.store(in: &cancellables)

        customView.appleButton.gesture().sink { [weak self] _ in
            let nonce = String.randomNonceString()
            self?.currentNonce = nonce
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            request.nonce = String.sha256(nonce)

            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }.store(in: &cancellables)

        customView.signupButton.tapPublisher.sink { [weak self] _ in
            let signupPopup = SignUpViewController()
            self?.present(signupPopup, animated: true)
        }.store(in: &cancellables)
    }
}

extension SignInViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: a login callback was received, but no login request was sent.")
            }

            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token.")
                return
            }

            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }

            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)

            Auth.auth().signIn(with: credential) { [weak self] result, error in
                if let error = error {
                    self?.showErrorAlert(button: "OK", title: "Error", message: error.localizedDescription)
                    return
                }
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        showErrorAlert(button: "OK", title: "Error", message: error.localizedDescription)
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
