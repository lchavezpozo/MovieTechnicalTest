//
//  SceneDelegate.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let rootController = MovieCategoryListModule.build()
        let navigationController = UINavigationController(rootViewController: rootController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

