//
//  ViewController.swift
//  dynamic-app2
//
//  Created by Fernanda De León on 30/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTipoCambio: UITextField!
    @IBOutlet weak var tfPesos: UITextField!
    @IBOutlet weak var tfDolares: UITextField!
    @IBOutlet weak var logoEmpresa: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoEmpresa.image = UIImage(named: "dollarSign")
        // Do any additional setup after loading the view.
    }

    @IBAction func calcula(_ sender: UIButton) {
        if let tipoCambio = Double(tfTipoCambio.text!),
            let pesos = Double(tfPesos.text!) {
                let dolares = pesos / tipoCambio
                tfDolares.text = "\(dolares)"
        } else {
            let alerta = UIAlertController(title: "Error", message: "Debes teclear datos numericos", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alerta, animated: true)
        }
    }
    
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
}

