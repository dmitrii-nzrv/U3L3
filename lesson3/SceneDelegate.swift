//
//  SceneDelegate.swift
//  lesson3
//
//  Created by Dmitrii Nazarov on 09.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        self.window?.rootViewController = Builder.createMainView()
        self.window?.makeKeyAndVisible()
    }

    


}

