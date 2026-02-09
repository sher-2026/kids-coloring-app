# 🎨 Design System - Kids Coloring App

Complete design specification for the Kids Coloring App interface.

## Design Philosophy

### Core Principles

1. **Simplicity First**
   - One-tap interactions where possible
   - Clear visual hierarchy
   - Minimal text, maximum icons

2. **Child-Centered**
   - Designed for ages 2-5
   - Forgiving interfaces
   - Immediate visual feedback

3. **Joyful Experience**
   - Bright, happy colors
   - Playful animations
   - Encouraging sounds

4. **Safety by Design**
   - No accidental deletions
   - Confirmations for destructive actions
   - No external links

---

## Color Palette

### Primary Brand Colors

**Purple** - Main brand color
- Hex: `#9B59B6` (approx)
- Usage: Titles, primary buttons
- RGB: `(155, 89, 182)`

**Pink** - Secondary accent
- Hex: `#FF6B9D` (approx)
- Usage: Buttons, highlights
- RGB: `(255, 107, 157)`

**Blue** - Interactive elements
- Hex: `#3498DB` (approx)
- Usage: Links, selections
- RGB: `(52, 152, 219)`

**Orange** - Energy accent
- Hex: `#FF9500` (approx)
- Usage: Call-to-action
- RGB: `(255, 149, 0)`

### Drawing Palette Colors

1. **Red**: `Color.red` - RGB(255, 59, 48)
2. **Orange**: `Color.orange` - RGB(255, 149, 0)
3. **Yellow**: Custom - RGB(255, 204, 0)
4. **Green**: `Color.green` - RGB(52, 199, 89)
5. **Blue**: `Color.blue` - RGB(0, 122, 255)
6. **Purple**: `Color.purple` - RGB(175, 82, 222)
7. **Pink**: `Color.pink` - RGB(255, 45, 85)
8. **Brown**: Custom - RGB(153, 102, 51)
9. **Black**: `Color.black` - RGB(0, 0, 0)
10. **White**: `Color.white` - RGB(255, 255, 255)
11. **Light Blue**: Custom - RGB(128, 204, 255)
12. **Light Green**: Custom - RGB(128, 255, 128)

### Background Colors

**Light Backgrounds**
- Purple tint: RGB(250, 250, 255)
- Pink tint: RGB(255, 243, 243)
- Blue tint: RGB(243, 243, 255)

**Gradients**
- Home: Pink to Blue diagonal
- Gallery: Orange to Purple diagonal
- Canvas: Solid light purple

---

## Typography

### Font Family
**SF Rounded** - System font with rounded design
- Built into iOS
- Child-friendly appearance
- Excellent readability

### Type Scale

| Element | Size | Weight | Usage |
|---------|------|--------|-------|
| Hero Title | 48pt | Bold | App name on home |
| Section Title | 28-32pt | Bold | View titles |
| Button Text | 24-32pt | Bold | Main actions |
| Body Text | 18-20pt | Semibold | Labels |
| Tool Labels | 12-14pt | Semibold | Toolbar text |
| Caption | 10-12pt | Regular | Helper text |

### Text Styles

```swift
// Hero (App Title)
.font(.system(size: 48, weight: .bold, design: .rounded))

// Section Header
.font(.system(size: 28, weight: .bold, design: .rounded))

// Button
.font(.system(size: 32, weight: .bold, design: .rounded))

// Label
.font(.system(size: 18, weight: .semibold, design: .rounded))

// Tool Label
.font(.system(size: 12, weight: .semibold, design: .rounded))
```

---

## Spacing System

### Spacing Scale
Based on 8pt grid system:

- **XS**: 4pt - Tight spacing
- **S**: 8pt - Small spacing
- **M**: 16pt - Medium spacing (most common)
- **L**: 24pt - Large spacing
- **XL**: 40pt - Extra large spacing
- **XXL**: 60pt - Section breaks

### Application

```swift
// Between elements in a stack
.padding(.vertical, 8)    // S
.padding(.horizontal, 16) // M

// Between major sections
.spacing(24)              // L

// Screen edges
.padding(40)              // XL
```

---

## Component Specifications

### Buttons

#### Primary Button (Home Screen)
```
Size: Full width × 90pt height
Corner Radius: 20pt
Shadow: 0 4pt blur, 20% black
Icon: 40pt
Text: 32pt bold
Gradient: Yes
```

#### Tool Button (Toolbar)
```
Size: 60pt × 60pt
Corner Radius: 12pt
Icon: 28pt
Label: 12pt
Active State: Colored background
Inactive State: Light gray background
```

#### Color Button (Palette)
```
Size: 60pt diameter circle
Border: 2pt gray (white only)
Active Border: 4pt blue
Shadow: 0 2pt blur
```

### Icons

All icons from **SF Symbols** (Apple's icon library):

| Component | Icon | Size |
|-----------|------|------|
| App Logo | paintpalette.fill | 80pt |
| Free Draw | pencil.tip.crop.circle.fill | 40pt |
| Coloring Pages | photo.on.rectangle.angled | 40pt |
| Home | house.fill | 18pt |
| Back | arrow.left | 18pt |
| Size | circle.fill | 28pt |
| Eraser | eraser.fill | 28pt |
| Undo | arrow.uturn.backward | 28pt |
| Clear | trash.fill | 28pt |
| Save | square.and.arrow.down.fill | 28pt |
| Music On | speaker.wave.2.fill | 18pt |
| Music Off | speaker.slash.fill | 18pt |
| Success | checkmark.circle.fill | 80pt |

### Shadows

#### Button Shadow
```swift
.shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
```

#### Card Shadow
```swift
.shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
```

#### Toolbar Shadow
```swift
.shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
```

---

## Layouts

### Home Screen
```
┌─────────────────────────────┐
│                             │
│                             │
│         🎨 (80pt)          │
│    Kids Coloring (48pt)     │
│   Draw & Color! (28pt)      │
│                             │
│                             │
│  ┌─────────────────────┐   │
│  │   ✏️  Free Draw     │   │  90pt height
│  └─────────────────────┘   │
│                             │
│  ┌─────────────────────┐   │
│  │  📚 Coloring Pages  │   │  90pt height
│  └─────────────────────┘   │
│                             │
│                             │
│      🔊 Music On           │
│                             │
└─────────────────────────────┘
```

### Free Draw / Coloring Page
```
┌─────────────────────────────┐
│ 🏠 Home          [Title]    │  Top bar (60pt)
├─────────────────────────────┤
│                             │
│                             │
│        CANVAS               │
│       (Drawing)             │  Expandable
│                             │
│                             │
├─────────────────────────────┤
│ 🟥🟧🟨🟩🟦🟪🟫⚫⚪🔵🔷      │  Color palette (80pt)
├─────────────────────────────┤
│  Size Eraser Undo Clear Save│  Toolbar (90pt)
└─────────────────────────────┘
```

### Gallery Grid
```
┌─────────────────────────────┐
│ 🏠 Home    Pick a Page!     │
├─────────────────────────────┤
│  ┌────────┐  ┌────────┐    │
│  │  Cat   │  │  Dog   │    │
│  └────────┘  └────────┘    │
│                             │
│  ┌────────┐  ┌────────┐    │
│  │  Fish  │  │Butterfly│   │
│  └────────┘  └────────┘    │
│                             │
│  ┌────────┐  ┌────────┐    │
│  │  Star  │  │ Heart  │    │
│  └────────┘  └────────┘    │
│                             │
│  ┌────────┐  ┌────────┐    │
│  │ Circle │  │ House  │    │
│  └────────┘  └────────┘    │
└─────────────────────────────┘
```

---

## Animations

### Button Tap
```swift
Button(action: action) {
    // content
}
.scaleEffect(isPressed ? 0.95 : 1.0)
.animation(.spring(response: 0.3), value: isPressed)
```

### View Transitions
```swift
.transition(.move(edge: .bottom))
.animation(.spring(), value: showView)
```

### Success Animation
```swift
.transition(.scale.combined(with: .opacity))
.animation(.spring(), value: showSuccess)
```

### Color Selection
- Instant color change
- Blue border appears (4pt)
- Sound effect plays
- No delay

---

## Interaction States

### Button States

**Normal**
- Default appearance
- Full opacity
- Standard shadow

**Pressed**
- Scale: 0.95×
- Slight opacity reduction (95%)
- Shadow reduces

**Active** (Selected)
- Colored background
- White icon/text
- Stronger shadow

**Disabled**
- 50% opacity
- Gray color
- No interaction

### Color Button States

**Unselected**
- Solid color fill
- Small shadow
- No border (except white)

**Selected**
- Same color fill
- 4pt blue border
- Larger shadow
- Pulse animation (optional)

---

## Accessibility

### Touch Targets

**Minimum Size**: 60pt × 60pt
- Exceeds Apple's 44pt recommendation
- Suitable for toddler fingers
- Reduces frustration

**Examples**:
- Color buttons: 60pt diameter
- Tool buttons: 60pt square
- Home navigation: 80pt × 40pt

### Contrast Ratios

**Text on Background**:
- Black on white: 21:1 ✓
- Purple on white: 4.5:1 ✓
- White on purple: 4.5:1 ✓

**Interactive Elements**:
- High contrast icons
- Clear visual states
- Bold, large text

### VoiceOver Support
(Future enhancement)
- Descriptive labels
- Hint text for actions
- Logical focus order

---

## Sound Design

### Sound Effects

**Color Select**
- Sound: Pop (System 1104)
- Volume: Medium
- Duration: 100ms
- Purpose: Confirm selection

**Clear Canvas**
- Sound: Swoosh (System 1051)
- Volume: Medium
- Duration: 300ms
- Purpose: Indicate action

**Save Success**
- Sound: Success (System 1054)
- Volume: Medium
- Duration: 500ms
- Purpose: Positive feedback

### Music
- Gentle, looping background track
- Toggle on/off
- Low volume, non-intrusive
- (Custom file to be added)

---

## Responsive Design

### iPhone (Portrait)
- Single column layouts
- Full-width buttons
- Bottom toolbars
- Scrollable color palette

### iPhone (Landscape)
- Similar to portrait
- More canvas space
- Compressed toolbars

### iPad (Portrait)
- Centered content (max 600pt wide)
- Larger canvas
- Same proportions

### iPad (Landscape)
- Horizontal layout possible
- Sidebar for tools
- Maximum canvas space

---

## Visual Hierarchy

### Priority Levels

**Primary** - Main actions
- Free Draw button
- Coloring Pages button
- Save button

**Secondary** - Supporting actions
- Color selection
- Brush size
- Tools (eraser, undo)

**Tertiary** - Navigation
- Home button
- Back button
- Settings toggle

### Visual Weight

**Heavy** (Most attention)
- Large size (90pt+ height)
- Bright gradients
- Bold text
- Strong shadows

**Medium**
- 60pt dimensions
- Solid colors
- Semibold text
- Moderate shadows

**Light** (Least attention)
- Small size (40pt height)
- Muted colors
- Regular weight
- Subtle shadows

---

## Error States

### No Errors Shown to Kids
- Fail silently where safe
- Log to console for debugging
- No error alerts for children

### Parent-Visible Issues
- Photo permission denial
- System issues
- (Future: Parent mode alerts)

---

## Loading States

### App Launch
- System splash screen
- Quick load (<1 second)
- Immediate usability

### Drawing Canvas
- Instant ready
- No loading indicator needed
- PencilKit handles internally

### Save Operation
- Brief delay (< 1 second)
- Success animation shows completion
- No loading spinner needed

---

## Dark Mode

**Not Supported**
- Target age (2-5) prefers bright colors
- Drawing apps benefit from light backgrounds
- Reduces complexity
- Future consideration for parent mode

---

## Platform-Specific Patterns

### iOS Design Language
✓ System fonts
✓ SF Symbols
✓ Native navigation
✓ System sounds
✓ Photo library integration
✓ PencilKit canvas
✓ Standard gestures

### SwiftUI Components
✓ NavigationStack
✓ ScrollView
✓ LazyVGrid
✓ Button
✓ Alert
✓ Sheet

---

## Design Tokens (SwiftUI)

```swift
// Colors
extension Color {
    static let appPurple = Color(red: 0.61, green: 0.35, blue: 0.71)
    static let appPink = Color(red: 1.0, green: 0.42, blue: 0.62)
    static let appOrange = Color.orange
    static let appBlue = Color.blue
}

// Spacing
enum Spacing {
    static let xs: CGFloat = 4
    static let s: CGFloat = 8
    static let m: CGFloat = 16
    static let l: CGFloat = 24
    static let xl: CGFloat = 40
    static let xxl: CGFloat = 60
}

// Corner Radius
enum CornerRadius {
    static let small: CGFloat = 10
    static let medium: CGFloat = 15
    static let large: CGFloat = 20
}

// Shadows
extension View {
    func cardShadow() -> some View {
        shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
```

---

## Testing Designs

### Visual Testing
- Test on multiple device sizes
- Check in portrait and landscape
- Verify touch target sizes
- Ensure readability

### Usability Testing
- Observe 2-5 year olds using app
- Note confusion points
- Measure task completion
- Iterate based on feedback

### Accessibility Audit
- Check contrast ratios
- Test with large text
- Verify touch targets
- Consider color blindness

---

## Design Resources

### Tools Used
- Xcode Interface Builder
- SwiftUI Previews
- SF Symbols App
- Color Meter (macOS)

### Inspiration Sources
- Apple Human Interface Guidelines
- Children's app best practices
- Educational toy design
- Montessori principles

---

**Design Version**: 1.0
**Last Updated**: 2024
**Designer**: Kids Coloring Team
**Platform**: iOS 16.0+
