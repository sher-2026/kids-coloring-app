//
//  ColoringPageView.swift
//  KidsColoringApp
//
//  Drawing view for coloring pages with background template
//

import SwiftUI

struct ColoringPageView: View {
    let page: ColoringPage
    
    @StateObject private var viewModel = DrawingViewModel()
    @EnvironmentObject var soundManager: SoundManager
    @Environment(\.dismiss) var dismiss
    
    @State private var showBrushPicker = false
    @State private var showSaveSuccess = false
    
    var body: some View {
        ZStack {
            // Background
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Back")
                        }
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(15)
                    }
                    
                    Spacer()
                    
                    Text(page.name)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                    
                    Spacer()
                    
                    // Invisible spacer for centering
                    Color.clear
                        .frame(width: 100)
                }
                .padding()
                
                // Canvas with background outline
                ZStack {
                    // Background template outline
                    Image(systemName: iconForPage(page))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black.opacity(0.2))
                        .frame(maxWidth: 300, maxHeight: 300)
                    
                    // Drawing canvas on top
                    CanvasView(viewModel: viewModel)
                }
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
            Text("This will erase all your coloring!")
        }
    }
    
    private func iconForPage(_ page: ColoringPage) -> String {
        switch page.imageName {
        case "cat_outline": return "cat.fill"
        case "dog_outline": return "dog.fill"
        case "fish_outline": return "fish.fill"
        case "butterfly_outline": return "butterfly.fill"
        case "star_outline": return "star.fill"
        case "heart_outline": return "heart.fill"
        case "circle_outline": return "circle.fill"
        case "house_outline": return "house.fill"
        default: return "photo"
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

#Preview {
    NavigationStack {
        ColoringPageView(page: ColoringPage.allPages[0])
            .environmentObject(SoundManager())
    }
}
