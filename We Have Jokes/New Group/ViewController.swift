//
//  ViewController.swift
//  We Have Jokes
//
//  Created by Kinney Kare on 1/26/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var pickerView: UIPickerView!
    var pickerData: [String] = [String]()
    var category = ""
    var theType = ""
    var theSetup = ""
    var theDelivery = ""
    var theJoke = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerData = ["Any", "Miscellaneous", "Programming", "Dark"]
        // Do any additional setup after loading the view.
    }
    
    //Number of colums of data in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of Rows in PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        category = pickerData[row]
        return pickerData[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onepart"  {
            let vc = segue.destination as! SinglePartJokeVC
            vc.joke = theJoke
        } else {
            let vc = segue.destination as! TwoPartJokeVC
            vc.delivery = theDelivery
            vc.setup = theSetup
        }
    }
    
    @IBAction func getJokePressed(_ sender: Any) {
        
        // (1) Request & Session
        // (2) Response & Data
        // (3) Parsing & JSON Serialization
        
        // (1)
        let url = URL(string: "https://sv443.net/jokeapi/category/\(category)")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                // (2)
                if data != nil {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            
                            if let types = jsonResult["type"] {
                                self.theType = types as! String
                                print(types)
                                
                                if self.theType == "single" {
                                    self.theJoke = jsonResult["joke"] as! String
                                    self.performSegue(withIdentifier: "onepart", sender: self)
                                    print(self.theJoke)
                                }
                                if self.theType == "twopart" {
                                    self.theSetup = jsonResult["setup"] as! String
                                    self.theDelivery = jsonResult["delivery"] as! String
                                    self.performSegue(withIdentifier: "twopart", sender: self)
                                    print(self.theSetup, self.theDelivery)
                                }
                            }
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
}



