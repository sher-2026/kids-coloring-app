# 🤝 Contributing to Kids Coloring App

Thank you for your interest in contributing! This app is designed to be a safe, fun learning experience for children ages 2-5.

## Ways to Contribute

### 🎨 Design Contributions
- New coloring page templates
- UI/UX improvements
- Icon designs
- Color palette suggestions
- Animation ideas

### 💻 Code Contributions
- Bug fixes
- New features
- Performance improvements
- Accessibility enhancements
- Code refactoring

### 📚 Documentation
- Tutorial improvements
- Translation to other languages
- Video guides
- Screenshots
- Use case examples

### 🧪 Testing
- Device testing
- Usability testing with kids
- Performance testing
- Bug reports

---

## Getting Started

### 1. Fork the Repository
```bash
# Click "Fork" on GitHub
# Clone your fork
git clone https://github.com/YOUR-USERNAME/kids-coloring-app.git
cd kids-coloring-app
```

### 2. Create a Branch
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### 3. Make Changes
- Follow existing code style
- Keep changes focused
- Test thoroughly

### 4. Commit
```bash
git add .
git commit -m "Add: description of your changes"
git push origin feature/your-feature-name
```

### 5. Open Pull Request
- Go to GitHub
- Click "New Pull Request"
- Describe your changes
- Link any related issues

---

## Development Guidelines

### Code Style

#### Swift
- Use Swift 5.9+ features
- Follow Apple's Swift API Design Guidelines
- Use SwiftUI for all UI
- Prefer value types (struct) over reference types (class)
- Use meaningful variable names

```swift
// Good
let selectedColor: Color = .red
var brushSize: BrushSize = .medium

// Avoid
let c: Color = .red
var bs = 15
```

#### File Organization
- One view per file
- Group related files in folders
- Use extensions for protocol conformance

```swift
// HomeView.swift
struct HomeView: View {
    var body: some View {
        // View code
    }
}

extension HomeView {
    // Helper methods
}

#Preview {
    HomeView()
}
```

### SwiftUI Best Practices

1. **Extract Subviews**
   ```swift
   // Extract complex views
   struct ColorButton: View { }
   struct ToolbarButton: View { }
   ```

2. **Use @State and @ObservedObject Appropriately**
   ```swift
   @State private var showAlert = false
   @ObservedObject var viewModel: DrawingViewModel
   ```

3. **Provide Previews**
   ```swift
   #Preview {
       YourView()
   }
   ```

### Accessibility

All new features must be accessible:
- [ ] Minimum 60pt touch targets
- [ ] High contrast ratios (4.5:1 minimum)
- [ ] Clear visual feedback
- [ ] Descriptive labels (future VoiceOver support)

---

## Child Safety Guidelines

**Critical Rules:**

1. **No External Content**
   - No web views
   - No external links
   - No user-generated content sharing

2. **No Data Collection**
   - No analytics
   - No tracking
   - No cloud sync

3. **No Monetization**
   - No ads
   - No in-app purchases
   - Keep it free and safe

4. **Parental Controls**
   - Any settings must have parental gate
   - Confirmations for destructive actions

---

## Adding New Features

### New Coloring Pages

1. **Create SVG or PNG Template**
   - Size: 1000×1000 pixels minimum
   - Black outline on transparent background
   - Line width: 8-10pt
   - Simple, clear shapes

2. **Add to Assets**
   ```
   Resources/ColoringPages/your_image.svg
   ```

3. **Update Model**
   ```swift
   // In ColoringPage.swift
   ColoringPage(name: "Dinosaur", imageName: "dinosaur_outline", category: .animal)
   ```

### New Tools

1. **Add to DrawingTool enum**
   ```swift
   enum DrawingTool {
       case pen
       case eraser
       case marker  // New tool
   }
   ```

2. **Update ViewModel**
   ```swift
   func setTool(_ tool: DrawingTool) {
       // Implementation
   }
   ```

3. **Add UI Button**
   ```swift
   ToolButton(icon: "pencil.tip", label: "Marker", ...)
   ```

### New Sounds

1. **Add audio file** to `Resources/Sounds/`
2. **Update SoundManager**
   ```swift
   enum SoundEffect {
       case colorSelect
       case clear
       case save
       case newSound  // Add here
   }
   ```

---

## Testing Checklist

Before submitting a PR, verify:

### Functionality
- [ ] Feature works as intended
- [ ] No crashes or errors
- [ ] Handles edge cases
- [ ] Works on iPhone and iPad
- [ ] Works in portrait and landscape

### UI/UX
- [ ] Follows design system (see DESIGN.md)
- [ ] Child-friendly interface
- [ ] Large touch targets (60pt+)
- [ ] Consistent with existing UI
- [ ] Smooth animations

### Code Quality
- [ ] No compiler warnings
- [ ] No force unwraps
- [ ] Proper error handling
- [ ] Memory efficient
- [ ] Code is documented

### Testing
- [ ] Tested on simulator
- [ ] Tested on device (if possible)
- [ ] Tested with actual children (ideal!)

---

## Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation
- [ ] Design improvement

## Testing
How was this tested?

## Screenshots
If UI changes, include before/after

## Checklist
- [ ] Follows code style
- [ ] Tested thoroughly
- [ ] Updated documentation
- [ ] No new warnings
- [ ] Child-safe
```

---

## Bug Reports

### Before Opening an Issue

1. Check existing issues
2. Verify it's reproducible
3. Test on latest version

### Issue Template

```markdown
**Bug Description**
Clear description of the bug

**Steps to Reproduce**
1. Go to...
2. Tap on...
3. See error...

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- iOS version:
- Device:
- App version:

**Screenshots**
If applicable
```

---

## Feature Requests

### Template

```markdown
**Feature Description**
What feature would you like?

**Use Case**
Why is this needed?

**Proposed Solution**
How should it work?

**Alternatives Considered**
Other approaches?

**Child Safety**
How does this remain safe for kids?
```

---

## Code Review Process

1. **Automated Checks** (when available)
   - Swift lint
   - Build success
   - No warnings

2. **Manual Review**
   - Code style compliance
   - Child safety verification
   - UX appropriateness
   - Performance impact

3. **Approval**
   - At least one maintainer approval
   - All comments addressed

4. **Merge**
   - Squash and merge (typically)
   - Delete branch after merge

---

## Versioning

We use Semantic Versioning (SemVer):
- **Major**: Breaking changes
- **Minor**: New features (backward compatible)
- **Patch**: Bug fixes

Example: `1.2.3`
- 1 = Major version
- 2 = Minor version
- 3 = Patch version

---

## Communication

### Channels
- GitHub Issues - Bug reports, feature requests
- GitHub Discussions - General questions, ideas
- Pull Requests - Code review, implementation discussion

### Response Times
- We aim to respond within 3-5 business days
- Complex PRs may take longer to review

---

## Recognition

Contributors will be recognized in:
- README.md contributors section
- App credits (if shipping to App Store)
- GitHub contributors page

---

## Questions?

Not sure about something? Ask!
- Open a Discussion on GitHub
- Comment on related issues
- Reach out to maintainers

---

## Code of Conduct

### Our Standards

**Do:**
✅ Be respectful and inclusive
✅ Welcome newcomers
✅ Focus on what's best for kids
✅ Accept constructive criticism
✅ Show empathy

**Don't:**
❌ Harass or discriminate
❌ Post inappropriate content
❌ Spam or self-promote
❌ Share others' private information

### Enforcement
Violations will result in:
1. Warning
2. Temporary ban
3. Permanent ban

---

## Legal

### License
By contributing, you agree that your contributions will be licensed under the MIT License.

### Copyright
You retain copyright of your contributions but grant us permission to use them.

### Child Safety Compliance
All contributions must comply with COPPA (Children's Online Privacy Protection Act) and similar regulations.

---

## Thank You! 💙

Every contribution, no matter how small, helps make this app better for children everywhere.

**Happy Coding!** 🎨

---

*Last Updated: 2024*
*Contributing Guide Version: 1.0*
