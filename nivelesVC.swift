//
//  nivelesVC.swift
//  introMTWDM
//
//  Created by Miguel Gómez Díaz on 03/06/23.
//

import Cocoa

class nivelesVC: NSViewController {
    
    var nivel:String?
    var vidas = 5
    var puntos = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func niveles(_ sender: NSButton) {
        
        if sender.title == "Intermedio"{
            vidas = 3
            puntos = 5
        }else if sender.title == "Avanzado"{
            vidas = 1
            puntos = 10
        }
        
        print(sender.title)
        nivel = sender.title
        performSegue(withIdentifier: "irJuego", sender: self)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "irJuego", let destinationVC = segue.destinationController as? gameVC{
            destinationVC.vidas = vidas
            destinationVC.puntos = puntos
        }
    }
    
}
