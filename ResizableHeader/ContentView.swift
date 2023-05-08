//
//  ContentView.swift
//  ResizableHeader
//
//  Created by EstrHuP on 8/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            HomeView(size: size,
                     safeArea: safeArea)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
