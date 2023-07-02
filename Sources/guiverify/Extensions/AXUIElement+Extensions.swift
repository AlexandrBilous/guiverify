//
//  AXUIElement+Extensions.swift
//  
//
//  Created by Oleksandr Bilous on 03.07.2023.
//

import Cocoa
import ApplicationServices

extension AXUIElement {
    var menuBar: AXUIElement? {
        copyElement(element: kAXMenuBarAttribute, type: AXUIElement.self)
    }
    
    var childrens: [AXUIElement] {
        copyElements(element: kAXChildrenAttribute)
    }
    
    var parent: AXUIElement? {
        copyElement(element: kAXParentAttribute, type: AXUIElement.self)
    }
    
    var title: String? {
        copyElement(element: kAXTitleAttribute, type: String.self)
    }
    
    var isMenuBarItem: Bool {
        let foo = copyElement(element: kAXRoleAttribute, type: String.self)
        return foo == "AXMenuBarItem"
    }
    
    var isMenu: Bool {
        let foo = copyElement(element: kAXRoleAttribute, type: String.self)
        return foo == "AXMenu"
    }
    
    var role: String? {
        copyElement(element: kAXRoleAttribute, type: String.self)
    }
    
    func copyElement<T>(element: String, type: T.Type) -> T? {
        var object: AnyObject?
        AXUIElementCopyAttributeValue(self, element as CFString, &object)
        return object as! T?
    }
    
    func copyElements(element: String) -> [AXUIElement] {
        var objects: AnyObject?
        AXUIElementCopyAttributeValue(self, element as CFString, &objects)
        return objects as? [AXUIElement] ?? []
    }
}

// MARK: - Actions

extension AXUIElement {
    func click() {
        AXUIElementPerformAction(self, kAXPressAction as CFString)
    }
}
