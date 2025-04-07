//
//  StoryListView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct StoryListView: View {
    @State var viewModel = StoryListViewModel()
    @State private var show = false
    
    var body: some View {
        ZStack {
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.stories) { story in
                            StoryCellView(story: story)
                                .onTapGesture {
                                    viewModel.selectedStory = story
                                    show = true
                                }
                                .onAppear() {
                                    viewModel.loadMoreStories(ifNeededFor: story.id)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .fullScreenCover(isPresented: $show, content: {
            StoryDetailView(viewModel: viewModel.buildViewModel())
        })
    }
}


#Preview {
    StoryListView()
}
