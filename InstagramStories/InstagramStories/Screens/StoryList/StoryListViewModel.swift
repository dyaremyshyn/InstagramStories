//
//  StoryListViewModel.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

@Observable class StoryListViewModel {
    var stories: [Story] = []
    @ObservationIgnored private var pages: [[Story]] = []
    @ObservationIgnored private var currentPageIndex: Int = 0
    @ObservationIgnored @Injected(\.userReaderService) private var userReaderService
    @ObservationIgnored @Injected(\.persistenceService) private var persistenceService
    var showErrorToast: Bool = false
    
    init() {
        loadData()
        loadMoreStories()
    }
    
    private func loadData() {
        do{
            let usersResponse = try userReaderService.read(fileName: "users")
            pages = usersResponse.pages.map { $0.users }
        } catch {
            print("Error loading data \(error.localizedDescription)")
            showErrorToast = true
        }
    }
    
    func loadMoreStories() {
        guard !pages.isEmpty else { return }
        let page = pages[currentPageIndex]
        let updatedPage = page.map { story -> Story in
            var copy = story
            copy.isSeen = persistenceService.isSeen(story.id)
            copy.isLiked = persistenceService.isLiked(story.id)
            return copy
        }
        stories.append(contentsOf: updatedPage)
        currentPageIndex = (currentPageIndex + 1) % pages.count
    }

}
