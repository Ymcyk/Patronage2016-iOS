//
//  Flashcard.swift
//  Cueter
//
//  Created by Piotr Zielinski on 18.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Foundation

// typealias, bo w przyszłości można by dodać np.: synonimy
// a Word byłby strukturą
public typealias Word = String

/*
 *  Klasa fiszek
 */
class Flashcard: CustomStringConvertible, Equatable {
    
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
                return String(hint)
            })
            
            strBuild += " [\(strTemp.joinWithSeparator(", "))]"
        }
        strBuild += (isLearned) ? " \u{2714}" : " \u{2718}"
        return strBuild
    }
    
}

// przeładowanie operatorów
func ==(lhs: Flashcard, rhs: Flashcard) -> Bool {
    return lhs.firstPage == rhs.firstPage
}

func ==(lhs: Flashcard, rhs: String) -> Bool {
    return lhs.firstPage == rhs
}

extension Flashcard: CustomDebugStringConvertible {
    var debugDescription: String {
        var strBuild = "\(firstPage) -> \(secondPage)\n"
        if let hintString = hints {
            let strTemp = hintString.map({ (hint) -> String in
                return "\(hint.debugDescription)"
            })
            strBuild += strTemp.joinWithSeparator("\n")
        }
        return strBuild
    }
}
