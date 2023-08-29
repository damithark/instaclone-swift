//
//  InstaCloneApp.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-14.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .black
    return true
  }
}

@main
struct InstaCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
