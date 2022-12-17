//
//  secondVC.swift
//  dnaFinder
//
//  Created by Mert Şan on 16.12.2022.
//

import UIKit
class secondVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var atgcLable: UILabel!
    var errorVC = 0
    var someStringValueVC = 0
    var dnaArrayVC = [0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atgcLable.text = "A: \(dnaArrayVC[0])   T: \(dnaArrayVC[1])   G: \(dnaArrayVC[2])   C: \(dnaArrayVC[3])"
        errorLabel.text = "Hatalı Karakter: \(errorVC)"
        resultLabel.text = "Eşleşen Arama: \(someStringValueVC)"
        
        let twoTapped = UITapGestureRecognizer(target: self, action: #selector(tTapped(_:)))
        twoTapped.numberOfTapsRequired = 1
        twoTapped.numberOfTouchesRequired = 1
        resultLabel.isUserInteractionEnabled = true
        errorLabel.isUserInteractionEnabled = true
        atgcLable.isUserInteractionEnabled = true
        resultLabel.addGestureRecognizer(twoTapped)
        atgcLable.addGestureRecognizer(twoTapped)
        errorLabel.addGestureRecognizer(twoTapped)

    }
    
    @objc func tTapped (_ gesture: UITapGestureRecognizer) {
        UIPasteboard.general.string = String(self.someStringValueVC) + " Adet eşleşme bulundu."
    }
}
