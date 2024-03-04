//
//  authenticationSwiftUIView.swift
//  checkFirebase
//
//  Created by Vikashini G on 03/03/24.
//

import SwiftUI

struct authenticationSwiftUIView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        VStack{
            NavigationLink{
                signInSwiftUIView(showSignInView: $showSignInView)
            } label: {
                Text("Sign in with email")
                    .font(.headline)
                    .frame(width: 300, height: 55)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(20)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign in")
    }
}

#Preview {
    NavigationStack{
        authenticationSwiftUIView(showSignInView: .constant(false))
    }
}
