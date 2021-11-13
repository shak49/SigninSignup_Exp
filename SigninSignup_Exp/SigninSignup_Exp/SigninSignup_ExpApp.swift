//
//  SigninSignup_ExpApp.swift
//  SigninSignup_Exp
//
//  Created by Shak Feizi on 11/13/21.
//

import SwiftUI
import Firebase
//import FirebaseCore

@main
struct SigninSignup_ExpApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        var viewModel: ViewModel = ViewModel()
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
