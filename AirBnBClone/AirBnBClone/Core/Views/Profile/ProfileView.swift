//
//  ProfileView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //profile log in view
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)

                    Text("Log in to Start planning your next trip")

                    LoginButton()
                }

                HStack {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }

            //profile options
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Setting")
                ProfileOptionRowView(imageName: "gear", title: "Accessiblity")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit help center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
