//
//  Hint.swift
//  Cueter
//
//  Created by Piotr Zielinski on 22.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Cocoa

/*
 *  Hint - enumerator podpowiedzi
 */
enum Hint {
    case Text(text: String)
    case Image(image: NSImage?, title: String?)
    case Animation(gif: NSBitmapImageRep?, title: String?)
    case Music(music: NSSound?, title: String?)
}

// rozszerzenie do enumeratora o wymagane protokoły
extension Hint: CustomStringConvertible {
    var description: String {
        
        var desc: String
        
        switch self {
        case let .Text(text):
            desc = "Tekst: \(text)"
        case let .Image(_, optTitle):
            if let title = optTitle {
                desc = "\u{1f4f7} Obrazek: \(title)"
            } else {
                desc = "\u{1f4f7} Obrazek bez tytułu"
            }
        case let .Animation(_, optTitle):
            if let title = optTitle {
                desc = "\u{26f9} Animacja: \(title)"
            } else {
                desc = "\u{26f9} Animacja bez tytułu"
            }
        case let .Music(_, optTitle):
            if let title = optTitle {
                desc = "\u{266c} Muzyka: \(title)"
            } else {
                desc = "\u{266c} Muzyka bez tytułu"
            }
        }
    return desc
    }
}

extension Hint: CustomDebugStringConvertible {
    var debugDescription: String {
        var desc: String
        var fileTitle = ""
        
        switch self {
        case let .Text(text):
            desc = "Tekst: \(text)\n\t- długość: \(text.characters.count)"
        case let .Image(image, title):
            fileTitle = (title != nil) ? "\"\(title!)\" " : "";
            if let unwrapped = image {
                desc = "Obraz \(fileTitle)wczytany\n\t- rozmiar: \(unwrapped.size)"
            } else {
                desc = "Obraz \(fileTitle)nie został wczytany"
            }
        case let .Animation(animation, title):
            fileTitle = (title != nil) ? "\"\(title!)\" " : "";
            if let unwrapped = animation {
                desc = "Animacja \(fileTitle)wczytana\n\t- rozmiar: \(unwrapped.size)";
            } else {
                desc = "Animacja \(fileTitle)nie została wczytana";
            }
        case let .Music(music, title):
            fileTitle = (title != nil) ? "\"\(title!)\" " : "";
            if let unwrapped = music {
                desc = "Plik muzyczny \(fileTitle)wczytany\n\t- czas: \(unwrapped.duration)";
            } else {
                desc = "Plik muzyczny \(fileTitle)nie został wczytany";
            }
        }
        return desc
    }
}
