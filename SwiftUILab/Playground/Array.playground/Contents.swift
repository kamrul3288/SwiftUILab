import UIKit

var items = ["Butter", "Milk","Orange"]
items.first

let anotherItems = ["Butter","Carot","Tomato"]
items.append(contentsOf: anotherItems)
print(items)

struct Item : Equatable{
    let name:String
}
var itemsArray = [Item(name: "Butter"),Item(name: "Milk"),Item(name: "Orange")]
var anotherItemsArray = [Item(name: "Butter"),Item(name: "Milk"),Item(name: "Orange")]
itemsArray.append(contentsOf: anotherItemsArray)
for item in itemsArray{
    print(item.name)
}



