//
//  main.swift
//  Cueter
//
//  Created by Piotr Zielinski on 18.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Foundation

// Zadanie 1

let firstWord = Flashcard(firstPage: "Card", secondPage: "Kartka",
    hints: ["Page", "Leaf", "You write on it"])
let secondWord = Flashcard(firstPage: "Dog", secondPage: "Pies")
let thirdWord = Flashcard()

print(firstWord)
print(secondWord)
print(thirdWord)

/*
let stack = FlashcardSet(theme: "Podstawy", learning: "English", known: "Polish")
stack.addWord(Flashcard(firstPage: "Home", secondPage: "Dom", hints: ["House", "Place where you live"]))
stack.addWord(Flashcard(firstPage: "Dog", secondPage: "Pies"))

print(stack)

*/