//
//  StoryListView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct StoryListView: View {
    @State var viewModel = StoryListViewModel()
    @State private var presentedView: AnyView?
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.05).ignoresSafeArea()
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.stories) { story in
                            StoryCellView(story: story)
                                .onTapGesture {
                                    presentedView = AnyView(StoryDetailView(viewModel: viewModel.buildViewModel(story: story)))
                                }
                                .onAppear() {
                                    viewModel.loadMoreStories(ifNeededFor: story.id)
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
        }
        .fullScreenCover($presentedView)
    }
}


#Preview {
    StoryListView()
}
