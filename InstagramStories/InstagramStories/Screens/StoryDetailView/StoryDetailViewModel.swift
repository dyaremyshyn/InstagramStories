//
//  StoryDetailViewModel.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

@Observable class StoryDetailViewModel {
    var story: Story
    @ObservationIgnored @Injected(\.persistenceService) private var persistenceService

    init(story: Story) {
        self.story = story
        self.story.isSeen = persistenceService.isSeen(story.id)
        self.story.isLiked = persistenceService.isLiked(story.id)
    }

    func markSeen() {
        if !story.isSeen {
            story.isSeen = true
            persistenceService.seen(story.id)
        }
    }

    func toggleLike() {
        persistenceService.toggleLike(story.id)
        story.isLiked.toggle()
    }
}
