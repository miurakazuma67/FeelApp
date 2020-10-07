//
//  inputViewController.swift
//  FeelApp
//
//  Created by 三浦　一真 on 2020/09/22.
//

import UIKit
import RealmSwift

class EmojiTextField: UITextField {
    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}

class InputViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var feelingTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let realm = try! Realm()
    var feel: Feel!
    let maxLength: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        titleTextField.text = feel.title
        feelingTextField.text = feel.feeling
        datePicker.date = feel.date
        
        // ターゲット設定の処理を追加
                feelingTextField.addTarget(self, action: #selector(textFieldEditingChanged(textField:)), for: .editingChanged)
    }
    @objc func textFieldEditingChanged(textField: UITextField) {
           guard let text = textField.text else { return }
           textField.text = String(text.prefix(maxLength))
       }
    
    
    // 追加する
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.feel.title = self.titleTextField.text!
            self.feel.feeling = self.feelingTextField.text!
            self.feel.date = self.datePicker.date
            self.realm.add(self.feel, update: .modified)
        }
        
        super.viewWillDisappear(animated)
    }
    @objc func dismissKeyboard(){
        
        
        // キーボードを閉じる
        view.endEditing(true)
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
