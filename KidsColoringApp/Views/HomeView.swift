//
//  HomeView.swift
//  KidsColoringApp
//
//  Main home screen with navigation options
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var soundManager: SoundManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Playful gradient background
                LinearGradient(
                    colors: [Color(red: 1.0, green: 0.9, blue: 0.9),
                             Color(red: 0.9, green: 0.9, blue: 1.0)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    // App Title
                    VStack(spacing: 10) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.pink, .purple, .blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text("Kids Coloring")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundColor(.purple)
                        
                        Text("Draw & Color!")
                            .font(.system(size: 28, weight: .medium, design: .rounded))
                            .foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                    // Main navigation buttons
                    VStack(spacing: 24) {
                        NavigationLink(destination: FreeDrawView()) {
                            HomeButtonView(
                                icon: "pencil.tip.crop.circle.fill",
                                title: "Free Draw",
                                gradient: [.blue, .cyan]
                            )
                        }
                        
                        NavigationLink(destination: ColoringPagesGalleryView()) {
                            HomeButtonView(
                                icon: "photo.on.rectangle.angled",
                                title: "Coloring Pages",
                                gradient: [.pink, .orange]
                            )
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    // Music toggle
                    Button(action: {
                        soundManager.toggleMusic()
                        soundManager.playSound(.colorSelect)
                    }) {
                        HStack {
                            Image(systemName: soundManager.isMusicEnabled ? "speaker.wave.2.fill" : "speaker.slash.fill")
                            Text(soundManager.isMusicEnabled ? "Music On" : "Music Off")
                        }
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                        .padding()
                    }
                }
                .padding()
            }
        }
    }
}

struct HomeButtonView: View {
    let icon: String
    let title: String
    let gradient: [Color]
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 40))
            
            Text(title)
                .font(.system(size: 32, weight: .bold, design: .rounded))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(
            LinearGradient(
                colors: gradient,
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
        .scaleEffect(1.0)
    }
}

#Preview {
    HomeView()
        .environmentObject(SoundManager())
}
