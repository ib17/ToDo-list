//
//  Model.swift
//  ToDoList
//
//  Created by Иван Белоконь on 5/29/19.
//  Copyright © 2019 Иван Белоконь. All rights reserved.
//

import Foundation



var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get{
        if let arrey = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return arrey
        }else{
            return []
        }
        
    }
}


func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": false])
    
}

func removeItem(at index: Int ) {
    ToDoItems.remove(at: index)
    
}

func moveItem (fromIndex: Int, toIndex: Int){
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}

func changeState(at item: Int) -> Bool{
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    return ToDoItems[item]["isCompleted"] as! Bool
    
}

