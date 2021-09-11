//
//  DragStyle.swift
//  TinderStyle
//
//  Created by Isaac Loez on 11/09/21.
//

import Foundation
import CoreGraphics


enum  DragStyle {
    case none
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize{
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
        return translation
        }
    }
    
    var ispressing: Bool{
        switch self {
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        default:
            return false
        }
    }
    
}
