//
//  SinglePartJokeVC.swift
//  We Have Jokes
//
//  Created by Kinney Kare on 1/27/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class SinglePartJokeVC: UIViewController {

    @IBOutlet weak var theJoke: UILabel!
   
    var joke = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        theJoke.text = joke
    }
}
