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
    
    func signUp() async throws{
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or psswd found")
            return
        }
        try await AuthenticationManager.shared.createUser(email: email, password: password)
//        Task {
//            do {
//                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
//                print("Success")
//                print(returnedUserData)
//            } catch {
//                print("Error: \(error)")
//            }
//        }

    }
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or psswd found")
            return
        }
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}

struct signInSwiftUIView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
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
            Button{ //make em seperate buttons
                Task{
                    do{
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch{
                        print(error)
                    }
                    
                    do{
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch{
                        print(error)
                    }
                }
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
        signInSwiftUIView(showSignInView: .constant(false))
    }
}
