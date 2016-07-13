//
//  shanchu.swift
//  txl
//
//  Created by 陆天明 on 16/7/11.
//  Copyright © 2016年 陆天明. All rights reserved.
//

import UIKit

class shanchu: UIViewController {
    @IBAction func shanchu2(sender: AnyObject) {
        let b=stext.text!
        let sql="delete from t_user where unum='\(b)'"
        let result=db.execute(sql)
        print(result)
    }
    @IBAction func shanchu1(sender: AnyObject) {
        let a=stext.text!
        let sql="delete from t_user where uname='\(a)'"
        let result=db.execute(sql)
        print(result)
    }
    @IBOutlet weak var stext: UITextField!
    var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),unum varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
