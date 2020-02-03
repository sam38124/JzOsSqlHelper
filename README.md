[![Platform](https://img.shields.io/badge/平台-%20IOS%20-brightgreen.svg)](https://github.com/sam38124)
[![characteristic](https://img.shields.io/badge/特點-%20輕量級%20%7C%20簡單易用%20%20%7C%20穩定%20-brightgreen.svg)](https://github.com/sam38124)
# JzOsSqlHelper
這是一套極致輕量的IOS_Sqlite管理器
## 目錄
* [如何導入到專案](#Import)
* [如何使用](#Use)
* [關於我](#About)

<a name="Import"></a>
## 如何導入到項目
> 支持framework導入。 <br/>

#### 1.首先將framework拉入要導入的Project當中
<img src="https://github.com/sam38124/JzOsFrameWork/blob/master/i2.png" width = "800"  alt="i1" /><a name="Use"></a>
#### 2.將三個選項打勾
<img src="https://github.com/sam38124/JzOsFrameWork/blob/master/i1.png" width = "800"  alt="i1" /><a name="Use"></a>
#### 3.選擇Embed and signed
<img src="https://github.com/sam38124/JzOsFrameWork/blob/master/i3.png" width = "800"  alt="i1" /><a name="Use"></a>
<a name="Use"></a>
## 如何使用
#### 1.宣告你的SqlHelper
```swift
let a=SqlHelper("隨便取名.db")
```
#### 2.快速使用
```swift
        //自動創建空資料庫
        if(a.autoCreat()){
            a.exSql("CREATE TABLE  IF NOT EXISTS `logtable` ( id INTEGER PRIMARY KEY AUTOINCREMENT, data VARCHAR NOT NULL, type VARCHAR NOT NULL);")
            a.exSql("insert into logtable(data,type) values ('hello','sql')")
            a.query("select * from `logtable`",self)
        }
```
#### 3.預載本地資料庫
```swift
        //建立資料庫
        let a=SqlHelper("test.db")
        //預載本地資料庫(必須將資料庫放於和Assets同級的位置)
        if(a.initByBundleMain("MMY_EU_list_V0.4_190926","db")){
            a.query("select * from `Summary table`",self)
         a.query("select count(1) from `Summary table`",self)
        }
```
#### 4.預載網路資料庫
```swift
 SqlHelper("mmy.db").initByUrl("https://dburl",{
            result in
            print("預載資料庫\(result)")
        })
```
<a name="About"></a>
### 關於我
橙的電子android and ios developer

*line:sam38124

*gmail:sam38124@gmail.com
