//
//  HostingViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/19/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class HostingViewController: UIViewController {
    var places = ["China", "America", "Janpan"]
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var placePicker: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func invitePeople(_ sender: Any) {
        let inviteVC = InvitePeopleViewController()
        self.navigationController?.pushViewController(inviteVC, animated: true)
    }
    
    @IBAction func createAct(_ sender: Any) {
        CSToast.show("Create activity success!", duration: 1.0)
    }
    
}

extension HostingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20.0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return places[row]
    }
    
}
