//
//  DrawingTool.swift
//  KidsColoringApp
//
//  Represents the different drawing tools available
//

import Foundation
import PencilKit

enum DrawingTool {
    case pen
    case eraser
    
    var inkType: PKInkingTool.InkType {
        switch self {
        case .pen:
            return .pen
        case .eraser:
            return .pen // Eraser is handled separately in PKCanvasView
        }
    }
}

enum BrushSize: CGFloat, CaseIterable {
    case small = 5
    case medium = 15
    case large = 30
    
    var displayName: String {
        switch self {
        case .small: return "Small"
        case .medium: return "Medium"
        case .large: return "Large"
        }
    }
}
