//
//  ViewController.swift
//  Reversed Words
//
//  Created by Admin on 04.04.2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var appearLabel = UILabel()
    var appearTextFld = UITextField()
    override func viewDidLoad(){
        super.viewDidLoad()
        resultLabel.layer.borderWidth = 1.0
        resultLabel.layer.borderColor = UIColor.blue.cgColor
        resultLabel.layer.cornerRadius = 8
        appearLabel.frame =  CGRect(x: 60  , y: 320, width: 400, height: 40)
        appearLabel.text = "All characters except alphabetic symbols"
        appearTextFld.frame = CGRect(x: 60, y: 320, width: 255, height: 34)
        appearTextFld.placeholder = "Text to ignore"
        self.view.addSubview(appearLabel)

    }
    enum segments: Int{
        case Default = 0
        case Custom = 1
    }
    @IBOutlet weak var segmentControllOutlet: UISegmentedControl!
    @IBAction func segmentConroll(_ sender: UISegmentedControl) {
        switch segmentControllOutlet.selectedSegmentIndex {
        case segments.Default.rawValue:
            self.view.addSubview(appearLabel)
            appearTextFld.removeFromSuperview()
        case segments.Custom.rawValue:
            self.view.addSubview(appearTextFld)
            appearLabel.removeFromSuperview()
        default:
            self.view.addSubview(appearLabel)
        }
        }
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBAction func reverseButtonPressed(_ sender: Any) {
        resultLabel.text = reversedWords(sentence: inputText.text!)
    }
    func reversedWords (sentence: String)-> String {
        let excludedWord = appearTextFld.text!
        var resultText = sentence.components(separatedBy: " ") // розділяємо на слова
            .map { str -> String in
                        guard str != excludedWord else { return str } // якщо це слвиключення лишаємо цого як є
                        var dict = [(Range<String.Index>, Character)]() // це сюди записуємо позицію символа який треба виключити і сам символ
                let arr = str.split { ch in
                    if segmentControllOutlet.selectedSegmentIndex == 1{// якщо не буква – виключення
                        for character in excludedWord {
                            if ch == character {
                                        let range = str.range(of: String(ch))!
                                        dict.append((range,ch))
                                        return true
                                    }
                                    return false
                                }
                        }
                        let reversed = arr.map({ String($0.reversed()) }) // перевертаємо сабстрінги
                        var reversedResult = reversed.reversed().joined(separator: "")
                        for (index, character) in dict { // вставляємо на свої місця виключення
                            if index.lowerBound >= reversedResult.endIndex {
                                reversedResult.append(character)
                            } else {
                                reversedResult.insert(character, at: index.lowerBound)
                            }
                        }
                        return reversedResult}.joined(separator: " ")
        return resultText
}
    
    
    
    
//        var newSentence = ""
//        let charSet = CharacterSet(charactersIn: appearTextFld.text!)
//        let allWords = InputText.text!.components(separatedBy: " ")
//        if appearTextFld.text == ""{
//        for word in allWords{
//            if newSentence != ""{
//                newSentence += " "
//            }
//            let reverseWord = String(word.reversed())
//            newSentence += reverseWord
//        }
//        }else if appearTextFld.text != "" && (allWords.description.rangeOfCharacter(from: charSet) != nil){
//            for word in allWords{
//                if word != appearTextFld.text!{
//                    if newSentence != ""{
//                        newSentence += " "
//                    }
//                    let reverseWord = String(word.reversed())
//                    newSentence += reverseWord
//                }else{
//                    if word.description.rangeOfCharacter(from: charSet) != nil {
//                        print("YES")
//
//                    }
//                }
//                }
//        }
//        return newSentence
    

//func reversedWords (sentence: String) ->String{
//    var newSentence = ""
//    let allWords = InputText.text!.components(separatedBy: " ")
//    if appearTextFld.text == ""{
//    for word in allWords{
//        if newSentence != ""{
//            newSentence += " "
//        }
//        let reverseWord = String(word.reversed())
//        newSentence += reverseWord
//    }
//    }else if appearTextFld.text != "" && allWords.contains(appearTextFld.text!){
//        for word in allWords{
//
//            if word != appearTextFld.text!{
//                if newSentence != ""{
//                    newSentence += " "
//                }
//                let reverseWord = String(word.reversed())
//                newSentence += reverseWord
//            }else{
//                newSentence += " "
//                newSentence += appearTextFld.text!
//            }
//            }
//    }
//    return newSentence
//}
//    func reversing (sentence: String)-> String {
//        let allWords = InputText.text!.components(separatedBy: " ")
//        var newSentence = ""
//        var chars = Character(appearTextFld.text!)
//        for index in 0...allWords.count - 1{
//            let word = allWords[index]
//            if word.contains(chars) {
//
//
//            if newSentence != "" {
//                newSentence += " "
//            }
//            let reverseWord = String(word.reversed())
//                newSentence += reverseWord
//            }
//
//        }
//        return newSentence
//    }
//}






//        if InputText.text!.contains(appearTextFld.text!){
//            var exceptionWords = appearTextFld.text!
//            for word in InputText.text!.components(separatedBy: " "){
//                if newSentence != ""{
//                    newSentence += " "
//                }
//                if exceptionWords != InputText.text{
//                    let reverseWord = String(word.reversed())
//                    newSentence += reverseWord
//                }else{
//                    newSentence += exceptionWords
//                }
//            }
//        }
//Reverse String
//func reverse(str:String)->String{
//   var chars = [Character]()
//   for i in (0...str.count).reversed() {
//      let index = str.index(str.startIndex, offsetBy: i)
//      chars.append(str[index])
//   }
//   return String(chars)
//}
}
