//
//  ViewController.swift
//  User Defaults Class
//
//  Created by apple on 06/10/22.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource
{
    var countryArray:[String] = ["INDIA","USA","CHINA","RUSSIA","NORWAY","SWEDEN","SRILANKA","BHUTAN","NEPAL","BRUNEI","AUSTRALIA","JAPAN"]
    
    @IBOutlet weak var button: UIButton!
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var selectLabel: UILabel!
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        pickerView.backgroundColor = .white
        pickerView.layer.cornerRadius = 20
        
       // pickerView.isHidden = true
       // toolbar.isHidden = true
       pickerView.delegate = self
       pickerView.dataSource = self
        
        // to show last choosen data in label app opened again
       
        selectLabel.text = UserDefaults.standard.value(forKey: "country")  as? String
}
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
   
    
    @IBAction func actionChoose(_ sender: Any) {
        selectLabel.text = countryArray[pickerView.selectedRow(inComponent: (0))]
        
        // value saved choosen last time
        UserDefaults.standard.set(selectLabel.text!, forKey: "country")
        
        
        
       // pickerView.isHidden = true
       //  toolbar.isHidden = true
    }
    
}

