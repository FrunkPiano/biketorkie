//
//  EditTextViewController.swift
//  biketorkie
//
//  Created by Millow on 2019/9/30.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class EditTextViewController: UIViewController {
    var introTitle = ""
    var editClosure: ((String) -> Void)?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var introLabel: UILabel!
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.introTitle = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        introLabel.text = introTitle
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .done, target: self, action: #selector(saveEdit))
        // Do any additional setup after loading the view.
    }
    
    @objc func saveEdit() {
        if let closure = self.editClosure {
            closure(textField.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }
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
