//
//  FreeDrawView.swift
//  KidsColoringApp
//
//  Full-screen free drawing canvas
//

import SwiftUI

struct FreeDrawView: View {
    @StateObject private var viewModel = DrawingViewModel()
    @EnvironmentObject var soundManager: SoundManager
    @Environment(\.dismiss) var dismiss
    
    @State private var showBrushPicker = false
    @State private var showSaveSuccess = false
    
    var body: some View {
        ZStack {
            // Background
            Color(red: 0.98, green: 0.98, blue: 1.0)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(15)
                    }
                    
                    Spacer()
                }
                .padding()
                
                // Canvas
                CanvasView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Brush size picker (overlay)
                if showBrushPicker {
                    BrushSizePickerView(viewModel: viewModel)
                        .transition(.move(edge: .bottom))
                        .animation(.spring(), value: showBrushPicker)
                }
                
                // Color palette
                ColorPaletteView(viewModel: viewModel)
                
                // Tools
                ToolbarView(
                    viewModel: viewModel,
                    showBrushPicker: $showBrushPicker,
                    showSaveSuccess: $showSaveSuccess,
                    onSave: saveDrawing
                )
                .padding()
            }
            
            // Save success overlay
            if showSaveSuccess {
                SaveSuccessView()
                    .transition(.scale.combined(with: .opacity))
                    .animation(.spring(), value: showSaveSuccess)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showSaveSuccess = false
                        }
                    }
            }
        }
        .navigationBarHidden(true)
        .alert("Clear Everything?", isPresented: $viewModel.showClearAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Clear", role: .destructive) {
                viewModel.clearCanvas()
                soundManager.playSound(.clear)
            }
        } message: {
            Text("This will erase all your drawing!")
        }
    }
    
    private func saveDrawing() {
        let image = viewModel.getDrawingImage()
        let imageSaver = ImageSaver()
        imageSaver.successHandler = {
            soundManager.playSound(.save)
            showSaveSuccess = true
        }
        imageSaver.errorHandler = { error in
            print("Save error: \(error.localizedDescription)")
        }
        imageSaver.writeToPhotoAlbum(image: image)
    }
}

struct SaveSuccessView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Text("Saved!")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(40)
        .background(Color.black.opacity(0.7))
        .cornerRadius(20)
    }
}

#Preview {
    FreeDrawView()
        .environmentObject(SoundManager())
}
