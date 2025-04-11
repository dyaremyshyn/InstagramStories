//
//  FullScreenCoverModifier.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 11/04/2025.
//

import SwiftUI

struct FullScreenCoverModifier: ViewModifier {
    @Binding var presentView: AnyView?
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: isSheetPresented) {
                presentView
            }
    }
}

private extension FullScreenCoverModifier {
    var isSheetPresented: Binding<Bool> {
        Binding(
            get: { presentView != nil },
            set: { if !$0 { presentView = nil } }
        )
    }
}

extension View {
    func fullScreenCover(_ presentView: Binding<AnyView?>) -> some View {
        modifier(
            FullScreenCoverModifier(presentView: presentView))
    }
}
