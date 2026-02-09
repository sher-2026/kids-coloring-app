//
//  DrawingViewModel.swift
//  KidsColoringApp
//
//  ViewModel for managing drawing state
//

import SwiftUI
import PencilKit

class DrawingViewModel: ObservableObject {
    @Published var canvasView = PKCanvasView()
    @Published var currentTool: DrawingTool = .pen
    @Published var currentColor: Color = .red
    @Published var brushSize: BrushSize = .medium
    @Published var showClearAlert = false
    
    init() {
        setupCanvas()
        updateDrawingTool()
    }
    
    private func setupCanvas() {
        canvasView.drawingPolicy = .anyInput // Allow finger drawing
        canvasView.backgroundColor = .clear
    }
    
    func updateDrawingTool() {
        if currentTool == .eraser {
            canvasView.tool = PKEraserTool(.bitmap)
        } else {
            let ink = PKInkingTool(.pen, color: UIColor(currentColor), width: brushSize.rawValue)
            canvasView.tool = ink
        }
    }
    
    func setColor(_ color: Color) {
        currentColor = color
        currentTool = .pen
        updateDrawingTool()
    }
    
    func setBrushSize(_ size: BrushSize) {
        brushSize = size
        currentTool = .pen
        updateDrawingTool()
    }
    
    func toggleEraser() {
        currentTool = currentTool == .eraser ? .pen : .eraser
        updateDrawingTool()
    }
    
    func undo() {
        canvasView.undoManager?.undo()
    }
    
    func clearCanvas() {
        canvasView.drawing = PKDrawing()
    }
    
    func getDrawingImage() -> UIImage {
        let drawing = canvasView.drawing
        return drawing.image(from: drawing.bounds, scale: UIScreen.main.scale)
    }
}
