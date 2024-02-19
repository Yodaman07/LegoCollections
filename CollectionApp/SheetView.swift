//
//  SheetView.swift
//  CollectionApp
//
//  Created by Ayaan Irshad on 1/22/23.
//

import SwiftUI
import PhotosUI

struct SheetView: View {
    let options = ["Bookshelf","Set"]
    @Binding var active: Bool
    @Binding var itemData: [Item]
    
    @State var canCreate = true
    
    @State var selected = "Bookshelf"
    
    @State var photoPicker: PhotosPickerItem? = nil
    
    
    
    var body: some View {
        // \.self ?????
        VStack{
            Picker("CreationType", selection: $selected){
                ForEach(options, id: \.self){item in
                    Text(item)
                }
            }.pickerStyle(.segmented)
            if (selected == "Bookshelf"){
                AddStorageItem(itemData: $itemData, sheetActive: $active, canCreate: $canCreate)
            }
            
            if (!canCreate){
                Text("Cannot create due to errors").bold().foregroundColor(.red)
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(active: .constant(true),
                  itemData: .constant([Item(name: "Test", img: "books.vertical.fill", inBookshelf: 0)]))
    }
}
