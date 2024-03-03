//
//  checkFirebaseApp.swift
//  checkFirebase
//
//  Created by Vikashini G on 03/03/24.
//

import SwiftUI
import Firebase
@main
struct checkFirebaseApp: App {
    init(){
        
        FirebaseApp.configure()
        
    }
    var body: some Scene {
        WindowGroup {
            rootSwiftUIView()
        }
    }
}
