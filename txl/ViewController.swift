//
//  ViewController.swift
//  txl
//
//  Created by 陆天明 on 16/7/11.
//  Copyright © 2016年 陆天明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num: UITextField!
    @IBOutlet weak var name: UITextField!
    var db:SQLiteDB!
    @IBAction func tianjia(sender: AnyObject) {
        saveUser()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),unum varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            name.text = user["uname"] as? String
            num.text = user["unum"] as? String
        }
    }
    func saveUser() {
        let uname = self.name.text!
        let unum = self.num.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,unum) values('\(uname)','\(unum)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

