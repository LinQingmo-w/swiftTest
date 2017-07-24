//
//  ViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/14.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataArr:[String]?
    var tableView : UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dataArr = ["基础部分"," 函数","闭包","枚举","类和结构体","属性","方法","下标","继承","构造过程","析构过程","自动引用计数","可选链","错误处理","嵌套类型","扩展","协议","泛型","访问控制","高级运算符"]
        self.tableView = UITableView.init(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        
    }
    //MARK: - delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iderntify:String = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: iderntify)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: iderntify)
        }
        cell?.textLabel?.text = self.dataArr?[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataArr?.count)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
              self.navigationController?.pushViewController(BaseLanguageViewController(nibName: nil, bundle: nil), animated: true)
        case 1:
            self.navigationController?.pushViewController(FunctionViewController(), animated: true)
            
        case 2:
            self.navigationController?.pushViewController(BlockTestViewController(), animated: true)
            
        case 3:
            self.navigationController?.pushViewController(EnumViewController(), animated: true)
            
        case 4:
            self.navigationController?.pushViewController(ClassViewController(), animated: true)
            
        default:
            break
            
        }
       
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

