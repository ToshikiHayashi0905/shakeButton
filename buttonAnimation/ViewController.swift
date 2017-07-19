//
//  ViewController.swift
//  buttonAnimation
//
//  Created by 林 利樹 on 2017/07/18.
//  Copyright © 2017年 林 利樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: shakeButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myButton.startShakeAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

