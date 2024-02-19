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
    
    
    @State var selected = "Bookshelf"
    @State var bookshelf = ""
    @State var shelfCount = ""
    @State var imgBtnShown = false
    
    @State var photoPicker: PhotosPickerItem? = nil
    @State var canCreate = true
    
    
    var body: some View {
        // \.self ?????
        VStack{
            Picker("CreationType", selection: $selected){
                ForEach(options, id: \.self){item in
                    Text(item)
                }
            }.pickerStyle(.segmented)
            if (selected == "Bookshelf"){
                Form{
                    
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
                        
//                        HStack{
//                            PhotosPicker(selection: $photoPicker,
//                                         matching: .images,
//                                         photoLibrary: .shared()) {
//                                Text("From Phone")
//                            }
//
//                            Spacer()
//                            Button("Browse Icons"){
//                                print("a")
//                            }
//                        }.opacity(imgBtnShown ? 1 : 0)
//                        .alignmentGuide(.top, computeValue: {dimension in dimension[.top] - (imgBtnShown ? 50 : 0)
//                        })
//                        .animation(.easeOut(duration: 0.5))
                        //https://stackoverflow.com/questionss/62477695/dynamic-row-height-in-a-swiftui-form
                    }
                    
                
                    Button("Create"){
                        if (Int(shelfCount) != nil || shelfCount == ""){
                            itemData.append(Item(name: bookshelf, img: "books.vertical.fill", inBookshelf: Int(shelfCount)))
                            active = false
                        }else{
                            canCreate = false
                        }
                    }
                    if (!canCreate){
                        Text("Cannot create due to errors").bold().foregroundColor(.red)
                    }
                    
                }
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
