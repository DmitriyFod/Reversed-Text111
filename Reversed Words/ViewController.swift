//
//  ViewController.swift
//  Reversed Words
//
//  Created by Admin on 04.04.2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        resultLabel.layer.borderWidth = 1.0
        resultLabel.layer.borderColor = UIColor.blue.cgColor
        resultLabel.layer.cornerRadius = 8
    }
    @IBOutlet weak var InputText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBAction func ReverseButtonPressed(_ sender: Any) {
        resultLabel.text = ReversedWords(sentence: (InputText.text!))
    }
    func ReversedWords (sentence: String) ->String{
        var newSentence = ""
        let allWords = InputText.text!.components(separatedBy: " ")
        for word in allWords{
            if newSentence != ""{
                newSentence += " "
            }
            let reverseWord = String(word.reversed())
            newSentence += reverseWord
        }
                
        return newSentence
    }
}

