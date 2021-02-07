//
//  PreferencesItem.swift
//  PreferencesSpellBook
//
//  Created by Steve Sheets on 2/5/21.
//

import Foundation
import Cocoa

/// Preference Item to display in Preference Window.
public struct PreferencesItem {
    
    // MARK: Static Variables
    
    /// List of Preference Items  (used in Preference Windows).
    private static var prefereiceItemList: [PreferencesItem] = []

    /// MARK: Static Variables
    
    private static var preferences: NSWindowController?

    // MARK: Variables

    /// Unique Identifier of Preference
    public var ident: String = ""
    
    /// Name of Preference (to be displayed)
    public var title: String = ""
    
    /// Name of image to display for preference
    public var imageName: String = ""
    
    /// View Controller for preference
    public var viewController: NSViewController?
    
    /// View Controller Size
    public var size: NSSize = .zero
    
    // MARK: Static Functions
    
    /// Add Preference Item to the Window, with various stats.
    public static func addItem(ident: String, title: String, imageName: String, viewController: NSViewController, width: Int, height: Int) {
        var item = PreferencesItem()
        
        item.ident = ident
        item.title = title
        item.imageName = imageName
        item.viewController = viewController
        item.size = NSSize(width: width, height: height)
        
        prefereiceItemList.append(item)
    }
    
    /// Display Preference Window, showing Number item.
    public static func display(ident: String? = nil) {
        let numberItems = PreferencesItem.prefereiceItemList.count
        guard numberItems>0 else { return }
        
        var number:Int? = nil
        if let ident = ident {
            var count = 0
            for item in PreferencesItem.prefereiceItemList {
                if item.ident==ident {
                    number = count
                }
                count = count + 1
            }
        }
        
        if PreferencesItem.preferences == nil {
            let vc = NSTabViewController()
            let w = NSWindow(contentViewController: vc)
            let wc = NSWindowController(window:w)
        
            
            vc.tabStyle = numberItems==1 ? .unspecified : .toolbar
            
            w.styleMask.remove( [ .resizable ] )
            
            for item in PreferencesItem.prefereiceItemList {
                if !item.ident.isEmpty {
                    let tabItem = NSTabViewItem(identifier: item.ident)
                    tabItem.label = item.title
                    tabItem.image = NSImage(named: item.imageName)
                    item.viewController?.title = item.title
                    item.viewController?.preferredContentSize = item.size
                    tabItem.viewController = item.viewController
                    
                    vc.addTabViewItem(tabItem)
                }
            }
            
            let page = number ?? 0
            
            if page>=0, page<vc.tabViewItems.count {
                vc.selectedTabViewItemIndex = page
            }

            preferences = wc
        }
        else {
            if let page = number, let vc = preferences?.contentViewController as? NSTabViewController  {
                vc.selectedTabViewItemIndex = page
            }
        }
        
        preferences?.showWindow(nil)
    }
}

