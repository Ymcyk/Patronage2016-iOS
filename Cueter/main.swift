//
//  main.swift
//  Cueter
//
//  Created by Piotr Zielinski on 18.01.2016.
//  Copyright © 2016 myApps. All rights reserved.
//

import Cocoa

// Zadanie 2

let stack = FlashcardSet(theme: "Podstawy", learning: "English", known: "Polish")
stack.addWord(Flashcard(firstPage: "Apple", secondPage: "Jabłko", hints: [Hint.Text(text: "Grows on a tree"),
    Hint.Text(text: "You eat it"), Hint.Image(image: NSImage(byReferencingFile: "/Users/Piotr/Pictures/chin.png"), title: "Apple hint")]))

stack.addWord(Flashcard(firstPage: "Dog", secondPage: "Pies", hints: [Hint.Image(image: NSImage(byReferencingFile: "/Users/Piotr/Pictures/chin.png"), title: "Apple hint"), Hint.Music(music: NSSound(contentsOfFile: "/Users/Piotr/phaser/resources/tutorials/04 Advanced TypeScript Projects/assets/title3.mp3", byReference: true), title: nil)]))

debugPrint(stack["Apple"]!)
debugPrint(stack["Dog"]!)

if let bizarre = stack["bizarre"]{
    print(bizarre)
} else {
    print("słowo nie istnieje w zbiorze")
}
