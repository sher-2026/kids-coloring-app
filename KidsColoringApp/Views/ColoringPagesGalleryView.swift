//
//  ColoringPagesGalleryView.swift
//  KidsColoringApp
//
//  Gallery grid showing all available coloring pages
//

import SwiftUI

struct ColoringPagesGalleryView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var soundManager: SoundManager
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color(red: 1.0, green: 0.95, blue: 0.9),
                         Color(red: 0.95, green: 0.95, blue: 1.0)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
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
                    
                    Text("Pick a Page!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                }
                .padding()
                
                // Gallery
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(ColoringPage.allPages) { page in
                            NavigationLink(destination: ColoringPageView(page: page)) {
                                ColoringPageCard(page: page)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ColoringPageCard: View {
    let page: ColoringPage
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                
                VStack {
                    // Placeholder for image (will be replaced with actual images)
                    Image(systemName: iconForPage(page))
                        .font(.system(size: 80))
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(height: 140)
                    
                    Text(page.name)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                }
            }
            .frame(height: 200)
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
}

#Preview {
    NavigationStack {
        ColoringPagesGalleryView()
            .environmentObject(SoundManager())
    }
}
