//
//  PersistenceService.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

class PersistenceService: Persistence {
    private let seenKey = "seenStories"
    private let likedKey = "likedStories"
    
    func seen(_ storyId: Int) {
        var seen = getSeenStories()
        seen.insert(storyId)
        UserDefaults.standard.set(Array(seen), forKey: seenKey)
    }
    
    func toggleLike(_ storyId: Int) {
        var liked = getLikedStories()
        if liked.contains(storyId) {
            liked.remove(storyId)
        } else {
            liked.insert(storyId)
        }
        UserDefaults.standard.set(Array(liked), forKey: likedKey)
    }
    
    func isSeen(_ storyId: Int) -> Bool {
        let seen = getSeenStories()
        return seen.contains(storyId)
    }
    
    func isLiked(_ storyId: Int) -> Bool {
        let liked = getLikedStories()
        return liked.contains(storyId)
    }
    
    private func getSeenStories() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: seenKey) as? [Int] ?? []
        return Set(array)
    }
    
    private func getLikedStories() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: likedKey) as? [Int] ?? []
        return Set(array)
    }
}
