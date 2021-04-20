//
//  SqlBinary.swift
//  JzOsSqlHelper
//
//  Created by Jianzhi.wang on 2020/1/14.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
import SQLite3
public class SqlBinary {
    var statement:OpaquePointer? = nil
    init(_ statement:OpaquePointer){
        self.statement=statement
    }
    public func getString(_ index:Int)->String?{
        let text=sqlite3_column_text(statement,Int32(index))
        if(text == nil){
            return nil
        }else{
            return  String(cString: text!)
        }
    }
    public func getInt(_ index:Int)->Int{
        return  Int(sqlite3_column_int(statement,Int32(index)))
    }
    public func getBytes(_ index:Int)->UInt32{
        return UInt32(sqlite3_column_bytes(statement,Int32(index)))
    }
    public func getData(_ index:Int)->Data{
        let length = sqlite3_column_bytes(statement, Int32(index))  // 2代表image欄位
        let bytes = sqlite3_column_blob(statement, Int32(index))
        return NSData(bytes: bytes, length: Int(length)) as Data
    }
    public func getColumnsCount()->Int{
        return Int(sqlite3_column_count(statement));
    }
    public func getColumnsName(_ index:Int)->String{
        return String(cString: sqlite3_column_name(statement, Int32(index)))
    }
}
