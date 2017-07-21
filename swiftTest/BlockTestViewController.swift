//
//  BlockTestViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/20.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class BlockTestViewController: UIViewController {

   var button : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.green
        
//        BlockSetem()
//        tailBlock()

        //值捕获
//        let incrementByTen = makeIncrementer(forIncrement: 10)()
//        print(incrementByTen)
//        
//        print(makeIncrementer(forIncrement: 10)() , makeIncrementer(forIncrement: 10)() ,makeIncrementer(forIncrement: 10)(),makeIncrementer(forIncrement: 7)() )
    
        //逃逸闭包  @escaping //异步执行 网络请求的成功失败回掉
        
        
//        //自动闭包
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//        print(customersInLine.count)
//        // 打印出 "5"
//        
//        let customerProvider = { customersInLine.remove(at: 0) }
//        print(customersInLine.count)
//        // 打印出 "5"
//        
//        print("Now serving \(customerProvider())!")
//        // Prints "Now serving Chris!"
//        print(customersInLine.count)
        // 打印出 "4"
      
        serve(customsr: { customersInLine.remove(at: 0) })
        
        serve(customsr: { customersInLine.remove(at: 0) })
        
        serve2(customer: customersInLine.remove(at: 0))
        
        button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button!.backgroundColor = UIColor.red
        button!.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button!)
    }

  @objc private func buttonClick()  {
    
    let vc = Block2ViewController()
    vc.myCount = 3
    vc.myBlock = { str in
        print(str)
        self.button!.setTitle(str, for: .normal)
    }
    self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func serve(customsr customerRrover:() -> String)  {
        print("current serving \(customerRrover())")
    }
    //上面的 serve(customer:) 函数接受一个返回顾客名字的显式的闭包。下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。
//    注意 过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。
    func serve2(customer cusomerReovider: @autoclosure () -> String) {
        print("lalalalaal \(cusomerReovider())")
    }
    
    func BlockSetem()  {
        let array = ["1","3","5","2","4","1","7","2"]
        
        //sorted  sort 函数用法
        //        var xixi = array.sorted(by: sortArr1)
        //
        //        print(xixi,array)
        //
        //        xixi.sort(by: sortArr2)
        //
        //        print(xixi,array)
        
        
        //方法1
        let netArr =  array.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print(netArr);
        
        //根据上下文推断类型
        let nextArr = array.sorted(by: {s1 , s2 in return s1 < s2})
        print(nextArr)
        
        //单表达式闭包隐式返回
        let nexttArr = array.sorted(by: { s1, s2 in s1 > s2 });
        print(nexttArr)
        
        //参数名称缩写
        let  nnextArr = array.sorted(by: { $0 < $1 })
        print(nnextArr)
        
        //运算符方法
        let  nnnn = array.sorted(by: >)
        print(nnnn)
    }
    
    private func sortArr1(_ first : String ,_ second : String) -> Bool {
        return first < second
    }
    private func sortArr2(_ first : String ,_ second : String) -> Bool {
        return first > second
    }
    
    func someFunctionThatTakesAClosure(closure:  (_ myCount : Int) -> String) {
        // 函数体部分
        let sss = closure(3)
        print(sss)
    }
    
    //尾随闭包
    func tailBlock()  {
        
       
        
//        // 以下是不使用尾随闭包进行函数调用
//        someFunctionThatTakesAClosure(closure: {
//            // 闭包主体部分
//        })
        
        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure { (myCount) -> String in
            return "\(myCount) is good"
        }
       
        
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings = numbers.map {
            (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        
        print(strings)
        
      
    }
    
//    incrementer() 函数并没有任何参数，但是在函数体内访问了 runningTotal 和 amount 变量。这是因为它从外围函数捕获了 runningTotal 和 amount 变量的引用。捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。
//    注意 为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。 Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
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
