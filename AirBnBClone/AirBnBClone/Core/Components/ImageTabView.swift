//
//  ImageTabView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct ImageTabView: View {
    var images: [String] //이거는 인젝션 해야함

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
            }
        }
        .tabViewStyle(.page)
    }

}

#Preview {
    ImageTabView(images: ["1", "2", "3"])
}
