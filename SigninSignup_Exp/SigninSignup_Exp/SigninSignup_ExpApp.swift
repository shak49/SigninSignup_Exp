//
//  SigninSignup_ExpApp.swift
//  SigninSignup_Exp
//
//  Created by Shak Feizi on 11/13/21.
//

import SwiftUI
import Firebase

@main
struct SigninSignup_ExpApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
