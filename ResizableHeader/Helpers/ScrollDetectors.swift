//
//  ScrollDetectors.swift
//  ResizableHeader
//
//  Created by EstrHuP on 8/5/23.
//

import SwiftUI

///Extracting UIScrollView from SwiftUI for monitoring offset and velocity
struct ScrollDetectors: UIViewRepresentable {
    
    var onScroll: (CGFloat) -> ()
    ///Offset, Velocity
    var onDraggingEnd: (CGFloat, CGFloat) -> ()
    
    func makeCoordinator() -> Coordinators {
        return Coordinators(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            ///Adding delegate for only one time
            ///                 background, background { }, Vstack { }, ScrollView
            if let scrollView = uiView.superview?.superview?.superview as? UIScrollView, !context.coordinator.isDelegateAdded {
                ///Adding delegate
                scrollView.delegate = context.coordinator
                context.coordinator.isDelegateAdded = true
            }
        }
    }
    
    ///ScrollViewDelegate methods
    class Coordinators: NSObject, UIScrollViewDelegate {
        var parent: ScrollDetectors
        
        init(parent: ScrollDetectors) {
            self.parent = parent
        }
        
        ///One time Delegate initialization
        var isDelegateAdded: Bool = false
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.onScroll(scrollView.contentOffset.y)
        }
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            parent.onDraggingEnd(targetContentOffset.pointee.y, velocity.y)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView.panGestureRecognizer.view)
            parent.onDraggingEnd(scrollView.contentOffset.y,
                                 velocity.y)
        }
    }
}
