//
//  StackOfCards.swift
//  Cueter
//
//  Created by Piotr Zielinski on 20.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Foundation

class FlashcardSet: CustomStringConvertible {
    let wordsTheme: String
    let learningLang: String
    let secondLang: String
    var flashcards: Set<Flashcard>
    
    init(theme: String, learning: String, known: String,
        words: Set<Flashcard>? = nil) {
            
            wordsTheme = theme
            learningLang = learning
            secondLang = known
            flashcards = (words != nil) ? words! : []
    }
    
    func addWord(card: Flashcard) -> Bool {
        let addTest = flashcards.contains(card)
        if !addTest {
            flashcards.insert(card)
        }
        return !addTest
    }
    
    var description: String {
        return "'\(wordsTheme)', \(learningLang) -> \(secondLang), \(flashcards.count) word(s)"
    }
}