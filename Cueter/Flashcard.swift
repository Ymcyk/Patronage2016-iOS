//
//  Flashcard.swift
//  Cueter
//
//  Created by Piotr Zielinski on 18.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Foundation

public typealias Word = String

class Flashcard: CustomStringConvertible, Hashable {
    
    var firstPage: Word
    var secondPage: Word
    var isLearned = false
    var hints: [Hint]?
    
    init(firstPage: Word, secondPage: Word, hints: [Hint]? = nil) {
        self.firstPage = firstPage
        self.secondPage = secondPage
        self.hints = hints
    }
    
    convenience init() {
        self.init(firstPage: "[none]", secondPage: "[none]")
    }
    
    var description: String {
        var strBuild = "\(firstPage) -> \(secondPage)"
        if let hintString = hints {
            
            let strTemp = hintString.map({ (hint) -> String in
                return hint.description
            })
            //let strTemp = hintString.joinWithSeparator(", ")
            strBuild += " [\(strTemp.joinWithSeparator(", "))]"
        }
        strBuild += (isLearned) ? " \u{2714}" : " \u{2718}"
        return strBuild
    }
    
    var hashValue: Int {
        get {
            return firstPage.lowercaseString.hash
        }
    }
}

func ==(lhs: Flashcard, rhs: Flashcard) -> Bool {
    return lhs.firstPage == rhs.secondPage
}