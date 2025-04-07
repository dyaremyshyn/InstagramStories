//
//  LoaderView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 07/04/2025.
//

import SwiftUI

struct LoaderView: View {
    @State var width: CGFloat = 0
    @Binding var show: Bool 
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var seconds: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.white.opacity(0.6))
                .frame(height: 3)
            Rectangle()
                .fill(Color.white)
                .frame(width: width, height: 3)
        }
        .onReceive(time) { _ in
            seconds += 0.1
            if seconds <= 10 {
                let screenWidth = UIScreen.main.bounds.width
                self.width = screenWidth * (seconds / 10)
            } else {
                show = false
            }
        }
    }
}

#Preview {
    LoaderView(show: .constant(true))
}
