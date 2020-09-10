//
//  SqlHelper.swift
//  JzOsSqlHelper
//
//  Created by Jianzhi.wang on 2020/1/14.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
import SQLite3
public class SqlHelper{
    var db:OpaquePointer? = nil
    var src=""
    var dst=""
    var dbname=""
    public init (_ dbName:String){
        dbname=dbName
    }
    
    public func autoCreat()->Bool{
        let fm = FileManager.default
        src = Bundle(for: type(of: self)).path(forResource: "mydb", ofType: "sqlite") ?? ""
        dst = NSHomeDirectory() + "/Documents/\(dbname).sqlite"
        print("dst:\(dst) src\(src)")
        if !fm.fileExists(atPath: dst) {
            try! fm.copyItem(atPath: src, toPath: dst)
        }
        if sqlite3_open_v2(dst, &db,SQLITE_OPEN_READWRITE|SQLITE_OPEN_FULLMUTEX,nil) == SQLITE_OK {
            print("資料庫開啟成功")
            return true
        } else {
            print("開啟資料庫失敗")
            db = nil
            return false
        }
    }
    
    public func initByBundleMain(_ filename:String,_ filetype:String)->Bool{
        let fm = FileManager.default
        src = Bundle.main.path(forResource: filename, ofType: filetype) ?? ""
        
        dst = NSHomeDirectory() + "/Documents/\(dbname).sqlite"
        print(dst)
        if !fm.fileExists(atPath: dst) {
            try! fm.copyItem(atPath: src, toPath: dst)
        }
        if sqlite3_open_v2(dst, &db,SQLITE_OPEN_READWRITE|SQLITE_OPEN_FULLMUTEX,nil) == SQLITE_OK {
            print("資料庫開啟成功")
            return true
        } else {
            print("開啟資料庫失敗")
            db = nil
            return false
        }
    }
    
    public func initByUrl(_ url:String,_ result:@escaping (_ result:Bool)->Void){
        DispatchQueue.global().async {
            let url = URL(string: url)
            var data: Data? = nil
            if let anUrl = url {
                do{
                    try data = Data(contentsOf: anUrl)
                    let dst = NSHomeDirectory() + "/Documents/\(self.dbname).sqlite"
                    let urlfrompath = URL(fileURLWithPath: dst)
                    try data?.write(to: urlfrompath)
                    if sqlite3_open_v2(dst, &self.db,SQLITE_OPEN_READWRITE|SQLITE_OPEN_FULLMUTEX,nil) == SQLITE_OK{
                        print("資料庫開啟成功")
                        DispatchQueue.main.async {
                            result(true)
                        }
                    }else{
                        print("資料庫開啟失敗")
                        DispatchQueue.main.async {
                            result(false)
                        }
                    }
                }catch{print(error)
                    DispatchQueue.main.async {
                        result(false)
                    }
                }
            }else{
                DispatchQueue.main.async {
                    result(false)
                }
            }
        }
    }
    public func initByUrl(_ url:String)->Bool{
               let url = URL(string: url)
               var data: Data? = nil
               if let anUrl = url {
                   do{
                       try data = Data(contentsOf: anUrl)
                       let dst = NSHomeDirectory() + "/Documents/\(self.dbname).sqlite"
                       let urlfrompath = URL(fileURLWithPath: dst)
                       try data?.write(to: urlfrompath)
                       if sqlite3_open_v2(dst, &self.db,SQLITE_OPEN_READWRITE|SQLITE_OPEN_FULLMUTEX,nil) == SQLITE_OK{
                           print("資料庫開啟成功")
                           return true
                       }else{
                           print("資料庫開啟失敗")
                          return false
                       }
                   }catch{print(error)
                       return false
                   }
               }else{
                   return false
               }
           
       }
    public func closeDB(){
        if db != nil {
            sqlite3_close(db)
        }
    }
    public func exSql(_ sql:String){
        if db != nil {
            var statement:OpaquePointer? = nil
            if sqlite3_prepare(db,sql,-1,&statement,nil) != SQLITE_OK{
                let errmsg=String(cString:sqlite3_errmsg(db))
                print(errmsg)
            }
            if sqlite3_step(statement) == SQLITE_DONE {
                print("sqlSuccess:\(sql)")
            } else {
                let errmsg = String(cString: sqlite3_errmsg(db))
                print("bind error: \(errmsg)")
            }
            sqlite3_finalize(statement)
        }
    }
    public func query(_ sql:String,_ result:(_ a:SqlBinary)->Void,_ end:()->Void){
        if db != nil {
            var statement:OpaquePointer? = nil
            if sqlite3_prepare(db,sql,-1,&statement,nil) != SQLITE_OK{
                let errmsg=String(cString:sqlite3_errmsg(db))
                print(errmsg)
            }
            while sqlite3_step(statement)==SQLITE_ROW{
                result(SqlBinary(statement!))
            }
            end()
        }
    }
}
