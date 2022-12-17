import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var allTextLabel: UITextField!
    @IBOutlet weak var searchTextLabel: UITextField!
    var allString = ""
    var someString = ""
    var someStringValue = -1
    var dnaArray = [0,0,0,0]
    var alertInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findButton(_ sender: Any) {
        
        if let allString = (allTextLabel.text) {
            if let searchString = (searchTextLabel.text) {
                let allString = allString.uppercased()
                let searchString = searchString.uppercased()
                for _ in allString.components(separatedBy: "\(searchString)"){
                    someStringValue += 1
                }
                for i in allString {
                    if i == "A" {dnaArray[0] += 1}
                    else if i == "T" {dnaArray[1] += 1}
                    else if i == "G" {dnaArray[2] += 1}
                    else if i == "C" {dnaArray[3] += 1}
                    else {
                        alertInt += 1
                    }
                }
            }
        }
        else {
            alert()
        }
        secondVCfunc()
    }
    
    @objc func secondVCfunc () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        vc.modalPresentationStyle = .popover
        vc.dnaArrayVC = dnaArray
        vc.errorVC = alertInt
        vc.someStringValueVC = someStringValue
        present(vc , animated: true)
        
        dnaArray = [0,0,0,0]
        alertInt = 0
        someStringValue = -1
    }
    
    @objc func alert() {
        let alert = UIAlertController(title: "Sonuç", message: "Bulunan Dizi : \(someStringValue)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
        let copyButton = UIAlertAction(title: "Copy", style: UIAlertAction.Style.default) { UIAlertAction
            in
            UIPasteboard.general.string = String(self.someStringValue)
        }
        alert.addAction(copyButton)
    }
    
}
