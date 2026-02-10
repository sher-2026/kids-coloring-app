# 🔨 Build Instructions

Complete guide to building and running the Kids Coloring App on your iOS device or simulator.

## Prerequisites

### Required Software
- **macOS** (Ventura 13.0 or later recommended)
- **Xcode** 15.0 or later
- **iOS Simulator** or physical **iOS device** running iOS 16.0+

### Optional
- Apple Developer account (only needed for physical device deployment)

## Quick Start (5 minutes)

### 1. Clone the Repository
```bash
git clone https://github.com/sher-2026/kids-coloring-app.git
cd kids-coloring-app
```

### 2. Open in Xcode
```bash
open KidsColoringApp.xcodeproj
```

Or:
- Launch Xcode
- File → Open
- Navigate to `kids-coloring-app` folder
- Select `KidsColoringApp.xcodeproj`

### 3. Select Target Device
In Xcode toolbar (top-left):
- Click on the device selector (next to Play/Stop buttons)
- Choose an iOS Simulator (e.g., "iPhone 15 Pro")
- OR connect your physical iPhone/iPad and select it

### 4. Build & Run
- Press `⌘ + R` (Command + R)
- OR click the ▶️ Play button in the toolbar
- Wait for build to complete (~30 seconds first time)
- App will launch automatically

🎉 **That's it!** The app should now be running.

---

## Detailed Instructions

### Building for Simulator

#### Advantages
✅ No Apple Developer account needed
✅ Fast deployment
✅ Easy debugging
✅ Free to use

#### Steps
1. Open project in Xcode
2. Select a simulator: `iPhone 15`, `iPhone 15 Pro`, `iPad Pro (12.9-inch)`
3. Build & Run (`⌘ + R`)
4. Simulator will launch and install the app

#### Recommended Simulators
- **iPhone 15** - Best for portrait testing
- **iPhone 15 Pro Max** - Large screen testing
- **iPad Pro (12.9-inch)** - Tablet experience

### Building for Physical Device

#### Requirements
- iOS device running iOS 16.0 or later
- USB cable (or wireless debugging setup)
- Apple ID (free account works)

#### Steps

1. **Connect Device**
   - Plug iPhone/iPad into your Mac via USB
   - Unlock device and "Trust This Computer"

2. **Sign the App**
   - In Xcode, select project in navigator (blue icon)
   - Select "KidsColoringApp" target
   - Go to "Signing & Capabilities" tab
   - Check "Automatically manage signing"
   - Select your Apple ID team from dropdown
   
3. **Build & Run**
   - Select your device from device selector
   - Press `⌘ + R`
   - Wait for app to install and launch

4. **Trust Developer (First Time)**
   - On device: Settings → General → VPN & Device Management
   - Tap your Apple ID
   - Tap "Trust"
   - Go back to home screen and launch app

---

## Build Configuration

### Debug Build (Default)
Best for development and testing:
```
- Optimizations: None
- Debug symbols: Included
- Faster compilation
- Larger binary size
```

To build Debug:
- Product → Scheme → Edit Scheme
- Run → Build Configuration → Debug

### Release Build
Optimized for performance:
```
- Optimizations: Full
- Debug symbols: Stripped
- Slower compilation
- Smaller binary size
```

To build Release:
- Product → Scheme → Edit Scheme
- Run → Build Configuration → Release

---

## Troubleshooting

### Common Issues

#### ❌ "No such module 'PencilKit'"
**Solution**: PencilKit is available in iOS 13+. Ensure deployment target is set correctly.
- Project settings → Deployment Info → iOS Deployment Target: **16.0**

#### ❌ "Signing for 'KidsColoringApp' requires a development team"
**Solution**: 
1. Select project in navigator
2. Signing & Capabilities tab
3. Team dropdown → Add Account
4. Sign in with Apple ID
5. Select newly added team

#### ❌ "No provisioning profiles found"
**Solution**:
1. Enable "Automatically manage signing"
2. Clean build folder: `⌘ + Shift + K`
3. Rebuild: `⌘ + B`

#### ❌ Simulator not loading
**Solution**:
1. Quit Simulator
2. Xcode → Window → Devices and Simulators
3. Select simulator → Right-click → Delete
4. Add new simulator with + button
5. Try again

#### ❌ "App installation failed"
**Solution**:
1. Delete app from simulator/device
2. Clean build folder: `⌘ + Shift + K`
3. Reset Package Caches: File → Packages → Reset Package Caches
4. Rebuild: `⌘ + R`

#### ❌ Black screen on launch
**Solution**:
1. Check Console for errors (View → Debug Area → Activate Console)
2. Verify Info.plist exists
3. Clean and rebuild

---

## Project Structure

```
KidsColoringApp.xcodeproj/
├── project.pbxproj          # Xcode project file
└── xcuserdata/              # User-specific settings (ignored by git)

KidsColoringApp/
├── App/
│   └── KidsColoringAppApp.swift
├── Views/
│   └── (8 Swift view files)
├── Models/
│   └── (2 model files)
├── ViewModels/
│   └── DrawingViewModel.swift
├── Helpers/
│   └── (2 helper files)
├── Resources/
│   └── Assets.xcassets/
└── Info.plist
```

---

## Xcode Tips

### Keyboard Shortcuts
- `⌘ + R` - Build and run
- `⌘ + .` - Stop running
- `⌘ + B` - Build only
- `⌘ + Shift + K` - Clean build folder
- `⌘ + L` - Go to line
- `⌘ + /` - Toggle comment
- `⌘ + Shift + O` - Open quickly (find files)

### Canvas Previews
Each view has a `#Preview` block at the bottom. To use:
1. Open any View file (e.g., HomeView.swift)
2. Enable Canvas: `⌘ + Option + Return`
3. Click ▶️ in preview pane to run
4. See live updates as you edit code

### Debugging
- Set breakpoints: Click line number gutter
- Step through: `F6` (step over), `F7` (step in)
- View variables: Hover over variable while paused
- LLDB console: Type commands while debugging

### Live Preview on Device
1. Connect device via USB
2. Enable "Developer Mode" on device
3. Canvas → Select device from dropdown
4. Preview runs on actual hardware

---

## Build Times

**First build** (clean):
- Debug: ~30-60 seconds
- Release: ~60-90 seconds

**Incremental builds** (after code change):
- Debug: ~5-15 seconds
- Release: ~10-20 seconds

---

## System Requirements

### Minimum
- macOS Ventura 13.0
- Xcode 15.0
- 8GB RAM
- 10GB free disk space

### Recommended
- macOS Sonoma 14.0+
- Xcode 15.2+
- 16GB RAM
- SSD with 20GB+ free space

---

## Archive & Distribution

### Create App Archive
For TestFlight or App Store submission:

1. **Select Generic iOS Device**
   - Product → Destination → Any iOS Device

2. **Archive**
   - Product → Archive
   - Wait for build to complete
   - Organizer window opens automatically

3. **Distribute**
   - Select archive
   - Click "Distribute App"
   - Follow prompts for TestFlight/App Store/Ad Hoc

### Export for Testing
1. Archive app (as above)
2. Distribute → Ad Hoc
3. Export IPA file
4. Install via Apple Configurator or similar tool

---

## Testing Checklist

Before considering build successful, test:

- [ ] App launches without crash
- [ ] Home screen displays correctly
- [ ] Navigate to Free Draw
- [ ] Draw with finger on canvas
- [ ] Select different colors
- [ ] Change brush sizes
- [ ] Use eraser tool
- [ ] Undo works
- [ ] Clear canvas (with confirmation)
- [ ] Save to Photos (grant permission first)
- [ ] Navigate to Coloring Pages
- [ ] Select a coloring page
- [ ] Color on template
- [ ] Template outline remains visible
- [ ] Sound effects play (if device not muted)
- [ ] Music toggle works
- [ ] App works in landscape and portrait

---

## Performance Testing

### Memory Usage
Expected: **50-150 MB** during normal use

To monitor:
1. Run app in Xcode
2. Debug Navigator (⌘ + 7)
3. Select "Memory" gauge
4. Draw for 1-2 minutes
5. Should stay under 200 MB

### CPU Usage
Expected: **5-15%** idle, **20-40%** while drawing

To monitor:
1. Debug Navigator → CPU
2. Watch during drawing
3. Should not exceed 60% sustained

### Frame Rate
Expected: **60 FPS** during drawing

To monitor:
1. Debug → View Debugging → Show View Frames
2. Should maintain 60 FPS while drawing

---

## CI/CD Setup (Optional)

### Xcode Cloud
1. App Store Connect → Xcode Cloud
2. Create new workflow
3. Set branch and trigger
4. Configure build actions

### GitHub Actions
See `.github/workflows/ios.yml` (if added) for automated builds on commit.

---

## Additional Resources

- [Xcode Documentation](https://developer.apple.com/documentation/xcode)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [PencilKit Documentation](https://developer.apple.com/documentation/pencilkit)
- [iOS App Distribution Guide](https://developer.apple.com/distribution/)

---

## Getting Help

### Issues with Build
1. Check this guide's Troubleshooting section
2. Clean and rebuild
3. Restart Xcode
4. Restart Mac (last resort)

### Xcode Crashes
1. Delete derived data: `~/Library/Developer/Xcode/DerivedData/`
2. Reset Xcode packages
3. Reinstall Xcode from App Store

### Still Stuck?
- Open an issue on GitHub
- Include: Xcode version, macOS version, error messages
- Attach build logs if possible

---

**Happy Building! 🚀**

*Last Updated: 2024*
*Xcode Version: 15.0+*
*iOS Target: 16.0+*
