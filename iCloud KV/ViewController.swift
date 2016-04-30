//
//  ViewController.swift
//  iCloud KV - kahnita, catalitique, calitique, talique
//
//  Created by Brian Hill on 4/30/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uuidTextField: UITextField! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uuidString = getUUIDString()
        uuidTextField.text = uuidString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

