//
//  AddStorageItem.swift
//  CollectionApp
//
//  Created by Ayaan Irshad on 2/19/24.
//

import SwiftUI

struct AddStorageItem: View {
    @Binding var itemData : [Item]
    @Binding var sheetActive : Bool
    @Binding var canCreate : Bool
    
    
    @State var bookshelf = ""
    @State var shelfCount = ""
    @State var imgBtnShown = false
    
    var body: some View {
        Form{
            //Error happens when interacting with the textfield. https://forums.developer.apple.com/forums/thread/738726
            TextField("Bookshelf Name", text: $bookshelf)
            TextField("Shelf Count", text: $shelfCount)
            if (Int(shelfCount) == nil && shelfCount != ""){
                Text("Error - Cannot use letters")
                    .foregroundColor(.red).bold()
                
            }
            
            ZStack(alignment: .topLeading){
                Text("Image").onTapGesture{
                    imgBtnShown.toggle()
                }.foregroundColor(.blue)
            }
            
            
            Button("Create"){
                if (Int(shelfCount) != nil || shelfCount == ""){
                    itemData.append(Item(name: bookshelf, img: "books.vertical.fill", inBookshelf: Int(shelfCount)))
                    sheetActive = false
                }else{
                    canCreate = false
                }
            }
            
        } //End of the form
        
    }
}

#Preview {
    AddStorageItem(itemData: .constant([Item(name: "Test", img: "books.vertical.fill", inBookshelf: 0)]), sheetActive: .constant(true), canCreate: .constant(true))
}
