//
//  ck.swift
//  txl
//
//  Created by 陆天明 on 16/7/11.
//  Copyright © 2016年 陆天明. All rights reserved.
//

import UIKit

class ck: UIViewController {
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

    @IBAction func cha(sender: AnyObject) {
        htext.text=""
        let data = db.query("select * from t_user")
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            htext.text! += "姓名" + String(user["uname"]!)+"电话" + String(user["unum"]!)+"\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var htext: UITextView!

}
