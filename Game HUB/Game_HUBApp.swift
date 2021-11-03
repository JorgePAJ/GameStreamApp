//
//  Game_HUBApp.swift
//  Game HUB
//
//  Created by Jorge Plasencia on 03/11/21.
//

import SwiftUI
import Parse

@main
struct Game_HUBApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let configuration = ParseClientConfiguration {
          $0.applicationId = "ZkNZQHa3xG9j3fR7kjdK5LzXaeOAl9OvSRUnx5Bk"
          $0.clientKey = "YMMHUQvX1YtEc0ulstsLogskDC6RG3BeaiLQDkeK"
          $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        print("did finbish")
        return true
    }
}
