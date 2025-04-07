//
//  Persistence.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

protocol Persistence {
    func seen(_ storyId: Int)
    func toggleLike(_ storyId: Int)
    func isSeen(_ storyId: Int) -> Bool
    func isLiked(_ storyId: Int) -> Bool
}
