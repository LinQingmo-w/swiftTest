//
//  FunctionViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/20.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class FunctionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view!.backgroundColor = UIColor.red
        self.title = "函数"
        
        print(greet(person: "小李子"))//print string
        
        let (myString  , myDream ) = myTurle(like: "you", dream: "onlyYou")
        print(myString,"   ",myDream)
        
        print(morenzhi(first : 4 ,second: "like"))
        print(morenzhi(second: "wang"))
        
        print(variadicParameter(numbers: 1,3,4,2,6,2))
        print(variadicParameter(strings: "我","肯定","是","最棒","的呢"))
        
        //    在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它
        var mathFunction: (Int, Int) -> Int = addTwoInts//addTwoInts是一个函数名
//        这段代码可以被解读为：
//        ”定义一个叫做 mathFunction 的变量，类型是‘一个有两个 Int 型的参数并返回一个 Int 型的值的函数’，并让这个新变量指向 addTwoInts 函数”。
        print("Result: \(mathFunction(2, 3))")
        
        mathFunction = multiplyTwoInts
        print("Result2: \(mathFunction(2, 3))")
        
       
        printMathResult(addTwoInts, 2, 3)
        
//       print(chooseStepFunction(backward: true))
        var currentValue = -3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        
        print("Counting to zero:")
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
       
        print("zero!")
        
    }

   private func greet(person : String) -> String {
        let getter = "你好" + person + "!"
        return getter
    }
    
    private func myTurle(like : String , dream : String) -> (myString : String , myDream : String) {
        return ("i like \(like)", "my dreame is \(dream)")
    }
    
   private func morenzhi(first : Int = 3 , second : String) -> String {
        return  "first \(first)" + second
    }
    
   private func variadicParameter(numbers : Double...) -> Double {
        var total:Double = 0
        
        for num in numbers {
            total += num
        }
        return total
    }
    
   private func variadicParameter(strings : String...) -> String {
        var str = ""
        
        for st in strings {
            str += st
        }
        return str
    }
//    如果你不希望为某个参数添加一个标签，可以使用一个下划线(_)来代替一个明确的参数标签。
   private func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
   private func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

   private func stepForward(_ input: Int) -> Int {
        return input + 1
    }
   private func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
   private func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
    
   private func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    
  internal  override func didReceiveMemoryWarning() {
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
