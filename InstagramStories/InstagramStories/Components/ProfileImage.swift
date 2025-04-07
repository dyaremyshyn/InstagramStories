//
//  ProfileImage.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct ProfileImage: View {
    let imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .mediumSize()
                    .clipShape(.circle)
            } else {
                Circle().fill(Color.gray).mediumSize()
            }
        }
    }
}

#Preview {
    ProfileImage(imageUrl: "https://i.pravatar.cc/300?u=1")
}
