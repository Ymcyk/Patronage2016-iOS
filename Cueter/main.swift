//
//  main.swift
//  Cueter
//
//  Created by Piotr Zielinski on 18.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Cocoa

/*
 *  Funkcja zwracająca listę elementów nienauczonych
 */
func nonLearned(learnArray: [Learnable]) -> [Learnable] {
    return learnArray.filter({ $0.isLearned == false })
}

// Zadanie 3

let stack = FlashcardSet(theme: "Podstawy", learning: "English", known: "Polish")
stack.addWord(Flashcard(firstPage: "Apple", secondPage: "Jabłko", hints: [Hint.Text(text: "Grows on a tree"),
    Hint.Text(text: "You eat it"), Hint.Image(image: NSImage(named: "data/apple.png"), title: "Apple image")]))

stack.addWord(Flashcard(firstPage: "Dog", secondPage: "Pies", hints: [Hint.Image(image: NSImage(named: "data/dog.png"), title: "Dog image"), Hint.Music(music: NSSound(contentsOfFile: "woowwoow.mp3", byReference: true), title: "Dog barking")]))

stack.addWord(Flashcard(firstPage: "Home", secondPage: "Dom"))
stack.addWord(Flashcard(firstPage: "Pen", secondPage: "Długopis"))
stack["Pen"]?.isLearned = true

print(stack["Apple"]!)
print(stack["Dog"]!)

print("")
debugPrint(stack["Apple"]!)
print("")
debugPrint(stack["Dog"]!)

print("")
// zwraca listę nienauczonych elementów
let nonLeraned = stack.flashcards.nonLearned()

for element in nonLeraned {
    print(element)
}

