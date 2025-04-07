//
//  UserReader.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

protocol UserReader {
    func read(fileName: String) throws -> UsersResponse
}
