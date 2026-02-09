//
//  ToolbarView.swift
//  KidsColoringApp
//
//  Toolbar with drawing tools (eraser, undo, clear, save)
//

import SwiftUI

struct ToolbarView: View {
    @ObservedObject var viewModel: DrawingViewModel
    @EnvironmentObject var soundManager: SoundManager
    @Binding var showBrushPicker: Bool
    @Binding var showSaveSuccess: Bool
    let onSave: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            // Brush Size
            ToolButton(
                icon: "circle.fill",
                label: "Size",
                isActive: showBrushPicker,
                color: .blue
            ) {
                showBrushPicker.toggle()
                soundManager.playSound(.colorSelect)
            }
            
            // Eraser
            ToolButton(
                icon: "eraser.fill",
                label: "Eraser",
                isActive: viewModel.currentTool == .eraser,
                color: .orange
            ) {
                viewModel.toggleEraser()
                soundManager.playSound(.colorSelect)
            }
            
            // Undo
            ToolButton(
                icon: "arrow.uturn.backward",
                label: "Undo",
                isActive: false,
                color: .purple
            ) {
                viewModel.undo()
                soundManager.playSound(.colorSelect)
            }
            
            // Clear
            ToolButton(
                icon: "trash.fill",
                label: "Clear",
                isActive: false,
                color: .red
            ) {
                viewModel.showClearAlert = true
            }
            
            // Save
            ToolButton(
                icon: "square.and.arrow.down.fill",
                label: "Save",
                isActive: false,
                color: .green
            ) {
                onSave()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.9))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct ToolButton: View {
    let icon: String
    let label: String
    let isActive: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundColor(isActive ? .white : color)
                    .frame(width: 60, height: 60)
                    .background(isActive ? color : Color.gray.opacity(0.1))
                    .cornerRadius(12)
                
                Text(label)
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    ToolbarView(
        viewModel: DrawingViewModel(),
        showBrushPicker: .constant(false),
        showSaveSuccess: .constant(false),
        onSave: {}
    )
    .environmentObject(SoundManager())
}
