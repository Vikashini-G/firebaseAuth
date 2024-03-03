//
//  authenticationSwiftUIView.swift
//  checkFirebase
//
//  Created by Vikashini G on 03/03/24.
//

import SwiftUI

struct authenticationSwiftUIView: View {
    var body: some View {
        VStack{
            NavigationLink{
                signInSwiftUIView()
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
        authenticationSwiftUIView()
    }
}
