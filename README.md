# PreferencesSpellBook

[![Swift](https://img.shields.io/badge/Swift-5-blue.svg)](https://swift.org)
[![macOS](https://img.shields.io/badge/os-macOS-blue.svg)](https://apple.com/mac)
[![Xcode](https://img.shields.io/badge/Xcode-12-blue.svg)](https://developer.apple.com/xcode)
[![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager)
[![MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Swift Package to provide standard Preference window functionality for Macintosh App Development (Cocoa).

## Installation

### Requirements

- MacOS 10.15
- Swift 5
- Xcode 11

### Repository

    https://github.com/magesteve/PreferencesSpellBook.git

## Preferences Magic

To setup a standard Preference window, with a toolbar to select between the different Tab Views, the PreferenceItem startic function needs to be invoked at App startup for each of the preference panel items.

    public static func addItem(ident: String, title: String, imageName: String, viewController: NSViewController, width: Int, height: Int)

Each item needs a unique identifier, a display name, an image Name (images are invoked with NSImage(named:) call), the View Controller to display when the item is selected, and a width/height of that view controller.  When a user selects the icon with the displayed name, the view controller is placed on the window, and the window is resized to the given width & height.

To display the window, the PreferenceItem startic function needs to be invoked. Usually the Preference menu item is associated with this call.

    public static func display(ident: String? = nil)

If the ident is passed nil, when the Window is displayed for the first time, the first item is displayed. if the window was closed previously, the window is opened with the last panel displayed.  If the ident string matches an items ident string, that that panel is displayed.

### Examples

Given two standard View Controller panels in the Main Storyboard with the storyboard ids of "general" & "sound", the following commands are added to the applicationDidFinishLaunching() function.

    if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "general") as? NSViewController {
        PreferencesItem.addItem(ident: "general", title: "General", imageName: NSImage.actionTemplateName, viewController: vc, width: 300, height: 200)
    }

    if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "sound") as? NSViewController {
        PreferencesItem.addItem(ident: "sound", title: "Sound", imageName: NSImage.computerName, viewController: vc, width: 400, height: 300)
    }

This adds two Preference item, each with specific ident, name, icon & view controller.

The modify the Preference menu item in the Main storyboard to the IBAction preferenceAction.  Add this code.

    @IBAction func preferenceAction(_ sender: Any) {
        PreferencesItem.display()
    }
    
#### Demo App

The above examples can be found in the open-source [CocoaGrimoire](https://github.com/magesteve/CocoaGrimoire) app. Other SpellBooks by the author are also demonstrated there.

## License
PreferencesSpellBook is available as open source under the terms of the [MIT](https://github.com/magesteve/PreferencesSpellBook/blob/main/LICENSE) License.
