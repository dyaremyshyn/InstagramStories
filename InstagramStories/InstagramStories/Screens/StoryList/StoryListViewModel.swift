//
//  StoryListViewModel.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation
import Combine

@Observable class StoryListViewModel {
    var stories: [Story] = []
    @ObservationIgnored var selectedStory: Story!
    @ObservationIgnored private var pages: [[Story]] = []
    @ObservationIgnored private var currentPageIndex: Int = 0
    @ObservationIgnored @Injected(\.userReaderService) private var userReaderService
    @ObservationIgnored @Injected(\.persistenceService) private var persistenceService
    @ObservationIgnored private var subscriptions: [AnyCancellable] = []
    
    init() {
        loadData()
        loadMoreStories()
        
        persistenceService.seenStoryUpdatedPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: seenStoryUpdated)
            .store(in: &subscriptions)
    }
    
    func loadMoreStories(ifNeededFor id: Int) {
        if id == stories.last?.id {
            loadMoreStories()
        }
    }
        
    func loadMoreStories() {
        guard !pages.isEmpty else { return }
        let page = pages[currentPageIndex]
        let updatedPage = page.map { story in
            var copy = story
            copy.isSeen = persistenceService.isSeen(story.id)
            copy.isLiked = persistenceService.isLiked(story.id)
            return copy
        }
        stories.append(contentsOf: updatedPage)
        currentPageIndex = (currentPageIndex + 1) % pages.count
    }

    func buildViewModel() -> StoryDetailViewModel {
        StoryDetailViewModel(story: selectedStory)
    }
}

private extension StoryListViewModel {
    func loadData() {
        do{
            let usersResponse = try userReaderService.read(fileName: "users")
            pages = usersResponse.pages.map { $0.users }
        } catch {
            print("Error loading data \(error.localizedDescription)")
        }
    }
    
    func seenStoryUpdated(_ storyId: Int) {
        if let index = stories.firstIndex(where: { $0.id == storyId }) {
            stories[index].isSeen = persistenceService.isSeen(storyId)
        }
    }
}
