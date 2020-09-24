[![Platform](https://img.shields.io/badge/Platform-%20IOS%20-brightgreen.svg)](https://github.com/sam38124)
[![characteristic](https://img.shields.io/badge/特點-%20輕量級%20%7C%20簡單易用%20%20%7C%20穩定%20-brightgreen.svg)](https://github.com/sam38124)
# JzOsSqlHelper
This is an extremely lightweight sqlite manager that uses the least amount of code to interact with the database! !

android version:<br>[https://github.com/sam38124/JzSqlHelper](https://github.com/sam38124/JzSqlHelper)
## List
* [Import to project](#Import)
* [Quick Start](#Use)
* [Preload database in bundle](#Assetsdb)
* [Preload database in internet](#Urldb)
* [About me](#About)


<a name="Import"></a>
## Import to project
> Support Swift Package。 <br/>

#### 1.Open xcode and paste link for Swift Package
+ > ##### https://github.com/sam38124/TestLibrary/JzOsSqlHelper

## Create datebase
```swift
lazy var adapter=LinearAdapter(tb: tb, count: {
        //return your item count
        return 5
    }, nib: ["Place your xib1","Place your xib2"], getcell: {
        tableview,indexpath,position in
if(position==0){
let cell=a.dequeueReusableCell(withIdentifier: "Place your xib what is define in nib  array") as! Cell_Program_Detail
 return cell
}else{
let cell=a.dequeueReusableCell(withIdentifier: "Place your xib what is define in nib  array") as! Cell_Program_info
 return cell
}    
}, {
        clickPosition in
        //If click item will reback to this callback
    })
```
<a name="HorizontalAdapter"></a>
## Horizontal LinearLayout
```swift
    lazy var adapter=HorizontalAdapter(tb: tb, width:UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3
    , count: {return self.item.make.count}, nib: "Cell_Make", getcell: {
        a,b,c in
        let cell=a.dequeueReusableCell(withReuseIdentifier: "Cell_Make", for: b) as! Cell_Make
        return cell
    },scrollback: {
        //If stop scrolling with call this function
    })
```
<a name="Grid"></a>
## GridLayout
```swift
//Replace count to your itemcount
//Replace spilt to  how many item you want to display in per line
    lazy var adapter=GridAdapter(tb: tb, width:UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3
    , count: {return self.item.make.count}, spilt: 3, nib: "Cell_Make", getcell: {
        a,b,c in
        let cell=a.dequeueReusableCell(withReuseIdentifier: "Cell_Make", for: b) as! Cell_Make
        return cell
    })
```


#### 2.Refresh layout
```swift
adapter.notifyDataSetChange()
```

<a name="About"></a>
# About me
#### <font color="#0000dd"> Work for: </font><br /> 
+ ##### <font color="#660000">【Orange Electronic】</font><br /> 
#### <font color="#0000dd"> Position: </font><br /> 
+ ##### Full stack engineer<br/>  
#### <font color="#0000dd"> Main defense range: </font><br /> 
+ ##### Android and IOS(4 years)<br/>  
+ ##### Jsp(2 years)<br/> 
+ ##### Javascript and Jquery and Ktor(1 years)<br /> 
#### <font color="#0000dd"> Contact information: </font><br /> 
+  ##### line:sam38124<br /> 

+  ##### gmail:sam38124@gmail.com
