//
//  ClassViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/24.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        
        //构造器语法 结构体和类都使用构造器语法来生成新的实例。构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号
        let someResolution = Resolution()
        let someViedoMode = VideoModel()
        someViedoMode.resolution.height = 30
        someViedoMode.resolution.width = 50
        someViedoMode.name = "君不见"
        print(someViedoMode.name!)
        
        //构造器语法 结构体类型的成员又一个自动生成的成员逐一构造器，用于处事话新结构体中的实例成员属性
        //类实力没有这一构造器
        let vga = Resolution(width: 200, height: 300)
        someViedoMode.resolution = vga
//        vga.width = 20//类型是let 就不能改变变量  但是类型里面的可以更改 这就是引用类型和值类型的区别
        print(someViedoMode.resolution)
        
        //值类型被赋予一个变量，常量，或者被传递给一个函数的时候，值会被拷贝
//        所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，
//        在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制
        
        
        let hd = Resolution(width: 1920, height: 1080)
        //又声明一个变量，因为它是一个结构体，所以它其实是一个拷贝的副本，而不是它本身
        var cinema = hd
        //在将hd赋予给cinema的时候，实际上是将hd中所存储的值进行拷贝，然后将拷贝的数据存储到新的cinema实例中。结果就是两个完全独立的实例碰巧包含有相同的数值。由于两者相互独立，因此将cinema的width修改为2048并不会影响hd中的width的值。
        //枚举也遵守相同准则
        cinema.width = 300
        print(hd , cinema)
        
        
        //引用类型  类是引用类型 引用类型被赋予一个变量或者唱了或者被传到一个函数的时候，其值不会被复制
        var myCopy = someViedoMode
        print(myCopy.resolution.height)
        myCopy.resolution.height = 1234
        print(someViedoMode.resolution , myCopy.resolution)//值都会被改变
        
        //需要注意的是someViedoMode和myCopy被声明为常量而不是变量。然而你依然可以改变someViedoMode.frameRate和myCopy.frameRate，因为someViedoMode和myCopy这两个常量的值并未改变。它们并不“存储”这个VideoMode实例，而仅仅是对VideoMode实例的引用。所以，改变的是被引用的VideoMode的frameRate属性，而不是引用VideoMode的常量的值。
        
        //类是引用类型，有可能有多个常量和变量在幕后同时引用一个类实例，因此用=== ！== 检测是否引用同一个实力
        if someViedoMode === myCopy {
            print("是一个")
        } else {
            print("不是一个")
        }
        
        myCopy = VideoModel ()
        if someViedoMode === myCopy {
            print("是一个")
        } else {
            print("不是一个")
        }
        
//        请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
//        
//        “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
//        “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
        
        myCopy = MyClass()//具有类型推断的 一个指针只能是一种类型 但子类可以
        
        if someViedoMode === myCopy {
            print("是一个")
        } else {
            print("不是一个")
        }
        
        if ((myCopy as? VideoModel) != nil) {
            print("是这个类型")
        } else {
            print("不是这个类型")
        }
        
        if ((someViedoMode as? MyClass) != nil) {
            print("是这个类型")
        } else {
            print("不是这个类型")
        }
        
        if someViedoMode is MyClass {
            print("是这个类型")
        } else {
            print("不是这个类型")
        }
        
//        结构体实例总是通过值传递，类实例总是通过引用传递。这意味两者适用不同的任务。当你在考虑一个工程项目的数据结构和功能的时候，你需要决定每个数据结构是定义成类还是结构体。
//        
//        按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
//        
//        该数据结构的主要目的是用来封装少量相关简单数据值。
//        有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
//        该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
//        该数据结构不需要去继承另一个既有类型的属性或者行为。

//        Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
        let myDic : [String : Any] = ["name" : "zhangsan", "age" : 18]
        var dd = myDic
        dd["name"] = "张三"
        print(myDic,dd)
        
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
struct Resolution {
    var width = 0
    var height = 0
    
    
}

class VideoModel {
    var resolution = Resolution()
    var intrtacef = false
    var frameRete = 0.0
    var name : String?
    
}

class MyClass : VideoModel{
    var name2 : String?
    
}
