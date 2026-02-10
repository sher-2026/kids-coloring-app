//
//  CanvasView.swift
//  KidsColoringApp
//
//  SwiftUI wrapper for PKCanvasView
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @ObservedObject var viewModel: DrawingViewModel
    let backgroundImage: UIImage?
    
    init(viewModel: DrawingViewModel, backgroundImage: UIImage? = nil) {
        self.viewModel = viewModel
        self.backgroundImage = backgroundImage
    }
    
    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = viewModel.canvasView
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        
        // Enable undo/redo
        canvasView.undoManager = UndoManager()
        
        return canvasView
    }
    
    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        // Update tool when view model changes
        viewModel.updateDrawingTool()
    }
}
