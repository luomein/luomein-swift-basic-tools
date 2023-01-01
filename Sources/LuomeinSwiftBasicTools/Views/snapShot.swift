//
//  File.swift
//  
//
//  Created by MEI YIN LO on 2023/1/1.
//

import Foundation
import SwiftUI

public func snapshot(targetSize: CGSize, rootView: some View, trim : Bool = true) -> UIImage {
    let controller = UIHostingController(rootView: rootView)
    let view = controller.view
    
//        let targetSize = controller.view.intrinsicContentSize
    view?.bounds = CGRect(origin: .zero, size: targetSize)
    view?.backgroundColor = .clear
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    
    var image = renderer.image { _ in
        view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
    }
    if trim{
        return image.trimmingTransparentPixels()!
    }
    else{
        return image
    }
}
