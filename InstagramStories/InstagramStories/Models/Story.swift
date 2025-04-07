//
//  Story.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

struct Story: Identifiable, Codable {
    let id: Int
    let name: String
    let profilePictureURL: String
    var isSeen: Bool = false
    var isLiked: Bool = false

    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePictureURL = "profile_picture_url"
    }
}
