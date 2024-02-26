//
//  CollectionView.swift
//  CollectionApp
//
//  Created by Ayaan Irshad on 1/19/23.
//

import SwiftUI


struct CollectionView: View {
    @State var imageName:String = "chevron.up"
    @State var active = false
    
    
    @State var AllData: [Item] = [
        Item(name: "Bookshelf1", img: "books.vertical.fill", inBookshelf: 6, children: [Item(name: "LegoSet1", img: "octagon.fill", shelf: 5),
        Item(name: "LegoSet2", img: "octagon.fill", shelf: 4)]),
        
        Item(name: "Bookshelf2", img: "books.vertical.fill", inBookshelf: 5, children: [Item(name: "OtherSet1", img: "octagon.fill", shelf: 4),
        Item(name: "OtherSet2", img: "octagon.fill", shelf: 3)])
    ]
    
    @State var Data: [StorageItem] = [
        StorageItem(name: "Glass Bookshelf", levels: 4, active: false, sets: [
            LegoSet(name: "NinjagoSet", setNum: 1234, img: "octogon.fill", level: 2),
            LegoSet(name: "CoolSet", setNum: 5678, img: "octogon.fill", level: 4)
        ]),
        
        StorageItem(name: "OtherBookshelf", levels: 5, active: false, sets: [
            LegoSet(name: "Set1", setNum: 0001, img: "octogon.fill", level: 1),
            LegoSet(name: "Set2", setNum: 0002, img: "octogon.fill", level: 3)
        ]),
        StorageItem(name: "EmptyBookshelf", levels: 0, active: false,  sets:[])
    ]
    
    var body: some View {
        NavigationStack{
        
                VStack{
                    HStack{
                        Text("Collections").font(.largeTitle.bold())
                        Spacer()
                        Button("+"){
                            active = true
                        }.font(.largeTitle).sheet(isPresented: $active) {
                            SheetView(active: $active, storageData: $Data)
                        } //Bindings are just pointers in swift
                    }.padding()
                    
                    //https://stackoverflow.com/questions/69562455/in-a-list-left-side-of-mutating-operator-isnt-mutable-item-is-a-let-const
                    List($Data){ $storageData in
                        
                        HStack(){
                            Image(systemName: "books.vertical.fill").foregroundColor(.blue)
                            Text(storageData.name).foregroundColor(Color("TextColor")).multilineTextAlignment(.center)
                            
                            if (storageData.levels <= 20){
                                let levels = String(storageData.levels)
                                Text(levels)
                                    .modifier(CircleOverlay(padding: 5, frameSizeMult: 4.5))
                            }
                            else if (storageData.levels > 20){
                                Text("20+")
                                    .modifier(CircleOverlay(padding: 5, frameSizeMult: 4.5))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                if (!storageData.sets.isEmpty){
                                    storageData.active.toggle()
                                }
                            }, label: {
                                Image(systemName: storageData.active ? "chevron.down" : "chevron.up")
                                    .imageScale(.large)
                                    .foregroundStyle(.blue)
                                    .bold()
                            })

                        }
                        if (storageData.active){
                            ForEach(storageData.sets){ set in
                                
                                HStack{
                                    Text(set.name).foregroundColor(Color("TextColor")).multilineTextAlignment(.center)
                                    
                                    Spacer()
                                    
                                    if (set.level <= 50){
                                        let level = String(set.level)
                                        Text(level)
                                            .modifier(CircleOverlay(padding: 15, frameSizeMult: 8/3))
                                    }
                                    else if (set.level >= 50){
                                        Text("50+")
                                            .modifier(CircleOverlay(padding: 15, frameSizeMult: 8/3))
                                    }
                                }
                            }
                        }
                        
                    }
                }
        
        }
    }
}




struct Item: Identifiable{
    var id = UUID()
    var name: String
    var img: String
    var inBookshelf: Int?
    var shelf: Int?
    var children: [Item]?
}


struct StorageItem: Identifiable{ //I.E. Bookshelfs/Tables
    var id = UUID()
    var name: String
    var levels: Int
    var active: Bool
    var sets: [LegoSet]
}

struct LegoSet: Identifiable{
    var id = UUID()
    var name: String
    var setNum: Int
    var img: String
    var level: Int
}



struct CircleOverlay: ViewModifier{
    let padding: CGFloat
    let frameSizeMult: CGFloat
    //Use 8/3 for big and 4.5 for small
    
    func body(content: Content) -> some View {
        content
            .frame(width: 31, height: 30)
            .foregroundColor(.white)
            .background(Circle().foregroundColor(.secondary).frame(width: padding * frameSizeMult, height: padding * frameSizeMult))
            .padding(EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding))
            .font(.subheadline)
    }
}



struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
