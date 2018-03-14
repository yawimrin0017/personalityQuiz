//
//  ViewController.swift
//  personalityQuiz
//
//  Created by Yacoub Awimrin on 3/1/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
// word

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func beginButtonPushed(_ sender: UIButton) {
        performSegue(withIdentifier: "initialSegue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

