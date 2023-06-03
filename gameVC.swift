// Básico (V=5, A= 3)
// Intermedio (V= 3 A= 5)
// Avanzado (V = 1  A = 10)

import Cocoa

class gameVC: NSViewController {
    
    var nivel:String?
    
    var puntos:Int!;
    var vidas:Int!;
    
    var vidasR:Int = 0
    
    var puntosObt:Int = 0
    
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
        print(nivel ?? "")
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
        
        reset()
        
        vidasR = vidas
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        startBtn.isHidden = true
        puntoslbl.isHidden = false
        vidaslbl.isHidden = false
        
        vidaslbl.stringValue = "Vidas: \(vidasR)"
        puntoslbl.stringValue = "Puntos: 0"
        
        randomIndex = random(questions.count)
        
        pregunta.stringValue = questions[randomIndex!]
    }
    
    func random(_ len:Int) -> Int {
        return Int.random(in: 0...len-1)
    }
    
    
    @IBAction func responses(_ sender: NSButton) {
        
        
        
        if answers[randomIndex!] == sender.title{
            
            print("Correcto")
            puntosObt += 1
            puntoslbl.stringValue = "Puntos: \(puntosObt)"
            if puntosObt == puntos{
                print("GANÓ")
            }
        }
        else{
            print("Incorrecto")
            vidasR -= 1
            vidaslbl.stringValue = "Vidas: \(vidasR)"
            if vidasR <= 0{
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
    
    func reset(){
        vidasR = vidas
        puntosObt = 0
    }
    
    
    
}
