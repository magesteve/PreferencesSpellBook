//
//  PreferencesAppController.swift
//  PreferencesSpellBook
//
//  Created by Steve Sheets on 2/12/21.
//

import Foundation

// MARK: - PreferencesAppController Protocol

/// Optional Protocol for App Controller using Preferences
public protocol PreferencesAppController: class {
    
}

// MARK: - PreferencesAppController Extension

public extension PreferencesAppController {
    
    /// Action to open preferences
    func preferencesSpellAction(_ sender: Any) {
        PreferencesItem.display()
    }
}
