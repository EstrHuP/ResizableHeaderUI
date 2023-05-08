//
//  HomeView.swift
//  ResizableHeader
//
//  Created by EstrHuP on 8/5/23.
//

import SwiftUI

struct HomeView: View {
    
    var size: CGSize
    var safeArea: EdgeInsets
    
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: .zero) {
                    HeaderView(size: size,
                               safeArea: safeArea,
                               offsetY: offsetY)
                    ///Making to Top
                        .zIndex(1000)
                    
                    sampleCardView()
                }
                .id("SCROLLVIEW")
                .background {
                    ScrollDetectors { offset in
                        offsetY = -offset
                    } onDraggingEnd: { offset, velocity in
                        ///Resetting to initial state, if not completetly scrolled
                        let headerHeight = (size.height * 0.3) + safeArea.top
                        let miniumHeaderHeight = 65 + safeArea.top
                        
                        let targetEnded = offset + (velocity * 45)
                        if targetEnded < (headerHeight - miniumHeaderHeight) && targetEnded > 0 {
                            withAnimation(.interactiveSpring(response: 0.55,
                                                             dampingFraction: 0.65,
                                                             blendDuration: 0.65)) {
                                scrollProxy.scrollTo("SCROLLVIEW",
                                                     anchor: .top)
                            }
                        }
                    }
                }
            }
        }
    }

    
    ///Sample cards
    @ViewBuilder
    func sampleCardView() -> some View {
        VStack(spacing: 15) {
            ForEach(1...25, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 10,
                                 style: .continuous)
                .fill(.black.opacity(0.05))
                .frame(height: 75)
            }
        }
        .padding(15)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
