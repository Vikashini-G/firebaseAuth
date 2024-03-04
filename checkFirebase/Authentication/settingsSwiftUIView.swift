//
//  settingsSwiftUIView.swift
//  checkFirebase
//
//  Created by Vikashini G on 03/03/24.
//

import SwiftUI

@MainActor
final class settingsSwiftUIViewModel: ObservableObject {
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
    }
    
}

struct settingsSwiftUIView: View {
    @StateObject private var viewModel = settingsSwiftUIViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            Button("Log out"){
                Task{
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch{
                        print(error)
                    }
                }
            }
            Button("Result password"){
                Task{
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch{
                        print(error)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        settingsSwiftUIView(showSignInView: .constant(false))
    }
}
