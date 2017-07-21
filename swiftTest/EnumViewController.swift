//
//  EnumViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/21.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class EnumViewController: UIViewController {
    
    //基础写法 - 没有默认值
    enum myEnum {
        case north
        case south
        case east
        case west
    }
    
    //省事写法
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    //关联值
    enum BarCode {
        case upc(Int, Int)
        case qrCode(String)
    }

    //原始值 //需要制定类型
    enum yourChoose : String{
        case he = "likeYou"
        case me = "youLike"
        case you = "chooseWho"
    }
    
    //默认原始值
    enum countList : Int {
        case one = 1,two,three
    }
    
    //递归枚举
    enum diguiou {
        case nem(Int)
        indirect case addition(diguiou,diguiou)
        indirect case mltiplication(diguiou,diguiou)
    }
    
    indirect enum diguiou2 {
        case nem(Int)
        case addition(diguiou2,diguiou2)
        case mltiplication(diguiou2,diguiou2)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        
        let lala = myEnum.east
        print(lala)
        
        let star = Planet.jupiter
        switch star {
        case .earth , .mercury , .mars:
            print("1")
        default:
            print("2")
        }
        
        let myCode = BarCode.upc(2, 345)
        
        switch myCode {
        case .upc(let a, let B):
            print( "isUPC  ", a , B)
            
        case .qrCode(let str):
            print("myString \(str)")
        default:
            print("nono")
        }
        
        print(isTrue(code: BarCode.qrCode("qqqqq")))
        print(isTrue(code: BarCode.qrCode("qqqqqwww")))
        print(isTrue(code: BarCode.upc(2, 3)))
        print(isTrue(code: BarCode.upc(4, 5)))
        
        let mm : yourChoose? = yourChoose(rawValue: "youLike")
        print(mm  ?? "noValue")
        
        print(mm  ?? "noValue" , yourChoose.he.rawValue)//rawValue 取值的
        
       let myChoose =  yourChoose(rawValue: "youLike")//可选类型 可能有值  可能没有值
        print(myChoose ?? "noValue")
      
        
        let five = diguiou.nem(5)
        let four = diguiou.nem(4)
        let sum = diguiou.addition(five, four)
        let pro = diguiou.mltiplication(five, four)
        print("sum", sum,"pro",pro)
//        该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。
        print("expression \(evaluate(pro))")
    }
    //用递归函数调用递归枚举
    func evaluate(_ expression: diguiou) -> Int {
        switch expression {
        case let .nem(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .mltiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }
    
    func isTrue(code : BarCode) -> Bool {
        switch code {
        case .upc(let a, _):
            return a == 2 ? true : false
            
        case .qrCode(let str):
            return str.characters.count == 5 ? true : false
            
        }
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
