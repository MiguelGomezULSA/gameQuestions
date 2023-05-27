//
//  gameVC.swift
//  introMTWDM
//
//  Created by Miguel Gómez Díaz on 27/05/23.
//

import Cocoa

class gameVC: NSViewController {
    
    var randomIndex:Int?
    
    let questions:[String] = [
        "Is sky blue?",
        "is Air H2O?",
        "is Grass green?",
        "is Miguel Angel a turtle ninja?"
    ]
    
    let answers:[String] = [
        "False",
        "False",
        "True",
        "True"
    ]

    @IBOutlet weak var pregunta: NSTextField!
    
    @IBOutlet weak var trueBtn: NSButton!
    
    @IBOutlet weak var falseBtn: NSButton!
    
    
    @IBOutlet weak var startBtn: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        startGame()
    }
    
    func startGame(){
        pregunta.stringValue = "Welcome, press start for play"
        
        trueBtn.isHidden = true
        falseBtn.isHidden = true
        startBtn.isHidden = false
    }
    
    
    @IBAction func start(_ sender: NSButton) {
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        startBtn.isHidden = true
        
        randomIndex = random(questions.count)
        
        pregunta.stringValue = questions[randomIndex!]
    }
    
    func random(_ len:Int) -> Int {
        return Int.random(in: 0...len-1)
    }
    
    
    @IBAction func responses(_ sender: NSButton) {
        
        if answers[randomIndex!] == sender.title{
            
            print("Correcto")
            
        }
        else{
            print("Incorrecto")
        }
        
        randomIndex = random(questions.count)
        
        pregunta.stringValue = questions[randomIndex!]
        
        
        
    }
    
    
}
