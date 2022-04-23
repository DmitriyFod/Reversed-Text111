//
//  ViewController.swift
//  Reversed Words
//
//  Created by Admin on 04.04.2022.
//

import UIKit
import Foundation

enum Segments: Int {
    case regular = 0
    case custom = 1
}
class ViewController: UIViewController {
    var appearLabel = UILabel()
    var appearTextFld = UITextField()
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBAction func reverseButtonPressed(_ sender: Any) {
        resultLabel.text = reversedWords(sentence: inputText.text!)
    }
    @IBOutlet weak var segmentControllOutlet: UISegmentedControl!
    @IBAction func segmentConroll(_ sender: UISegmentedControl) {
        guard let mode = Segments(rawValue: segmentControllOutlet.selectedSegmentIndex) else { return }
        switch mode {
        case .regular:
            self.view.addSubview(appearLabel)
            appearTextFld.removeFromSuperview()
        case .custom:
            self.view.addSubview(appearTextFld)
            appearLabel.removeFromSuperview()
        }
    }
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
    func reversedWords (sentence: String)-> String {
        let excludedWord:String? = appearTextFld.text
        guard let excludedWord = excludedWord else {
            return "Its nil"
        }
        
        let resultText = sentence.components(separatedBy: " ") // розділяємо на слова
            .map { str -> String in
                guard str != excludedWord else { return str } // якщо це слвиключення лишаємо цого як є
                var dict = [(Range<String.Index>, Character)]() // це сюди записуємо позицію символа який треба виключити і сам символ
                let arr = str.split { ch in
                    if segmentControllOutlet.selectedSegmentIndex == Segments.custom.rawValue {// якщо не буква – виключення
                        for character in excludedWord {
                            if ch == character {
                                let range = str.range(of: String(ch))!
                                dict.append((range,ch))
                                return true
                            }
                        }
                        return false
                    } else {
                        if !ch.isLetter {
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
}
