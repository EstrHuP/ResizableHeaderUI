//
//  ContentHeaderView.swift
//  ResizableHeader
//
//  Created by EstrHuP on 8/5/23.
//

import SwiftUI

struct ContentHeaderView: View {
    
    let safeArea: EdgeInsets
    let progress: CGFloat
    let offsetY: CGFloat
    let headerHeight: CGFloat
    let miniumHeaderHeight: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.purple.gradient)
            VStack(spacing: 15) {
                ImageContentHeaderView(progress: progress,
                                       offsetY: offsetY,
                                       headerHeight: headerHeight,
                                       miniumHeaderHeight: miniumHeaderHeight)
                
                Text("Oliver")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .scaleEffect(1 - (progress * 0.15))
                    .offset(y: -4.5 * progress)
            }
            .padding(.top, safeArea.top)
            .padding(.bottom, 15)
        }
        .frame(height: (headerHeight + offsetY) < miniumHeaderHeight ? miniumHeaderHeight : (headerHeight + offsetY),
               alignment: .bottom)
        .offset(y: -offsetY)
    }
}
