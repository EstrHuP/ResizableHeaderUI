//
//  ImageContentHeaderView.swift
//  ResizableHeader
//
//  Created by EstrHuP on 8/5/23.
//

import SwiftUI

struct ImageContentHeaderView: View {
    
    let progress: CGFloat
    let offsetY: CGFloat
    let headerHeight: CGFloat
    let miniumHeaderHeight: CGFloat
    
    var body: some View {
        GeometryReader {
            let rect = $0.frame(in: .global)
            let halfScaledHeight = (rect.height * 0.3) * 0.5
            let midY = rect.midY
            let bottomPadding: CGFloat = 15
            let resizedOffsetY = (midY - (miniumHeaderHeight - halfScaledHeight - bottomPadding))

            Image("HeaderImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: rect.width,
                       height: rect.height)
                .clipShape(Circle())
                .scaleEffect(1 - (progress * 0.7),
                             anchor: .leading)
                .offset(x: -(rect.minX - 15) * progress,
                        y: -resizedOffsetY * progress)
        }
        .frame(width: headerHeight * 0.5,
               height: headerHeight * 0.5)
    }
}
