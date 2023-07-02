//
//  GUIElement.swift
//  
//
//  Created by Oleksandr Bilous on 03.07.2023.
//

import Cocoa
import ApplicationServices

public final class GUIElement {
    private let uiElement: AXUIElement
    
    public init(uiElement: AXUIElement) {
        self.uiElement = uiElement
    }
    
    public var menuBars: GUIElementQuery {
        let elements = uiElement.childrens.filter { $0.role == "AXMenuBar" }.map { GUIElement(uiElement:$0) }
        return GUIElementQuery(uiElements: elements)
    }
    
    public var menuBarItems: GUIElementQuery {
        let elements = uiElement.childrens.filter { $0.role == "AXMenuBarItem" }.map { GUIElement(uiElement:$0) }
        return GUIElementQuery(uiElements: elements)
    }
    
    public var menus: GUIElementQuery {
        let elements = uiElement.childrens.filter { $0.role == "AXMenu" }.map { GUIElement(uiElement:$0) }
        return GUIElementQuery(uiElements: elements)
    }
    
    public var menuItems: GUIElementQuery {
        let elements = uiElement.childrens.filter { $0.role == "AXMenuItem" }.map { GUIElement(uiElement:$0) }
        return GUIElementQuery(uiElements: elements)
    }
}

// MARK: - Actions

extension GUIElement {
    public func click() {
        uiElement.click()
    }
}

// MARK: - Properties

extension GUIElement {
    public var title: String? {
        uiElement.title
    }
}
