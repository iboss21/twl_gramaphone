# Contributing to The Land of Wolves - Phonograph System

First off, thank you for considering contributing to our project! 🐺

The Land of Wolves is community-driven, and we welcome contributions from everyone. Whether you're fixing bugs, adding features, improving documentation, or suggesting new ideas, your input is valuable.

## 🤝 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**When submitting a bug report, include:**
- Clear, descriptive title
- Detailed steps to reproduce
- Expected behavior vs actual behavior
- Screenshots/videos if applicable
- Your RedM version and framework
- Console errors (if any)
- Server.cfg relevant sections

**Use this template:**
```markdown
**Bug Description:**
A clear description of the bug.

**To Reproduce:**
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior:**
What should happen.

**Screenshots:**
If applicable, add screenshots.

**Environment:**
- RedM Version: [e.g., build 1491]
- Framework: [e.g., VORP 2.0]
- Resource Version: [e.g., 1.0.0]

**Additional Context:**
Any other relevant information.
```

### Suggesting Features

We love feature suggestions! Before submitting:
- Check if it's already suggested in Discussions or Issues
- Consider if it fits the 1899 historical theme
- Think about how it affects performance
- Consider compatibility across frameworks

**Use this template:**
```markdown
**Feature Title:**
A clear, concise title.

**Problem It Solves:**
What issue or gap does this address?

**Proposed Solution:**
How should it work?

**Alternatives Considered:**
What other approaches did you think about?

**Historical Accuracy:**
Does this fit the 1899 era? How?

**Additional Context:**
Mockups, examples, or references.
```

### Adding Music Tracks

Want to suggest period-appropriate music? Great!

**Requirements:**
- Must be from 1890-1905 era (or sound period-appropriate)
- Must be public domain or properly licensed
- Must have accessible YouTube link
- Must include artist/composer information
- Should fit into one of our existing playlists

**Submission Format:**
```lua
{
    title = "Song Title - Artist Name",
    url = "https://youtube.com/watch?v=...",
    year = "1899",
    genre = "Ragtime/Folk/etc.",
    playlist = "Which playlist it belongs to",
    reason = "Why it's period-appropriate"
}
```

### Improving Documentation

Documentation improvements are always welcome!

**Areas to improve:**
- Fix typos or unclear wording
- Add examples or tutorials
- Translate to other languages
- Expand configuration guides
- Create video tutorials

### Code Contributions

Want to contribute code? Awesome! Here's how:

## 💻 Development Process

### 1. Setup Development Environment

```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/YOUR-USERNAME/twl_gramaphone.git
cd twl_gramaphone

# Add upstream remote
git remote add upstream https://github.com/iboss21/twl_gramaphone.git

# Install dependencies
# (Instructions will be added once implementation begins)
```

### 2. Create a Branch

```bash
# Update your fork
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

**Branch naming conventions:**
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test additions/changes
- `perf/` - Performance improvements

### 3. Make Your Changes

**Code Style Guidelines:**

#### Lua Code Style
```lua
-- Use descriptive variable names
local playerPosition = GetEntityCoords(playerPed)

-- Comment complex logic
-- Calculate volume based on inverse square distance falloff
local volumeFalloff = 1.0 - (distance / maxDistance) ^ 2

-- Use consistent indentation (4 spaces)
function CalculateAudioVolume(distance, baseVolume)
    if distance > Config.MaxAudioRange then
        return 0.0
    end
    
    local falloff = 1.0 - (distance / Config.MaxAudioRange) ^ Config.AudioFalloff
    return baseVolume * math.max(0.0, math.min(1.0, falloff))
end

-- Use tables for configuration
Config = {
    EnableFeature = true,
    DefaultValue = 0.5,
    MaxDistance = 50.0
}
```

#### JavaScript Code Style (NUI)
```javascript
// Use camelCase for variables
const currentPlaylist = getActivePlaylist();

// Use arrow functions for callbacks
playlists.forEach(playlist => {
    renderPlaylistItem(playlist);
});

// Use const/let, avoid var
const isPlaying = false;
let volume = 0.8;

// Comment complex logic
// Sync audio playback with server timestamp
function syncAudioPosition(serverTime) {
    const clientTime = Date.now();
    const drift = clientTime - serverTime;
    // ...
}
```

#### HTML/CSS Style
```html
<!-- Use semantic HTML -->
<nav class="phonograph-menu">
    <ul class="playlist-grid">
        <li class="playlist-item">...</li>
    </ul>
</nav>

<!-- Use BEM naming for CSS -->
<div class="phonograph-menu__header">
    <h1 class="phonograph-menu__title">The Phonograph</h1>
</div>
```

```css
/* Use BEM methodology */
.phonograph-menu { }
.phonograph-menu__header { }
.phonograph-menu__title { }
.phonograph-menu__title--active { }

/* Group related properties */
.element {
    /* Positioning */
    position: absolute;
    top: 0;
    left: 0;
    
    /* Box model */
    width: 100%;
    padding: 10px;
    
    /* Typography */
    font-size: 16px;
    color: #333;
    
    /* Visual */
    background: #fff;
    border: 1px solid #ccc;
}
```

### 4. Test Your Changes

**Before submitting, test:**
- [ ] Code runs without errors
- [ ] Works on multiple frameworks (if applicable)
- [ ] Performance impact is minimal
- [ ] UI changes look good on different resolutions
- [ ] No console errors or warnings
- [ ] Existing features still work
- [ ] Config changes are documented

**Testing checklist:**
```lua
-- Framework tests
Test on LXR-Core: [ ]
Test on RSG-Core: [ ]
Test on VORP: [ ]
Test on Standalone: [ ]

-- Feature tests
Audio playback: [ ]
UI interaction: [ ]
Synchronization: [ ]
Permissions: [ ]
Economy: [ ]

-- Edge cases
Player disconnect: [ ]
Invalid URLs: [ ]
Multiple phonographs: [ ]
```

### 5. Commit Your Changes

**Commit message format:**
```
type(scope): brief description

Longer explanation if needed.

- Bullet points for multiple changes
- Reference issues: Fixes #123
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style (formatting, no logic change)
- `refactor`: Code refactoring
- `perf`: Performance improvement
- `test`: Tests
- `chore`: Build process, dependencies

**Examples:**
```bash
git commit -m "feat(audio): add vintage audio filter effect"
git commit -m "fix(ui): correct volume slider calculation"
git commit -m "docs(readme): add troubleshooting section"
```

### 6. Push and Create Pull Request

```bash
# Push to your fork
git push origin feature/your-feature-name

# Create pull request on GitHub
# Fill out the PR template
```

**Pull Request Guidelines:**

**Title format:**
`[Type] Brief description`

**PR Description should include:**
- What changes were made
- Why the changes were needed
- How to test the changes
- Screenshots (if UI changes)
- Breaking changes (if any)
- Related issues

**PR Template:**
```markdown
## Description
Brief description of changes.

## Type of Change
- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change (fix or feature that breaks existing functionality)
- [ ] Documentation update

## How to Test
1. Step one
2. Step two
3. Verify result

## Screenshots (if applicable)
Add screenshots here.

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-reviewed my code
- [ ] Commented complex code
- [ ] Updated documentation
- [ ] No new warnings
- [ ] Tested on multiple frameworks
- [ ] Minimal performance impact

## Related Issues
Fixes #(issue number)
```

## 📋 Review Process

### What Happens Next?

1. **Automated Checks:** GitHub Actions will run tests
2. **Code Review:** Maintainers will review your code
3. **Feedback:** We may request changes
4. **Approval:** Once approved, we'll merge!

### Review Criteria

We look for:
- ✅ Code quality and style
- ✅ Test coverage
- ✅ Documentation
- ✅ Performance impact
- ✅ Framework compatibility
- ✅ Historical accuracy (if content)
- ✅ No breaking changes (or properly documented)

### Response Time

- Bug fixes: 24-48 hours
- Features: 3-7 days
- Documentation: 1-3 days

## 🎨 Style Guidelines

### General Principles

1. **Performance First:** Every line should be efficient
2. **Readability:** Code should be self-documenting
3. **Consistency:** Follow existing patterns
4. **Simplicity:** Keep it simple, avoid over-engineering
5. **Historical Accuracy:** Respect the 1899 theme

### Performance Guidelines

```lua
-- ❌ Bad: Creating objects in loops
for i = 1, 100 do
    local data = { coords = GetEntityCoords(ped) }
    ProcessData(data)
end

-- ✅ Good: Reuse objects
local data = {}
for i = 1, 100 do
    data.coords = GetEntityCoords(ped)
    ProcessData(data)
end

-- ❌ Bad: Unnecessary loops
for _, player in ipairs(GetPlayers()) do
    if player == targetId then
        return true
    end
end

-- ✅ Good: Direct checks
return DoesEntityExist(GetPlayerPed(targetId))
```

### Framework Compatibility

```lua
-- ❌ Bad: Framework-specific code
local QBCore = exports['qb-core']:GetCoreObject()
local Player = QBCore.Functions.GetPlayer(source)

-- ✅ Good: Use bridge/abstraction
local Player = Framework.GetPlayer(source)

-- ✅ Better: Make it work everywhere
local function GetPlayerMoney(source)
    if Config.Framework == 'lxr' then
        -- LXR logic
    elseif Config.Framework == 'vorp' then
        -- VORP logic
    else
        -- Standalone logic
    end
end
```

## 🌍 Translation Contributions

Want to translate to your language?

### Process:
1. Copy `locales/en.lua`
2. Rename to your language code (e.g., `es.lua`, `fr.lua`)
3. Translate all strings
4. Test in-game
5. Submit PR

### Translation Guidelines:
- Keep formatting placeholders: `%s`, `%d`, etc.
- Maintain tone (formal vs casual)
- Consider regional variations
- Keep similar string length for UI
- Translate naturally, not literally

## 🐛 Debugging Tips

### Common Issues:

**Audio not playing:**
```lua
-- Check xsound is loaded
if GetResourceState('xsound') ~= 'started' then
    print('xsound not started!')
end

-- Check URL format
local videoId = ExtractYouTubeId(url)
if not videoId then
    print('Invalid YouTube URL:', url)
end
```

**Framework not detected:**
```lua
-- Check resource names
print('LXR-Core state:', GetResourceState('lxr-core'))
print('RSG-Core state:', GetResourceState('rsg-core'))

-- Force framework
Config.Framework = 'vorp'  -- Manually set
```

**UI not opening:**
```lua
-- Check NUI focus
print('NUI Focus:', HasNuiFocus())

-- Check messages sent
RegisterNUICallback('test', function(data, cb)
    print('NUI callback received:', json.encode(data))
    cb('ok')
end)
```

## 📞 Getting Help

Stuck? Need help? We're here for you!

- **Discord:** Join our server for real-time help
- **GitHub Discussions:** Ask questions, share ideas
- **GitHub Issues:** Report bugs, request features
- **Documentation:** Check docs.wolves.land

## 🏆 Recognition

Contributors will be:
- Listed in README.md
- Credited in release notes
- Given contributor role on Discord
- Mentioned in our community showcase

**Top contributors get special recognition:**
- Featured on wolves.land
- Special Discord roles
- Beta access to new features
- Direct line to development team

## 📜 Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

**Examples of positive behavior:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what's best for the community
- Showing empathy towards others

**Unacceptable behavior:**
- Trolling, insulting/derogatory comments, personal attacks
- Public or private harassment
- Publishing others' private information
- Other conduct considered inappropriate

### Enforcement

Violations may result in:
1. Warning
2. Temporary ban from project
3. Permanent ban from project

Report violations to: discord.gg/landofwolves or GitHub

## 🎓 Learning Resources

New to RedM development?

- [RedM Documentation](https://docs.redm.gg/)
- [FiveM/RedM Natives](https://docs.fivem.net/natives/)
- [Lua Tutorial](https://www.lua.org/manual/5.4/)
- [JavaScript MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

## 📋 Contributor License Agreement

By contributing, you agree that:
- Your contributions will be licensed under MIT License
- You have the right to submit the contribution
- You grant us rights to use your contribution

## 🎉 Thank You!

Every contribution, no matter how small, makes this project better. Thank you for being part of The Land of Wolves community!

---

**Questions?** Join our Discord: discord.gg/landofwolves

**The Land of Wolves**  
*Immersion Through Excellence*  
www.wolves.land

---

*Last Updated: January 10, 2026*  
*Created by iBoss*
