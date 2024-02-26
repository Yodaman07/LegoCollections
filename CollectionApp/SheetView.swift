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
    @Binding var storageData: [StorageItem]
    
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
                AddStorageItem(storageData: $storageData, sheetActive: $active, canCreate: $canCreate)
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
                  storageData: .constant(
                    [
                        StorageItem(name: "Glass Bookshelf", levels: 4, active: false, sets: [
                            LegoSet(name: "NinjagoSet", setNum: 1234, img: "octogon.fill", level: 2),
                            LegoSet(name: "CoolSet", setNum: 5678, img: "octogon.fill", level: 4)])
                     ]
                  ))
    }
}
