//
//  ViewController.swift
//  JzOsSqlHelper
//
//  Created by Jianzhi.wang on 2020/1/13.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import UIKit
import SQLite3
import JzOsSqlHelper
class ViewController: UIViewController,Sql_Result{
    func resultBack(_ binary: SqlBinary) {
        print(binary.getString(0))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let a=SqlHelper("12.db")
        
        if(a.autoCreat()){
            a.exSql("CREATE TABLE  IF NOT EXISTS `logtable` ( id INTEGER PRIMARY KEY AUTOINCREMENT, data VARCHAR NOT NULL, type VARCHAR NOT NULL);")
            a.exSql("insert into logtable(data,type) values ('hello','sql')")
            a.query("select * from `logtable`",self)
        }
        
        if(a.initByBundleMain("MMY_EU_list_V0.4_190926","db")){
            a.query("select * from `Summary table`",self)
         a.query("select count(1) from `Summary table`",self)
        }
        
        DispatchQueue.global().async {
            if(a.initByUrl("https://bento2.orange-electronic.com/Orange%20Cloud/Database/MMY/EU/MMY_EU_list_V0.6_191128.db")){
                      a.query("select count(1) from `Summary table`",self)
                  }
        }
    }
}

