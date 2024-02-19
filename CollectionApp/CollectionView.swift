//
//  CollectionView.swift
//  CollectionApp
//
//  Created by Ayaan Irshad on 1/19/23.
//

import SwiftUI


struct CollectionView: View {
    @State var active = false
    
    @State var AllData: [Item] = [
        Item(name: "Bookshelf1", img: "books.vertical.fill", inBookshelf: 6, children: [Item(name: "LegoSet1", img: "octagon.fill", shelf: 5),
        Item(name: "LegoSet2", img: "octagon.fill", shelf: 4)]),
        
        Item(name: "Bookshelf2", img: "books.vertical.fill", inBookshelf: 5, children: [Item(name: "OtherSet1", img: "octagon.fill", shelf: 4),
        Item(name: "OtherSet2", img: "octagon.fill", shelf: 3)])
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
                            SheetView(active: $active, itemData: $AllData)
                        }
                        

                        
                    }.padding()
                    
                
                    List(AllData, children: \.children){ bookData in
                        HStack{
                            Image(systemName: bookData.img).foregroundColor(.blue)
                            Text(bookData.name).foregroundColor(Color("TextColor")).multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            if (bookData.inBookshelf != nil && bookData.inBookshelf ?? 0 <= 50){
                                let shelfs = String(bookData.inBookshelf ?? 0)
                                Text(shelfs)
                                    .modifier(CircleOverlay(padding: 15, frameSizeMult: 8/3))
                            }
                            else if (bookData.inBookshelf != nil && bookData.inBookshelf ?? 0 >= 50){
                                Text("50+")
                                    .modifier(CircleOverlay(padding: 15, frameSizeMult: 8/3))
                            }
                            
                            if (bookData.shelf != nil && bookData.shelf ?? 0 <= 20){
                                let shelfs = String(bookData.shelf ?? 0)
                                Text(shelfs)
                                    .modifier(CircleOverlay(padding: 5, frameSizeMult: 4.5))
                            }
                            else if (bookData.shelf != nil && bookData.shelf ?? 0 > 20){
                                Text("20+")
                                    .modifier(CircleOverlay(padding: 5, frameSizeMult: 4.5))
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
    @State var ba: Bool = false
    static var previews: some View {
        CollectionView()
    }
}
