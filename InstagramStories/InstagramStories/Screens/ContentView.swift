//
//  ContentView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            StoryListView()
                .navigationTitle("Instagram Stories")
        }
    }
}

#Preview {
    ContentView()
}
