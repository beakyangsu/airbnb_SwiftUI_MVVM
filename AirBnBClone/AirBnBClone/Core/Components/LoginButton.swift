//
//  LoginButton.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct LoginButton: View {
    var body: some View {
        Button {
            print("Log in")
        }label: {
            Text("Log in")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.subheadline)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))

        }
    }
}

#Preview {
    LoginButton()
}
