//
//  ViewController.swift
//  plistSample2
//
//  Created by Hayashidesu. on 2015/11/04.
//  Copyright © 2015年 Hayashidesu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        yomikomi1()
        yomikomi2()
    }

    func yomikomi1() {
        // プロパティファイルをバインド
        let path = NSBundle.mainBundle().pathForResource("yomikomi1", ofType: "plist")
        
        // rootがDictionaryなのでNSDictionaryに取り込み
        let dict = NSDictionary(contentsOfFile: path!)
        
        // キー"AAA"の中身はarrayなのでNSArrayで取得
        let arr:NSArray = dict!.objectForKey("AAA") as! NSArray
        
        // arrayで取れた分だけループ
        for value in arr {
            // またNSDictionaryなので、キーを指定してデータを取得
            let i:Int = value.objectForKey("data1") as! Int
            let j:Int = value.objectForKey("data2") as! Int
            print("\(i) + \(j) = \(i + j)")
        }
    }
    
    func yomikomi2() {
        // プロパティファイルをバインド
        let path = NSBundle.mainBundle().pathForResource("yomikomi2", ofType: "plist")
        
        // rootがArrayなのでNSArrayに取り込み
        let arr:NSArray = NSArray(contentsOfFile: path!)!
        
        // 取得できる個数の分だけ繰り返す
        for value in arr {
            // Arrayの中はDictionaryなのでキーを指定してデータを取得。
            // その中身はまたArrayなのでNSArrayに取り込み
            let arr2 = value.objectForKey("BBB") as! NSArray
            for value2 in arr2 {
                // 取得できる個数の分だけ繰り返す
                // Arrayの中身はString型なので、そのまま出力
                print(value2)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

