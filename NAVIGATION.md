# 🗺️ App Navigation Flow

Visual guide to navigation and user experience in the Kids Coloring App.

## User Journey Map

```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│                      APP LAUNCH                            │
│                          ↓                                 │
│                  ┌──────────────┐                         │
│                  │   HomeView   │                         │
│                  │              │                         │
│                  │  🎨 Logo     │                         │
│                  │              │                         │
│                  │ [Free Draw]  │                         │
│                  │              │                         │
│                  │ [Coloring    │                         │
│                  │  Pages]      │                         │
│                  │              │                         │
│                  │ 🔊 Music     │                         │
│                  └──────┬───────┘                         │
│                         │                                  │
│         ┌───────────────┴──────────────┐                  │
│         │                               │                  │
│         ↓                               ↓                  │
│  ┌─────────────┐              ┌──────────────────┐       │
│  │FreeDrawView │              │ GalleryView      │       │
│  │             │              │                  │       │
│  │ [Home]      │              │ [Home]           │       │
│  │             │              │                  │       │
│  │   CANVAS    │              │ ┌────┐  ┌────┐  │       │
│  │             │              │ │Cat │  │Dog │  │       │
│  │             │              │ └────┘  └────┘  │       │
│  │ 🎨🎨🎨🎨    │              │                  │       │
│  │ [Colors]    │              │ ┌────┐  ┌────┐  │       │
│  │             │              │ │Fish│  │Fly │  │       │
│  │ [Tools]     │              │ └────┘  └────┘  │       │
│  └─────────────┘              │                  │       │
│                               │ ┌────┐  ┌────┐  │       │
│                               │ │Star│  │Heart│ │       │
│                               │ └────┘  └────┘  │       │
│                               │                  │       │
│                               │ ┌────┐  ┌────┐  │       │
│                               │ │Circ│  │House│ │       │
│                               │ └────┘  └────┘  │       │
│                               └────────┬─────────┘       │
│                                        │                  │
│                                        ↓                  │
│                               ┌─────────────────┐        │
│                               │ColoringPageView │        │
│                               │                 │        │
│                               │ [← Back]  Cat   │        │
│                               │                 │        │
│                               │  📄 Template    │        │
│                               │    + Canvas     │        │
│                               │                 │        │
│                               │ 🎨🎨🎨🎨        │        │
│                               │ [Colors]        │        │
│                               │                 │        │
│                               │ [Tools]         │        │
│                               └─────────────────┘        │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

## Screen Details

### 🏠 HomeView
**Navigation Options:**
- Free Draw → FreeDrawView
- Coloring Pages → ColoringPagesGalleryView
- Music Toggle → Sound setting

**Actions:**
- Tap "Free Draw" button
- Tap "Coloring Pages" button
- Toggle music on/off

---

### 🎨 FreeDrawView
**Navigation:**
- Home button → Back to HomeView

**Tools Available:**
- Canvas for drawing
- Color palette (12 colors)
- Brush size picker (3 sizes)
- Eraser toggle
- Undo button
- Clear all (with confirmation)
- Save to Photos

**User Flow:**
1. Enter from HomeView
2. Select color from palette
3. Choose brush size
4. Draw on canvas
5. Use tools as needed
6. Save artwork or go home

---

### 📚 ColoringPagesGalleryView
**Navigation:**
- Home button → Back to HomeView
- Any page card → ColoringPageView

**Content:**
- Grid of 8 coloring pages
- 2 columns layout
- Scrollable if needed

**User Flow:**
1. Enter from HomeView
2. Browse available pages
3. Tap a page to color it
4. Or go back home

---

### 🖍️ ColoringPageView
**Navigation:**
- Back button → ColoringPagesGalleryView

**Features:**
- Background template (faded)
- Canvas overlay for coloring
- Same tools as FreeDrawView
- Page name in header

**User Flow:**
1. Enter from GalleryView
2. See template outline
3. Select colors and draw
4. Color the template
5. Save artwork
6. Go back to gallery or home

---

## Component Hierarchy

```
App
└── KidsColoringAppApp
    ├── SoundManager (EnvironmentObject)
    │
    └── HomeView
        │
        ├── FreeDrawView
        │   ├── DrawingViewModel
        │   ├── CanvasView (PKCanvasView)
        │   ├── ColorPaletteView
        │   │   └── ColorButton × 12
        │   ├── BrushSizePickerView
        │   │   └── BrushSizeButton × 3
        │   └── ToolbarView
        │       └── ToolButton × 5
        │
        └── ColoringPagesGalleryView
            └── ColoringPageView
                ├── DrawingViewModel
                ├── Template Image
                ├── CanvasView (PKCanvasView)
                ├── ColorPaletteView
                ├── BrushSizePickerView
                └── ToolbarView
```

## State Flow

```
User Action
    ↓
View (SwiftUI)
    ↓
ViewModel (State Change)
    ↓
Model (Data Update)
    ↓
View Update (Automatic)
```

### Example: Color Selection

```
1. User taps Red color button
   ↓
2. ColorPaletteView receives tap
   ↓
3. Calls viewModel.setColor(.red)
   ↓
4. DrawingViewModel updates currentColor
   ↓
5. SoundManager plays sound
   ↓
6. View auto-updates (blue border on red)
   ↓
7. Canvas tool updates to red pen
```

## Drawing Flow

```
┌─────────────────────────────────────┐
│  User draws with finger on screen   │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  PKCanvasView captures input        │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  Current tool (color, size) applied │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  Stroke rendered on canvas          │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  Added to undo stack                │
└─────────────────────────────────────┘
```

## Save Flow

```
┌─────────────────────────────────────┐
│  User taps Save button              │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  ToolbarView calls onSave()         │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  ViewModel exports drawing as image │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  ImageSaver saves to Photos         │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  Success sound plays                │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  Success animation shows            │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│  Artwork saved to Photo Library     │
└─────────────────────────────────────┘
```

## Tool Interaction Flow

```
┌──────────────┐
│  Color Tap   │ → Set color → Update tool → Visual highlight
├──────────────┤
│  Size Tap    │ → Set size → Update tool → Show selection
├──────────────┤
│  Eraser Tap  │ → Toggle mode → Switch tool → Highlight button
├──────────────┤
│  Undo Tap    │ → Call undo → Remove stroke → Canvas updates
├──────────────┤
│  Clear Tap   │ → Show alert → If confirmed → Clear canvas
├──────────────┤
│  Save Tap    │ → Export image → Save to Photos → Show success
└──────────────┘
```

## Sound Trigger Points

```
User Action           →  Sound Effect
──────────────────────────────────────
Tap color            →  Pop (1104)
Tap brush size       →  Pop (1104)
Tap tool button      →  Pop (1104)
Clear canvas         →  Swoosh (1051)
Save artwork         →  Success (1054)
Toggle music         →  Pop (1104)
```

## Data Flow Diagram

```
┌─────────────────────────────────────────────┐
│            User Interface (Views)            │
│  HomeView, FreeDrawView, GalleryView, etc   │
└──────────────────┬──────────────────────────┘
                   │ @State, @ObservedObject
                   ↓
┌─────────────────────────────────────────────┐
│         State Management (ViewModels)        │
│           DrawingViewModel                   │
│  - currentColor, brushSize, currentTool     │
│  - canvasView (PKCanvasView)                │
└──────────────────┬──────────────────────────┘
                   │ Uses
                   ↓
┌─────────────────────────────────────────────┐
│              Models (Data)                   │
│  ColoringPage, DrawingTool, BrushSize       │
└─────────────────────────────────────────────┘
                   
┌─────────────────────────────────────────────┐
│          Helpers (Services)                  │
│  SoundManager, ImageSaver                   │
└─────────────────────────────────────────────┘
```

## Permission Flow

```
First Launch
    ↓
User taps Save
    ↓
Check Photo Permission
    ↓
Not Determined?
    ↓
Request Permission
    ↓
┌──────────────┬──────────────┐
│   Granted    │    Denied    │
└──────┬───────┴──────┬───────┘
       ↓              ↓
   Save Image    Show Error
       ↓         (Log to console)
   Success!
       ↓
   Play Sound
       ↓
   Show Animation
```

## Error Handling Flow

```
Action Attempted
    ↓
Try Operation
    ↓
Success? ──No──→ Log Error
    │              │
    Yes            ↓
    ↓         Fail Silently
Continue      (Child-safe)
    ↓
Happy Path!
```

## Memory Management

```
View Created
    ↓
ViewModel Initialized
    ↓
Canvas Created (PKCanvasView)
    ↓
User Draws
    ↓
Strokes Accumulated
    ↓
User Exits View
    ↓
View Dismissed
    ↓
ViewModel Deinit
    ↓
Memory Released
```

## App Lifecycle

```
Launch
    ↓
Load App
    ↓
Initialize SoundManager
    ↓
Show HomeView
    ↓
User Interaction
    │
    ├─→ Navigate to views
    ├─→ Draw and color
    ├─→ Save artwork
    └─→ Use tools
    ↓
Background (optional)
    ↓
Foreground (restore state)
    ↓
Terminate (cleanup)
```

---

## Quick Navigation Reference

### From Home
- **Free Draw** → Direct to canvas
- **Coloring Pages** → Gallery view

### From Free Draw
- **Home** → Back to home
- **Save** → Photos library

### From Gallery
- **Home** → Back to home
- **Any Page** → Open that page

### From Coloring Page
- **Back** → Gallery
- **Save** → Photos library

---

## Gesture Support

| Gesture | Action | Where |
|---------|--------|-------|
| Tap | Select color/tool | Toolbars |
| Tap | Navigate | Buttons |
| Tap | Confirm | Alerts |
| Drag | Draw stroke | Canvas |
| Scroll | Browse colors | Color palette |
| Scroll | Browse pages | Gallery |

---

## Child Safety Checkpoints

- ❌ No external navigation
- ❌ No web content
- ❌ No in-app purchases
- ✅ Confirmation for destructive actions
- ✅ Large, forgiving touch targets
- ✅ Simple, obvious navigation
- ✅ Immediate visual feedback

---

**Navigation designed for children ages 2-5**
**Maximum 2 taps to reach any feature**
**Clear visual hierarchy at every step**
