//
//  SettingsViewController.swift
//  Notificacoes
//
//  Created by Usuário Convidado on 3/18/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swSound: UISwitch!
    @IBOutlet weak var scColor: UISegmentedControl!
    @IBOutlet weak var tfName: UITextField!
    
    var ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        swSound.isOn = ud.bool(forKey: "sound")
        scColor.selectedSegmentIndex = ud.integer(forKey: "color")
        tfName.text = ud.string(forKey: "name")
        
    }
    
    @IBAction func changeSound(_ sender: UISwitch) {
        
        ud.set(sender.isOn, forKey: "sound")
        ud.synchronize()
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        ud.set(sender.selectedSegmentIndex, forKey: "color")
    
    }
   

}

extension SettingsViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        ud.set(textField.text, forKey: "name")
        view.endEditing(true)
        return true
    }
}


