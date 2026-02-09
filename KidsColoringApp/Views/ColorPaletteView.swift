//
//  ColorPaletteView.swift
//  KidsColoringApp
//
//  Color picker with large, bright color buttons
//

import SwiftUI

struct ColorPaletteView: View {
    @ObservedObject var viewModel: DrawingViewModel
    @EnvironmentObject var soundManager: SoundManager
    
    let colors: [Color] = [
        .red,
        .orange,
        Color(red: 1.0, green: 0.8, blue: 0.0), // Yellow
        .green,
        .blue,
        .purple,
        .pink,
        Color(red: 0.6, green: 0.4, blue: 0.2), // Brown
        .black,
        .white,
        Color(red: 0.5, green: 0.8, blue: 1.0), // Light Blue
        Color(red: 0.5, green: 1.0, blue: 0.5)  // Light Green
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(colors, id: \.self) { color in
                    ColorButton(
                        color: color,
                        isSelected: viewModel.currentColor == color && viewModel.currentTool == .pen
                    ) {
                        viewModel.setColor(color)
                        soundManager.playSound(.colorSelect)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .frame(height: 80)
        .background(Color.white.opacity(0.9))
    }
}

struct ColorButton: View {
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .fill(color)
                .frame(width: 60, height: 60)
                .overlay(
                    Circle()
                        .stroke(Color.gray, lineWidth: color == .white ? 2 : 0)
                )
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: isSelected ? 4 : 0)
                )
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    ColorPaletteView(viewModel: DrawingViewModel())
        .environmentObject(SoundManager())
}
