# PreferencesSpellBook

Swift Package to provide standard Preference window functionality.

https://github.com/magesteve/PreferencesSpellBook.git

Refer to code documentation for explanation for specific calls.

## Preferences Magic

To setup a standard Preference window, with a toolbar to select between the different Tab Views, the PreferenceItem startic function needs to be invoked at App startup for each of the preference panel items.

    public static func addItem(ident: String, title: String, imageName: String, viewController: NSViewController, width: Int, height: Int)

Each item needs a unique identifier, a display name, an image Name (images are invoked with NSImage(named:) call), the View Controller to display when the item is selected, and a width/height of that view controller.  When a user selects the icon with the displayed name, the view controller is placed on the window, and the window is resized to the given width & height.

To display the window, the PreferenceItem startic function needs to be invoked. Usually the Preference menu item is associated with this call.

    public static func display(ident: String? = nil)

If the ident is passed nil, when the Window is displayed for the first time, the first item is displayed. if the window was closed previously, the window is opened with the last panel displayed.  If the ident string matches an items ident string, that that panel is displayed.
