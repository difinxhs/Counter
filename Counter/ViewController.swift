//
//  ViewController.swift
//  Counter
//
//  Created by Alex Sacopini on 24.4.24..
//

import UIKit
import Foundation

class ViewController: UIViewController {

  
   
  
    @IBOutlet weak var buttonAddOne: UIButton!
    
    @IBOutlet weak var buttonRemoveOne: UIButton!
    
    @IBOutlet weak var counterLable: UILabel!
    
    @IBOutlet weak var buttonClear: UIButton!
    
    @IBOutlet weak var changeHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonAddOne.setImage(UIImage(systemName: "plus"), for: .normal)
        buttonAddOne.setTitle("", for: .normal)
        buttonAddOne.backgroundColor = .red
        
        buttonRemoveOne.setImage(UIImage(systemName: "minus"), for: .normal)
        buttonRemoveOne.setTitle("", for: .normal)
        buttonRemoveOne.backgroundColor = .blue
        
        counterLable.text = "Значение счетчика: 0"
        
        buttonClear.setImage(UIImage(systemName: "trash"), for: .normal)
        buttonClear.setTitle("", for: .normal)
        
        changeHistory.text = "История изменений:"
        
    }
    
    private var counter: Int = 0
    
  
    
    var dateFormatter = DateFormatter()
    var date = Date()
    
    var changeHistoryArray: [String] = ["История изменений: \n"]
    
    func currentDate () -> String {
        
        let dateToday = Date()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let dateToday1 = dateFormatter.string(from: dateToday)
        
        return dateToday1
    }
    
    
    @IBAction func buttonAddOneDidTap(_ sender: Any) {
        counter += 1
        counterLable.text = "Значение счетчика: \(counter)"
      
        let actionDate = currentDate()
        changeHistoryArray.append("\(actionDate): Значение изменено на +1 \n")
        changeHistory.text = changeHistoryArray.joined()
        
        let range = NSMakeRange(changeHistory.text.count - 1, 0)
        changeHistory.scrollRangeToVisible(range)
    }
    
    @IBAction func buttonRemoveOneDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLable.text = "Значение счетчика: \(counter)"
            
            let actionDate = currentDate()
            changeHistoryArray.append("\(actionDate): Значение изменено на -1 \n")
            changeHistory.text = changeHistoryArray.joined()
            
            let range = NSMakeRange(changeHistory.text.count - 1, 0)
            changeHistory.scrollRangeToVisible(range)
            
        } else {
            counterLable.text = "Значение счетчика: 0"
          
            let actionDate = currentDate()
            changeHistoryArray.append("\(actionDate): Попытка уменьшить значение счетчика ниже 0 \n")
            changeHistory.text = changeHistoryArray.joined()
            
            let range = NSMakeRange(changeHistory.text.count - 1, 0)
            changeHistory.scrollRangeToVisible(range)
        }
    }
    
    @IBAction func buttonClearDidTap(_ sender: Any) {
        counter = 0
        counterLable.text = "Значение счетчика: \(counter)"
      
        let actionDate = currentDate()
        changeHistoryArray.append("\(actionDate): Значение сброшено \n")
        changeHistory.text = changeHistoryArray.joined()
        
        let range = NSMakeRange(changeHistory.text.count - 1, 0)
        changeHistory.scrollRangeToVisible(range)
    }
    
    


}

