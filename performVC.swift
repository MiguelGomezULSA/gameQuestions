import Cocoa

class performVC: NSViewController {
    
    var valor: String?
    
    @IBOutlet weak var imagen: NSImageView!
    
    let imagenes:[String] = ["paisaje", "paisaje2"]

    @IBOutlet weak var etiqueta: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        etiqueta.stringValue = valor ?? "No enviaste valor"
        imagen.image = NSImage(named: imagenes[Int.random(in: 0...imagenes.count-1)])
    }
    
}
