//
//  StoryDetailView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct StoryDetailView: View {
    @State var viewModel: StoryDetailViewModel
    @State var show: Bool = true
    @State private var dragOffset: CGFloat = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(edges: .all)
            VStack(alignment: .leading, spacing: 16) {
                LoaderView(show: $show)
                HStack {
                    ProfileImage(imageUrl: viewModel.story.profilePictureURL)
                    Text(viewModel.story.name)
                        .foregroundStyle(.white)
                        .font(.caption)
                }
                AsyncImage(url: URL(string: viewModel.story.profilePictureURL)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else {
                        EmptyView()
                    }
                }

                Spacer()
                HStack {
                    Spacer()
                    Button(action:viewModel.toggleLike) {
                        HStack {
                            Image(systemName: viewModel.story.isLiked ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.story.isLiked ? .red : .gray)
                        }
                        .padding()
                        .cornerRadius(8)
                    }
                }
            }
        }
        .onAppear {
            viewModel.markSeen()
        }
        .onChange(of: show) { _, newValue in
            if !show { dismiss() }
        }
        .offset(y: dragOffset)
        .gesture(DragGesture()
            .onChanged { value in
                if value.translation.height > 0 {
                    dragOffset = value.translation.height
                }
            }
            .onEnded { _ in
                if dragOffset > 150 {
                    dismiss()
                } else {
                    withAnimation {
                        dragOffset = 0
                    }
                }
            }
        )
    }
}

#Preview {
    StoryDetailView(
        viewModel: StoryDetailViewModel(
            story: Story(
                id: 1234,
                name: "username",
                profilePictureURL: "https://i.pravatar.cc/300?u=1"
            )
        )
    )
}
