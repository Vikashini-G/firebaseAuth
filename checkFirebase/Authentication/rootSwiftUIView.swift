//
//  rootSwiftUIView.swift
//  checkFirebase
//
//  Created by Vikashini G on 03/03/24.
//

import SwiftUI

struct rootSwiftUIView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                settingsSwiftUIView(showSignInView: $showSignInView)
            }
        }
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack{
                authenticationSwiftUIView()
            }
        }
    }
}

#Preview {
    rootSwiftUIView()
}
