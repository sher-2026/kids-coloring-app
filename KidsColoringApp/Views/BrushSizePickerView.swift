//
//  BrushSizePickerView.swift
//  KidsColoringApp
//
//  Brush size selector with preview dots
//

import SwiftUI

struct BrushSizePickerView: View {
    @ObservedObject var viewModel: DrawingViewModel
    @EnvironmentObject var soundManager: SoundManager
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(BrushSize.allCases, id: \.self) { size in
                BrushSizeButton(
                    size: size,
                    isSelected: viewModel.brushSize == size && viewModel.currentTool == .pen
                ) {
                    viewModel.setBrushSize(size)
                    soundManager.playSound(.colorSelect)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(15)
    }
}

struct BrushSizeButton: View {
    let size: BrushSize
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Circle()
                    .fill(Color.black)
                    .frame(width: size.rawValue / 2, height: size.rawValue / 2)
                    .frame(width: 40, height: 40)
                
                Text(size.displayName)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
            }
            .frame(width: 70, height: 70)
            .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: isSelected ? 3 : 0)
            )
        }
    }
}

#Preview {
    BrushSizePickerView(viewModel: DrawingViewModel())
        .environmentObject(SoundManager())
}
