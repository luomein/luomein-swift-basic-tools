//
//  FitPopoverViewModifier.swift
//  tca-bezier-animation
//
//  Created by MEI YIN LO on 2022/12/19.
//

import Foundation
import SwiftUI


public struct FitPopoverViewModifier : ViewModifier{
    @Environment(\.dismiss) var dismiss
    public var width : Double
    public var height : Double
    public func body(content: Content) -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone{
            content
                .presentationDetents([.medium, .large])
                .onTapGesture {
                    if  UIDevice.current.orientation.isLandscape{
                        dismiss()
                    }
                }
        }
        else{
            content
                .frame(width:width,height: height)
                .background(Color.gray.opacity(0.2) )
                .scrollContentBackground(.hidden)
        }
        
    }
}
struct FitPopoverViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            Text("test")
        }
            .modifier(FitPopoverViewModifier(width: 100, height: 100))
    }
}
