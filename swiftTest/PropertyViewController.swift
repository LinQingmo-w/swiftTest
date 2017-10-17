//
//  PropertyViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/24.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
   
}

class SecondKindClass {//有相同的类  一个工程不一样文件也不能有同名的类类
    //必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
    //懒惰的属性必须有一个初始值设定项
    lazy var familyName: String? = nil
    //当属性的值依赖于在实例的构造过程结束后才会知道影响值的外部因素时，或者当获得属性的初始值需要复杂或大量计算时，可以只在需要的时候计算它。
    
    
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

//除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值
struct Rect {
    var origin = Point()
    var size = Size()
    var center  : Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {//()里面可以省略，省略了默认名为newValue
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    //只读属性，只有getter 没有setter
    var area : Double {
        return size.width * size.height
    }
    
    //属性观察器 观察监听属性变化的值，每次属性被设置的时候都会被调用， 即使当新值和当前值相同的时候也会被调用
    var totalSteps :Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet{
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
    
}

class PropertyViewController: UIViewController {

//    一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。
//    计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体
    
//    存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性。
    
    
    //延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性
    lazy var hight : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var  rangofThreeItems = FixedLengthRange(firstValue: 30, length: 20)
        rangofThreeItems.firstValue = 6//尽管 firstValue 是个变量属性，这里还是会报错
        //这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
        //属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。 类有延迟调用～
        
        
//       Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
        
        //测试的
        
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





