//
//  TwoPartJokeVC.swift
//  We Have Jokes
//
//  Created by Kinney Kare on 1/27/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class TwoPartJokeVC: UIViewController {
    
    @IBOutlet weak var theSetup: UILabel!
    @IBOutlet weak var theDelivery: UILabel!
    
    var setup = ""
    var delivery = ""
    
    override func viewDidLoad() {
          super.viewDidLoad()

        theSetup.text = setup
        theDelivery.text = delivery
        
      }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
