//
//  ColoringPage.swift
//  KidsColoringApp
//
//  Model for coloring pages
//

import Foundation
import SwiftUI

struct ColoringPage: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let category: Category
    
    enum Category {
        case animal
        case shape
    }
    
    // Predefined coloring pages
    static let allPages: [ColoringPage] = [
        // Animals
        ColoringPage(name: "Cat", imageName: "cat_outline", category: .animal),
        ColoringPage(name: "Dog", imageName: "dog_outline", category: .animal),
        ColoringPage(name: "Fish", imageName: "fish_outline", category: .animal),
        ColoringPage(name: "Butterfly", imageName: "butterfly_outline", category: .animal),
        
        // Shapes
        ColoringPage(name: "Star", imageName: "star_outline", category: .shape),
        ColoringPage(name: "Heart", imageName: "heart_outline", category: .shape),
        ColoringPage(name: "Circle", imageName: "circle_outline", category: .shape),
        ColoringPage(name: "House", imageName: "house_outline", category: .shape)
    ]
}
