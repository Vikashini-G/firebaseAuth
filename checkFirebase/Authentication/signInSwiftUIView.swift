//
//  signInSwiftUIView.swift
//  checkFirebase
//
//  Created by Vikashini G on 03/03/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn(){
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or psswd found")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }

    }
    
}

struct signInSwiftUIView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(20)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(20)
            Button{
                viewModel.signIn()
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 55)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign in with email")
    }
}

#Preview {
    NavigationStack{
        signInSwiftUIView()
    }
}
