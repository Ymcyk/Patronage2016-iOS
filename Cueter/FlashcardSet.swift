//
//  FlashcardSet.swift
//  Cueter
//
//  Created by Piotr Zielinski on 20.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Foundation

/*
 *  FlashcardSet - agregat, klasa zawierająca fiszki. W niej jest informacja
 *  o języku, którego się uczymy.
 */
class FlashcardSet: CustomStringConvertible {
    let wordsTheme: String
    let learningLang: String
    let secondLang: String
    var flashcards: [Flashcard]
    
    init(theme: String, learning: String, known: String,
        words: [Flashcard]? = nil) {
            
            wordsTheme = theme
            learningLang = learning
            secondLang = known
            flashcards = (words != nil) ? words! : []
    }
    
    func addWord(card: Flashcard) -> Bool {
        let addTest = flashcards.contains(card)
        if !addTest {
            flashcards.append(card)
        }
        return !addTest
    }
    
    var description: String {
        
        var polishWordName: String
        
        switch flashcards.count {
        case let number where number == 0 || number > 4:
            polishWordName = "słów"
        case 1:
            polishWordName = "słowo"
        default:
            polishWordName = "słowa"
        }
        return "'\(wordsTheme)', \(learningLang) -> \(secondLang), \(flashcards.count) \(polishWordName)"
    }
}

/*
 *  rozszerzenie SequenceType o metodę, zwracającą elementy nienauczone 
 */
extension SequenceType where Generator.Element: Learnable {
    func nonLearned() -> [Generator.Element] {
        return self.filter({ $0.isLearned == false })
    }
}

/*
 *  rozszerzenie o subscript, można odwoływać się do fiszek po słowie z pierwszej strony
 */
extension FlashcardSet {
    subscript(index: String) -> Flashcard?{
        let element = self.flashcards.filter({$0 == index})
        return element.last
    }
}