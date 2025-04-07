//
//  UserReaderService.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

struct UserReaderService: UserReader {
    func read(fileName: String) throws -> UsersResponse {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "UserReaderService", code: 404, userInfo: [NSLocalizedDescriptionKey: "File \(fileName).json not found."])
        }
        do {
            let data = try Data(contentsOf: url)
            let usersResponse = try JSONDecoder().decode(UsersResponse.self, from: data)
            return usersResponse
        } catch {
            throw error
        }
    }
}
