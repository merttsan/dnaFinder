import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var allTextLabel: UITextField!
    @IBOutlet weak var searchTextLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var atgcLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    // temel değişkenler
    var allString = ""
    var someString = ""
    var someStringValue = -1
    var dnaArray = [0,0,0,0]
    var alertInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
        atgcLabel.isHidden = true
        errorLabel.isHidden = true
        errorLabel.text = ""
    }
    
    @IBAction func findButton(_ sender: Any) {
        
        if let allString = (allTextLabel.text) {
            if let searchString = (searchTextLabel.text) {
                let allString = allString.uppercased()
                let searchString = searchString.uppercased()
                for _ in allString.components(separatedBy: "\(searchString)"){
                    someStringValue += 1
                }
                resultLabel.text = "Bulunan Dizi = \(someStringValue)"
                for i in allString {
                    if i == "A" {dnaArray[0] += 1}
                    else if i == "T" {dnaArray[1] += 1}
                    else if i == "G" {dnaArray[2] += 1}
                    else if i == "C" {dnaArray[3] += 1}
                    else {
                        alertInt += 1
                        errorLabel.text = "Hatalı Karakter Sayısı: \(alertInt)"
                    }
                }
            }
        }
        else {
            errorLabel.text = "Bilinmeyen Hata"
        }
        self.alert()
        
        atgcLabel.text = "A: \(dnaArray[0])   T: \(dnaArray[1])   G: \(dnaArray[2])   C: \(dnaArray[3])"
        
        // buton işlevini yerine getirince aynı zamanda hafızayı sıfırlasın
        dnaArray = [0,0,0,0]
        alertInt = 0
        someStringValue = -1
        resultLabel.isHidden = false
        atgcLabel.isHidden = false
        errorLabel.isHidden = false
    }
    
    
    @objc func alert() {
        let alert = UIAlertController(title: "Sonuç", message: "Bulunan Dizi : \(someStringValue)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
        let copyButton = UIAlertAction(title: "Copy", style: UIAlertAction.Style.default) { UIAlertAction
            in
            UIPasteboard.general.string = self.resultLabel.text
        }
        alert.addAction(copyButton)
    }
    
}
