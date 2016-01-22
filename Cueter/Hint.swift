//
//  Hint.swift
//  Cueter
//
//  Created by Piotr Zielinski on 22.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Cocoa

enum Hint {
    case Text(text: String)
    case Image(image: NSImage?, title: String?)
    case Animation(gif: NSBitmapImageRep?, title: String?)
    case Music(music: NSSound?, title: String?)
}

extension Hint: CustomStringConvertible {
    var description: String {
        var desc: String
        
        switch self {
        case let .Text(text):
            desc = "Text hint: \(text)"
        case let .Image(_, optTitle):
            if let title = optTitle {
                desc = "Image hint title: \(title)"
            } else {
                desc = "Image hint without title"
            }
        case let .Animation(_, optTitle):
            if let title = optTitle {
                desc = "Animation hint title: \(title)"
            } else {
                desc = "Animation hint without title"
            }
        case let .Music(_, optTitle):
            if let title = optTitle {
                desc = "Music hint title: \(title)"
            } else {
                desc = "Music hint without title"
            }
        }
    return desc
    }
}

extension Hint: CustomDebugStringConvertible {
    var debugDescription: String {
        var desc: String
        
        switch self {
        case let .Text(text):
            desc = "Text hint: \(text)"
        case let .Image(image, _):
            if let unwrapped = image {
                desc = "Image loaded\nsize: \(unwrapped.size)"
            } else {
                desc = "Image did not loaded"
            }
        default:
            desc = "default"
        }
        return desc
    }
}