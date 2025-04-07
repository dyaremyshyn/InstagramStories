//
//  StoryListViewModel.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import Foundation

@Observable class StoryListViewModel {
    var stories: [Story] = []
    private var pages: [[Story]] = []
    private var currentPageIndex: Int = 0
    @ObservationIgnored @Injected(\.userReaderService) private var userReaderService
    var showErrorToast: Bool = false
    
    init() {
        loadData()
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
}
