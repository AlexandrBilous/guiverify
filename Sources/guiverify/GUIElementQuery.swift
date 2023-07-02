//
//  GUIElementQuery.swift
//  
//
//  Created by Oleksandr Bilous on 03.07.2023.
//

import Cocoa
import ApplicationServices

public final class GUIElementQuery {
    private let uiElements: [GUIElement]
    
    public init(uiElements: [GUIElement]) {
        self.uiElements = uiElements
    }
    
    public var firstMatch: GUIElement {
        uiElements[0]
    }
    
    public subscript(_ identifier: String) -> GUIElement {
        uiElements.first { $0.title == identifier }!
    }
}
