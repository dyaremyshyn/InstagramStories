//
//  StoryCellView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct StoryCellView: View {
    var story: Story

    var body: some View {
        VStack {
            ProfileImage(imageUrl: story.profilePictureURL)
            .overlay(Circle().stroke(
                story.isSeen ?
                AnyShapeStyle(Color.gray) :
                AnyShapeStyle(AngularGradient(gradient: .init(colors: [.red, .orange, .red]), center: .center)),
                lineWidth: 3
            ))
            Text(story.name)
                .font(.caption)
        }
        .padding(.leading, 8)
    }
}

#Preview {
    StoryCellView(
        story: Story(
            id: 1234,
            name: "username",
            profilePictureURL: "https://i.pravatar.cc/300?u=1"
        )
    )
}
