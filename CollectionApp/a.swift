//
//  a.swift
//  CollectionApp
//
//  Created by Ayaan Irshad on 1/23/23.
//

import SwiftUI
import PhotosUI

struct a: View {
    @State var sel: PhotosPickerItem? = nil
    var body: some View {
        
                PhotosPicker(selection: $sel,
                             matching: .images,
                             photoLibrary: .shared()) {
                }
                
            
    }
}

struct a_Previews: PreviewProvider {
    static var previews: some View {
        a()
    }
}
