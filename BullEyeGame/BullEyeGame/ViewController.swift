      //
//  ViewController.swift
//  BullEyeGame
//
//  Created by wen zhang on 2017/5/8.
//  Copyright © 2017年 wen zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitMeAction(_ sender: UIButton) {
    
        let alertVC = UIAlertController.init(title: "Hello, World", message: "This is my first app!", preferredStyle: UIAlertControllerStyle.alert)
        alertVC.addAction(UIAlertAction.init(title: "Awesome", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
            
        }))
        self.present(alertVC, animated: true) { 
            
        }

    }

}

