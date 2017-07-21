//
//  Block2ViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/20.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class Block2ViewController: UIViewController {

    var myCount : Int? = nil
    
    //block传值
    typealias MyBlock = (String) -> ()
    var myBlock : MyBlock?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.cyan
        
        print(myCount ?? "nil")
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc private func buttonClick()  {
        
        myBlock?("myString \(myCount!)")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
