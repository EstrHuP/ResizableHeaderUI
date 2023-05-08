//
//  HeaderView.swift
//  ResizableHeader
//
//  Created by EstrHuP on 8/5/23.
//

import SwiftUI

struct HeaderView: View {
    
    let size: CGSize
    let safeArea: EdgeInsets
    let offsetY: CGFloat
    
    var body: some View {
        let headerHeight = (size.height * 0.3) + safeArea.top
        let miniumHeaderHeight = 65 + safeArea.top
        
        ///Converting Offset into Progress
        ///Limit max 0 min 1
        let progress = max(min(-offsetY / (headerHeight - miniumHeaderHeight), 1), 0)
        
        GeometryReader { _ in
            ContentHeaderView(safeArea: safeArea,
                              progress: progress,
                              offsetY: offsetY,
                              headerHeight: headerHeight,
                              miniumHeaderHeight: miniumHeaderHeight)
        }
        .frame(height: headerHeight)
    }
}
