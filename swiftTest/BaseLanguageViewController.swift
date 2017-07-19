//
//  BaseLanguage ViewController.swift
//  swiftTest
//
//  Created by Yong Yang on 2017/7/14.
//  Copyright © 2017年 wly. All rights reserved.
//

import UIKit

class BaseLanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view?.backgroundColor = UIColor.white
        
//        self.LetAndVar()
//        self.tuplesStudy()
//        self.optionalsStudy()
//        self.optionBlinding()
//        do {
//            try self.errorHanding()
//        } catch  {
//            print("catchError")
//        }
        
//        calculation()
//        forStemaneAndLuoji()
//        StringAndChar()
//        arrayAbout()
//        setsAbout()
//        dicAbout()
//        forSetemg()
//        snack()
        swichCase()
        
        
        
    }

    
    /// 声明变量和常量
    func LetAndVar() {
        //声明
        let newLetNum = 10
        var newVarNum = 20
        let newDoublt : Float = 123
        
//        newLetNum = 20// 修改常量会报错
        newVarNum = 30//可以修改变量
        
        //类型标注
        var newString : String
        newString = "123456"
        
        
        let newAdd = Int(newDoublt) + newLetNum
        print(newAdd)
        
        //输出
        print(newLetNum,newVarNum,newString)
        print("你好你好 \(newString)")
        print("哈哈哈 " , newDoublt)
        
        /*
         多行注释
         /*嵌套注释*/
         */
    
//        数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量
        let justForFun = 1_00_33_3.234
        print("jsutFOrFun \(justForFun)")
    
    }
    
    
    /// 元组
    func tuplesStudy() {
        let (study,every,day) = ("hahaha", 365, 30)
        print(study,every,day)
        
        let myTulr = ("love word" , 365)
        let (des , dady) = myTulr
        print(des , dady)
        
        let hahaha = (destr : "myLove", toSomeBody : "you")
        print(hahaha.destr , hahaha.toSomeBody)
        
        
        let boolValue = false
        if !boolValue {
            print("yesyes~")
        }
        
        let i = 1
        
        if i == 1 {
            print("yes")
        }
    }
    
    
    /// 可选类型
    func optionalsStudy()  {
        //处理有值或无值
        let postNum = "string"
        let comer = Int(postNum)
        print(comer ?? "no Value")
        
        let newString : Int? = nil//不管是不是nil 都要有这个赋值的过程
        print(newString ?? "nono")
        if (newString != nil) {
            print("hasItem")
        }
        
        let i : String? = "str"
    
        if (i != nil)  {
            print("i is  \(String(describing: i))")
        }
        
        var ss = ""
        ss = i! + "  hahaha"
        print(ss)
        
    }
    
    
    /// 绑定可选值
    func optionBlinding() {//绑定可选值
        //判断可选类型是否包含值，如果包含 就把值付给一个临时常量或者变量
        let str = "111"
        
        if var aaa = Int(str) {//“如果Int(str)返回的可选Int包含一个值，创建一个叫做aaa的新常量并将可选包含的值赋给它。
//            如果转换成功，aaa常量可以在if语句的第一个分支中使用。它已经被可选类型 包含的 值初始化过，所以不需要再使用!后缀来获取它的值。在这个例子中，aaa只被用来输出转换结果。
            print(String(describing:aaa))
            print(aaa)
            aaa = 1235678
            print(aaa)
        }
        
        //可以包含多个可选绑定在if语句中，并使用where子句做布尔值判断。
        if let firstNumber = Int("4"), let secondNum = Int("66"), firstNumber < secondNum {
           print("\(firstNumber) < \(secondNum)")
        }
        
        
        //确定总是有值的 就可以在在类型后放一个！表示隐性解析可选类型，一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString! // 需要惊叹号来获取值
        print(forcedString)
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString  // 不需要感叹号
        print(implicitString)
        
//        你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：
        if assumedString != nil {
            print(assumedString)
        }
//        你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
        if let definiteString = assumedString {
            print(definiteString)
        }
        
//        如果一个变量之后可能变成nil的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是nil的话，请使用普通可选类型。
    }
    
    
    /// 错误抛出
    ///
    /// - Throws:
    func errorHanding() throws {//错误抛出
        let str : String! = nil
        
        assert(str != nil, "nil值出没注意")
        //assertion failed: nil值出没注意: file /Users/yongyang/Desktop/swiftTest/swiftTest/BaseLanguageViewController.swift, line 153
        //release 断言会被禁用
        
        let ss  = str
        
        print(ss ?? "ahaha" )
        
        
        /*
        当条件可能为假时使用断言，但是最终一定要保证条件为真，这样你的代码才能继续运行。断言的适用情景：
        
        1.整数类型的下标索引被传入一个自定义下标脚本实现，但是下标索引值可能太小或者太大。
        2.需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
        3.一个可选值现在是nil，但是后面的代码运行需要一个非nil值。
        */
        
        
    }
    
    
    /// 计算
    func calculation()  {
        //        加法运算符也可用于String的拼接：
        //+号运算可以作为字符串添加使用
       print( "hello, " + "world" )  // 等于 "hello, world"
        
        //浮点数求余
//        Swift 中是可以对浮点数进行求余的
//        let num = 8 % 2.5   // 等于 0.5
//        3.0改进：
        let x = 8.0
        let num = x.truncatingRemainder(dividingBy: 2.5)
        print(num)
        
        //一元运算符
        var add = 8 + 3
        let des = 8 - 3
        let dev = 8.0 / 3
        let mun = 8 * 3
        print(add, des, mun ,String(format: "%.2f", dev))
        
        //组合复制运算符
        add += 1
         let cc = add//没有++了 只有+=
     
       
        print(add , cc)
        
        var i = 0
        i += 1
        
//        var a = 0
//        let b = ++a // a 和 b 现在都是 1
//        let c = a++ // a 现在 2, 但 c 是 a 自增前的值 1
//        print(b , c)//这是不对的！
        //一元正负运算符
        let three = 3
        let minusThree = -three       // minusThree 等于 -3
        let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"
        print(three,minusThree,plusThree)
        
        //比较运算符
        /*
         等于（a == b）
         不等于（a != b）
         大于（a > b）
         小于（a < b）
         大于等于（a >= b）
         小于等于（a <= b）

         */
        if 1 <= 2 {
            print(true)
        } else {
            print(false)
        }
        
        //三元运算符
        let contentHeight = 40
        var hasHeader = true
        var rowHeight = contentHeight + (hasHeader ? 50 : 20)
        print(rowHeight)
        
        hasHeader = false
        rowHeight = contentHeight + (hasHeader ? 50 : 20)
        print(rowHeight)
        
        //空合运算符
        let a : Int? = nil;
        let b = a != nil ? a! : 0
        let c = a ?? 3
        
        print(b ,c )
        
    }
    
    //／for循环 逻辑运算符
    func forStemaneAndLuoji() {
        var  str : String? = nil
        
        
        for index in 1..<5 {//后面的范围只有两种 ...闭区间   ..< 半开区间
            if str != nil {
                 str = str! + String(index)
            } else {
                str = String(index)
            }
           
        }
        print(str!,str?.characters.count ?? "no length")
        
//        逻辑运算的操作对象是逻辑布尔值
        let val1 = !false
        let val2 = val1 && false
        let val3 = val1 || val2
        
        let val4 = true && !false || true && false && true
//         Swift 逻辑操作符&&和||是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。
        print( val4)
    }
    
    
    /// string
    func StringAndChar()  {
       //初始化 ： alloc init
        //let的是nsstering  var的是mutable 不过let的也不能set
        var emptyString = "srcwg"               // 空字符串字面量
        let anotherEmptyString = String("abcc")  // 初始化方法
     
        
        //判空
        if emptyString.isEmpty {
            print("Nothing to see here")
        }
        // 打印
       
//        emptyString = "ha9dhwei"
    
        let ceshi = anotherEmptyString
        emptyString = "hahah\(emptyString)"
        print(anotherEmptyString ?? "noAn",ceshi ?? "noCeshi")
        
        let ocStr: NSMutableString = NSMutableString.init(string: "balabala")
        let ocStr1 = ocStr
        // 改变ocStr1
        ocStr1.insert("World", at: ocStr.length)
        print("ocStr==\(ocStr)")
        print("ocStr1==\(ocStr1)")
        
        //特殊字符
//        转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
//        Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
        let doell = "\u{24}"//u+0024
        print(doell)
        
        
        let greeting = "Guten Tag!"
        let g  = greeting[greeting.startIndex]
        print(g)
        // G
        let last = greeting[greeting.index(before: greeting.endIndex)]
        print(last)
        
        
        for index in greeting.characters.indices {
           print("\(greeting[index])", terminator: "~~~")
        }
        
        print("\n")
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        let range = welcome.index(welcome.endIndex, offsetBy: -6 )..<welcome.endIndex
        welcome.removeSubrange(range)
        print(welcome)
        
        //比较字符串
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation == sameQuotation {
            print("These two strings are considered equal")
        }
        
        if quotation.hasPrefix("We") {
            print("hasPrefix")
        }
        
        if quotation.hasSuffix(".") {
            print("hasSuffix")
        }
       
        
       
        
    }
    
     /// 集合 - 数组
    func arrayAbout() {
     //通用 ： let 不可变  var 可变
        
        //初始化
        var someInts = [Int]()
       print("someInts is of type [Int] with \(someInts.count) items.")
        someInts.append(3)
        someInts.insert(2, at: 0)
        someInts.remove(at: 0)
//        someInts = []
        print(someInts)
        
        var other = [String](repeating: "aaa", count: 4)
        other.insert("heoh", at: 2)
        print(other)
        
        var  shopp : [String] = ["hahah","xixix","hehehe","kekeke"]
        print(shopp.isEmpty ? "empty" : "hasItem")
        shopp.append("guaguagua")
        shopp += ["wawawa"]//添加的要放在数组里面
        shopp += ["gegege","gagaga"]
        shopp[3] = "miaomiaomiao"
        shopp[5...6] = ["bababab","xiaxiaxia"]//还可以利用下标来一次改变一系列数据值
//        string.replaceSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 4), with: "Hi")
        shopp.replaceSubrange(0..<1, with: ["hi"])//替换
        shopp.replaceSubrange(Range(1..<2), with: ["ohoh"])
        shopp.replaceSubrange(Range(uncheckedBounds: (lower: 0, upper: 3 )), with: ["0"])
        print(shopp,shopp[0])
        
        for (index,value) in shopp.enumerated() {
            print(index,value)
        }

    }
    
    /// 集合
    func setsAbout()  {
        //一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a==b,因此必须a.hashValue == b.hashValue,Swift 的所有基本类型(比如String,Int,Double和Bool)默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型
        //集合存储相同类型且没有确定顺序的值，集合中无重复的值
        var letters = Set<Character>()
        print(letters.count)
        
        letters.insert("a")
        print(letters)
        letters = []
        letters.insert("b")
        letters.insert("a")
        letters.insert("h")
        print(letters.isEmpty ? "isEmpty" : "notEmpty")
//        if letters.contains("c") {
            letters.remove("c")//如果不存在 就不删除  不会崩溃的
//        }
        
        for letter in letters {
            print(letter)
        }
        
        let nextLetter = Set<Character>(arrayLiteral: "a","c","x","s","h")
        print(nextLetter)
        
        let anotherLetters : Set<Character> = ["a","c","x","s","h"]//["a","b","c","d","e"]
        print(anotherLetters)
        
        print("求同",nextLetter.intersection(anotherLetters))//十字路口 共同部分
        print("求异",nextLetter.symmetricDifference(anotherLetters))//对称差分 除去共同部分之外的合集
        print("合集",nextLetter.union(anotherLetters))//合集 共集
        print("a除去b",nextLetter.subtracting(anotherLetters))//next除去an的
        print("a", nextLetter,  "b", anotherLetters)
        //注意 func subtracting(_ other: Set<Set.Element>) -> Set<Set.Element>     func subtract(_ other: Set<Set.Element>)  一个是成一个新数组 一个是修改原来的
        if nextLetter == anotherLetters {//元素完全相同为相等
            print("yes");
        } else {
            print("no")
        }
        print(nextLetter.isSubset(of: anotherLetters))//判断一个集合中的值是否也被包含在另外一个集合中。 a是b的子集
        print(nextLetter.isSuperset(of: anotherLetters))//判断一个集合中包含另一个集合中所有的值。 a是b的父集
        print(nextLetter.isStrictSubset(of: anotherLetters))//严格子集
        print(nextLetter.isStrictSuperset(of: anotherLetters))//严格父集
        print(nextLetter.isDisjoint(with: anotherLetters))//判断两个集合是否不含有相同的值。
    }
    
    /// 字典
    func dicAbout()  {
        var dic = [String : String]()
        var dic2 = ["name" : "li","age" : 12 , "like" : "wu"] as [String : Any]
        
        
        var dic3 :[String : Any] = ["name" : "li","age" : 21 , "like" : "wu"]
        
      
        if var a = dic3["age"] as? Int {
            print(a)
            a = a + 3
        }
        
        if var a = dic3["age"] as? String {
            print(a)
            a += "ste"
        } else {
            print("nnnnnnnn")
        }
        
        dic["name"] = "zhang"
        dic2["age"] = "13"
        dic3["name"] = "libendan"
        print(dic,dic2,dic3,dic3["name"] ?? "nono",dic["age"] ?? "noValue")
        
        let oldValue = dic3.updateValue("lishutong", forKey: "name")
        print(dic3,oldValue ?? "nil")
        
        print("遍历")
        for keyValue in dic2.keys {
            print(keyValue)
        }
        print("haahah")
        for (key,valeu) in dic3 {
            print(key , valeu)
        }
    }
    
    func forSetemg()  {
//        forin
        for index in 1...5 {
            print(index)
        }
        
        let num = 10
        for index in 0..<num {
            print(index)
        }
        
        for _ in 3..<num {//区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略对值的访问：
            print("i like")
        }
        
//        for var i = 0 ; (i / 2 ) < 3; i += 1 {
//            print(i)
//        }/// C-style for statement has been removed in Swift 3
        
        //while 见snake
        //do while - repeat{}while 条件
        
        
    }
   
    func snack()  {
//        游戏盘面包括 25 个方格，游戏目标是达到或者超过第 25 个方格；
//        每一轮，你通过掷一个 6 边的骰子来确定你移动方块的步数，移动的路线由上图中横向的虚线所示；
//        如果在某轮结束，你移动到了梯子的底部，可以顺着梯子爬上去；
//        如果在某轮结束，你移动到了蛇的头部，你会顺着蛇的身体滑下去。
        
//        游戏盘面可以使用一个Int数组来表达。数组的长度由一个finalSquare常量储存，用来初始化数组和检测最终胜利条件。游戏盘面由 26 个 Int 0 值初始化，而不是 25 个（由0到25，一共 26 个）：
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        
//        一些方块被设置成有蛇或者梯子的指定值。梯子底部的方块是一个正值，使你可以向上移动，蛇头处的方块是一个负值，会让你向下移动
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        
//        玩家由左下角编号为 0 的方格开始游戏。一般来说玩家第一次掷骰子后才会进入游戏盘面：
        var square = 0
        var diceRoll = 0
        while square < finalSquare {
            // 掷骰子
            diceRoll = Int(arc4random()) % 7 + 1
            print("投掷数 \(diceRoll)" )
            // 根据点数移动
            square += diceRoll
            print("走到 \(square)")
            if square < board.count {
                // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
                if board[square] != 0 {
                    print("遇到特殊块跳转到\(square)")
                }

                
                square += board[square]

            }
        }
        print("Game over!\n")
        
//        repeat {
//            // 顺着梯子爬上去或者顺着蛇滑下去
//            square += board[square]
//            // 掷骰子
//            diceRoll = Int(arc4random()) % 7 + 1
//            // 根据点数移动
//            square += diceRoll
//        } while square < finalSquare
//        print("Game over!")
        
    }
    
    func swichCase()  {
//        switch语句最简单的形式就是把某个值与一个或若干个相同类型的值作比较：
//    与 C 语言和 Objective-C 中的switch语句不同，在 Swift 中，当匹配的 case 分支中的代码执行完毕后，程序会终止switch语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用break语句。这使得switch语句更安全、更易用，也避免了因忘记写break语句而产生的错误。
        let someCharacter: Character = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        // 输出 "e is a vowel"
        
        
        
        //区间
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        var naturalCount: String
        switch approximateCount {
        case 0:
            naturalCount = "no"
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        case 100..<1000:
            naturalCount = "hundreds of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings).")
        // 输出 "There are dozens of moons orbiting Saturn."
        
        
        
        //我们可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
        //switch语句会判断某个点是否是原点(0, 0)，是否在红色的x轴上，是否在黄色y轴上，是否在一个以原点为中心的4x4的矩形里，或者在这个矩形外面。
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("(0, 0) is at the origin")
        case (_, 0):
            print("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            print("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
        }
        // 输出 "(1, 1) is inside the box"
        
        
        //值绑定 获取到每一个的值
        //case 分支的模式允许将匹配的值绑定到一个临时的常量或变量，这些常量或变量在该 case 分支里就可以被引用了——这种行为被称为值绑定（value binding）。
        let anotherPoint = (2, 3)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y)://初始化之后还能用
            print("somewhere else at (\(x), \(y))")
        }
        // 输出 "on the x-axis with an x value of 2"
        
        
        //where 加判断条件
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // 输出 "(1, -1) is on the line x == -y"
        
        //用fallthrough 让它向下贯穿
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // 输出 "The number 5 is a prime number, and also an integer."
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
