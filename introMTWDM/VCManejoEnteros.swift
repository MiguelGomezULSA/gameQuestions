import Cocoa

class VCManejoEnteros: NSViewController {
    
    
    @IBOutlet weak var operando1: NSTextField!
    
    @IBOutlet weak var operando2: NSTextField!
    
    @IBAction func btnCalcular(_ sender: NSButton) {
        //TODO
        
    }
    
    
    @IBOutlet weak var tfResult: NSTextField!
    
    func calcular(_ a:Int, _ b:Int) -> (resta: Int, suma:Int) {
        
        let resta = a - b
        let suma =  a + b
        
        return (resta, suma)
    }
    
}
