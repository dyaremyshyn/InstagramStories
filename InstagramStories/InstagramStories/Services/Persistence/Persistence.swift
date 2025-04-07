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
}
