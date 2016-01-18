//
//  Flashcard.swift
//  Cueter
//
//  Created by Piotr Zielinski on 18.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Foundation

public typealias Word = String

class Flashcard: CustomStringConvertible {
    
    var firstPage: Word
    var secondPage: Word
    var isLearned = false
    var hints: [String]?
    
    init(first: Word, second: Word, hints: [String]? = nil) {
        firstPage = first
        secondPage = second
        self.hints = hints
    }
    
    convenience init() {
        self.init(first: "[none]", second: "[none]")
    }
    
    var description: String {
        var strBuild = "\(firstPage) -> \(secondPage)"
        if let hintString = hints {
            let strTemp = hintString.joinWithSeparator(", ")
            strBuild += " [\(strTemp)]"
        }
        return strBuild
    }
}
