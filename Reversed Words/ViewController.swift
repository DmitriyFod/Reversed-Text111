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
    @IBAction func segmentConroll(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.view.addSubview(appearLabel)
            appearTextFld.removeFromSuperview()
        }
        else if sender.selectedSegmentIndex == 1 {
            self.view.addSubview(appearTextFld)
            appearLabel.removeFromSuperview()
        }
    }
    @IBOutlet weak var InputText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBAction func ReverseButtonPressed(_ sender: Any) {
        resultLabel.text = reversedWords(sentence: InputText.text!)
    }
    func reversedWords (sentence: String) ->String{
        var newSentence = ""
        let allWords = InputText.text!.components(separatedBy: " ")
        if appearTextFld.text == ""{
        for word in allWords{
            if newSentence != ""{
                newSentence += " "
            }
            let reverseWord = String(word.reversed())
            newSentence += reverseWord
        }
        }else if appearTextFld.text != "" && allWords.contains(appearTextFld.text!){
            for word in allWords{
                if word != appearTextFld.text!{
                    if newSentence != ""{
                        newSentence += " "
                    }
                    let reverseWord = String(word.reversed())
                    newSentence += reverseWord
                }else{
                    newSentence += " "
                    newSentence += appearTextFld.text!
                }
                }
        }
        return newSentence
    }
}
    
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
