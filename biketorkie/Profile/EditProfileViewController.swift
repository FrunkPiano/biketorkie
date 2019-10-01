//
//  EditProfileViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/27/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    var tableView: UITableView!
    var items = ["avatar", "nickname", "introduction", "hobbies"]
    var subItems = ["", "HarrySmith", "New to Brissie!", "Intermidiate"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView = UITableView.init(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100), style: .grouped)
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //获取选择的原图
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
         
        //将选择的图片保存到Document目录下
        let fileManager = FileManager.default
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                .userDomainMask, true)[0] as String
        let filePath = "\(rootPath)/pickedimage.jpg"
        let imageData = pickedImage.jpegData(compressionQuality: 1.0)
        fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
         
        //上传图片
//        if (fileManager.fileExists(atPath: filePath)){
            //取得NSURL
//            let imageURL = URL(fileURLWithPath: filePath)
             
            //使用Alamofire上传
//            Alamofire.upload(imageURL, to: "http://www.hangge.com/upload.php")
//                .responseString { response in
//                    print("Success: \(response.result.isSuccess)")
//                    print("Response String: \(response.result.value ?? "")")
//            }
//        }
         
        //图片控制器退出
        picker.dismiss(animated: true, completion:nil)
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "EditProfileCell")
        }
        cell?.textLabel?.text = items[indexPath.row]
        cell?.detailTextLabel?.text = subItems[indexPath.row]
//        cell?.layoutSubviews()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //判断设置是否支持图片库
                  if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                      //初始化图片控制器
                      let picker = UIImagePickerController()
                      //设置代理
                    picker.delegate = self
                      //指定图片控制器类型
                      picker.sourceType = .photoLibrary
                      //弹出控制器，显示界面
                      self.present(picker, animated: true, completion: {
                          () -> Void in
                      })
                  }else{
                      print("读取相册错误")
                  }
        }else if (indexPath.row == 1) {
            let nameedit = EditTextViewController(title: "NickName")
            nameedit.editClosure = {(name) in
                self.subItems[1] = name
                self.tableView.reloadData()
            }
            self.navigationController?.pushViewController(nameedit, animated: true)
            
        } else if (indexPath.row == 2) {
            let nameedit = EditTextViewController(title: "Introduction")
            nameedit.editClosure = {(name) in
                self.subItems[2] = name
                self.tableView.reloadData()
            }
            self.navigationController?.pushViewController(nameedit, animated: true)
        } else if (indexPath.row == 3) {
            let nameedit = EditTextViewController(title: "Hobby")
            nameedit.editClosure = {(name) in
                self.subItems[3] = name
                self.tableView.reloadData()
            }
            self.navigationController?.pushViewController(nameedit, animated: true)
        }
    }
    
}




