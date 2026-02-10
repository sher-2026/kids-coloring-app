# 🎨 Kids Drawing & Coloring App

A fun, safe, and educational iOS drawing and coloring app designed specifically for children ages 2-5. Built with SwiftUI and PencilKit.

![iOS](https://img.shields.io/badge/iOS-16.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-✓-green.svg)

## 📱 Screenshots

<!-- Screenshots will be added here -->
*Screenshots coming soon...*

## ✨ Features

### 🎨 Free Drawing Mode
- **Full-screen canvas** using PencilKit for smooth, natural drawing
- **Finger-friendly** - supports drawing with fingers, not just Apple Pencil
- **Thick brush strokes** optimized for small fingers
- **Unlimited creativity** - draw anything!

### 🖍️ Coloring Pages
8 pre-designed templates for kids to color:
- **Animals**: Cat, Dog, Fish, Butterfly
- **Shapes**: Star, Heart, Circle, House
- Templates remain visible on top of coloring for guidance

### 🌈 Simple Color Picker
- **12 bright colors**: Red, Orange, Yellow, Green, Blue, Purple, Pink, Brown, Black, White, Light Blue, Light Green
- **Large color buttons** (60x60 points) easy for small fingers
- **Horizontally scrollable** palette at the bottom
- **Visual highlight** shows currently selected color

### ✏️ Brush Sizes
- **3 size options**: Small, Medium, Large
- **Visual preview** of each brush size
- **Easy selection** with large touch targets
- **Medium size** as default

### 🧽 Tools & Controls
- **Eraser tool** - easily switch between pen and eraser
- **Undo** - reverse the last stroke
- **Clear All** - start fresh with confirmation alert
- **Save** - export artwork to Photos library with success animation

### 🔊 Sound Effects
- **Fun pop sounds** when selecting colors or tools
- **Swoosh sound** when clearing canvas
- **Success chime** when saving artwork
- **Music toggle** - optional background music (on/off)

### 👶 Child-Safe Design
- **No ads or in-app purchases** - completely safe for kids
- **Large touch targets** (minimum 60x60 points) for easy tapping
- **Bright, cheerful colors** throughout the UI
- **Simple icons with labels** for easy recognition
- **Intuitive navigation** - easy to understand and use

### 🏠 User Interface
- **Welcoming home screen** with app logo and navigation
- **Two main modes**: Free Draw and Coloring Pages
- **Gallery view** for browsing coloring pages
- **Bottom toolbar** for tools, top area for canvas
- **Rounded corners** and playful design elements

## 🛠 Technical Details

### Requirements
- **iOS 16.0+**
- **Xcode 15.0+**
- **Swift 5.9+**
- iPhone or iPad

### Frameworks Used
- **SwiftUI** - Modern declarative UI framework
- **PencilKit** - Professional drawing and sketching
- **AVFoundation** - Sound effects
- **UIKit** - Photo library integration

### Architecture
- **MVVM Pattern** (Model-View-ViewModel)
- **ObservableObject** for state management
- **Combine framework** for reactive updates
- **No third-party dependencies** - 100% native Apple frameworks

### Project Structure
```
KidsColoringApp/
├── App/
│   └── KidsColoringAppApp.swift       # App entry point
├── Views/
│   ├── HomeView.swift                 # Main home screen
│   ├── FreeDrawView.swift             # Free drawing canvas
│   ├── ColoringPagesGalleryView.swift # Gallery of coloring pages
│   ├── ColoringPageView.swift         # Individual coloring page
│   ├── CanvasView.swift               # PKCanvasView wrapper
│   ├── ColorPaletteView.swift         # Color picker component
│   ├── BrushSizePickerView.swift      # Brush size selector
│   └── ToolbarView.swift              # Drawing tools toolbar
├── Models/
│   ├── ColoringPage.swift             # Coloring page data model
│   └── DrawingTool.swift              # Drawing tool types
├── ViewModels/
│   └── DrawingViewModel.swift         # Drawing state management
├── Helpers/
│   ├── SoundManager.swift             # Sound effects manager
│   └── ImageSaver.swift               # Photo library saver
├── Resources/
│   ├── Assets.xcassets/               # App icons and images
│   ├── ColoringPages/                 # SVG coloring templates
│   └── Sounds/                        # Audio files
└── Info.plist                         # App configuration
```

## 🚀 Getting Started

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sher-2026/kids-coloring-app.git
   cd kids-coloring-app
   ```

2. **Open in Xcode**
   ```bash
   open KidsColoringApp.xcodeproj
   ```

3. **Select your target device**
   - Choose an iPhone or iPad simulator
   - Or connect a physical iOS device

4. **Build and run**
   - Press `Cmd + R` or click the Play button
   - The app will build and launch

### First Run

The app will request permission to save photos to your library. This is required for the "Save" feature to work.

## 🎮 How to Use

1. **Launch the app** - You'll see the home screen with two options
2. **Choose a mode**:
   - **Free Draw** - Open canvas for freestyle drawing
   - **Coloring Pages** - Pick a template to color
3. **Start creating**:
   - Tap colors to select them
   - Draw with your finger on the canvas
   - Use brush sizes to vary thickness
   - Toggle eraser to correct mistakes
4. **Save your art**:
   - Tap the Save button
   - Artwork is saved to Photos app
   - See a fun success animation!

## 🎨 Design Philosophy

This app was built with young children in mind:

- **Large, forgiving touch targets** - No frustration from missed taps
- **Bright, engaging colors** - Visually stimulating and fun
- **Simple, obvious controls** - No complex menus or hidden features
- **Instant feedback** - Sounds and animations for every action
- **Safe environment** - No ads, tracking, or external content
- **Creative freedom** - No rules, just fun!

## 🔐 Privacy & Safety

- **No data collection** - We don't collect any user data
- **No internet required** - Works completely offline
- **No ads** - Uninterrupted creative time
- **No in-app purchases** - All features included
- **Photos permission** - Only used for saving artwork locally

## 🐛 Known Limitations

- SVG coloring page templates use SF Symbols placeholders (actual SVG images can be added to Resources/ColoringPages)
- Background music feature is implemented but requires custom audio files
- Custom coloring page images need to be added to Assets catalog

## 🔮 Future Enhancements

Potential features for future versions:
- [ ] More coloring page templates
- [ ] Stickers and stamps
- [ ] Pattern fill tools
- [ ] Gallery to view saved artwork
- [ ] Parental controls and settings
- [ ] Accessibility features (VoiceOver support)
- [ ] Multiple language support
- [ ] Sharing artwork (with parental gate)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

## 👏 Credits

- Built with ❤️ for kids everywhere
- Icons from SF Symbols (Apple)
- Sounds from iOS System Sounds

## 📧 Contact

For questions, suggestions, or issues, please open an issue on GitHub.

---

**Made with SwiftUI 🎨 Built for creativity 🌈 Designed for kids 👶**
