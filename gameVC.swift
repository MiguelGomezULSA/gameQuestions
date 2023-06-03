// Básico (V=5, A= 3)
// Intermedio (V= 3 A= 5)
// Avanzado (V = 1  A = 10)

import Cocoa

class gameVC: NSViewController {
    
    var puntos:Int = 0;
    var vidas:Int = 5;
    
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
    
    @IBOutlet weak var puntoslbl: NSTextField!
    
    @IBOutlet weak var vidaslbl: NSTextField!
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
        puntoslbl.isHidden = true
        vidaslbl.isHidden = true
    }
    
    
    @IBAction func start(_ sender: NSButton) {
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        startBtn.isHidden = true
        puntoslbl.isHidden = false
        vidaslbl.isHidden = false
        
        randomIndex = random(questions.count)
        
        pregunta.stringValue = questions[randomIndex!]
    }
    
    func random(_ len:Int) -> Int {
        return Int.random(in: 0...len-1)
    }
    
    
    @IBAction func responses(_ sender: NSButton) {
        
        if answers[randomIndex!] == sender.title{
            
            print("Correcto")
            puntos += 1
            puntoslbl.stringValue = "Puntos: \(puntos)"
            
        }
        else{
            print("Incorrecto")
            vidas -= 1
            vidaslbl.stringValue = "Vidas: \(vidas)"
            if vidas <= 0{
                trueBtn.isHidden = true
                falseBtn.isHidden = true
                pregunta.stringValue = "Game Over"
                startBtn.isHidden = false
                return
            }
        }
        
        randomIndex = random(questions.count)
        
        pregunta.stringValue = questions[randomIndex!]
        
        
        
    }
    
    
}
