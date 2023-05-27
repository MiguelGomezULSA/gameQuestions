//
//  ViewController.swift
//  introMTWDM
//
//  Created by Miguel Gómez Díaz on 20/05/23.
//

import Cocoa

class ViewController: NSViewController {
    

    @IBOutlet weak var entrada:NSTextField!

    @IBOutlet weak var salida: NSTextField!
    
    @IBOutlet weak var btnSaludar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salida.stringValue =  "Bienvenido"
        
        //btnSaludar.isEnabled = false
        
        //btnSaludar.isHidden = true
    }
    
    
    @IBAction func saludar(_ sender: NSButton) {
        
        sender.isEnabled = false
        print(sender.title)
        
        salida.stringValue = "Hola " + entrada.stringValue
        
    }
    
    @IBAction func navegarPS(_ sender: NSButton) {
        performSegue(withIdentifier: "irSegue", sender: self)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "irSegue",
           let destinoVC = segue.destinationController as? performVC{
            
            destinoVC.valor = entrada.stringValue
            
        }
        
        print("Entre al método prepare")
    }
    

}

