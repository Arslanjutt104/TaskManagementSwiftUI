//
//  HeaderView.swift
//  TaskManagementSwiftUI
//
//  Created by Mac on 21/09/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        //MARK: header View
        
        HStack{
            VStack(alignment:.leading ,spacing: 10){
                Text(Date().formatted(date: .abbreviated , time: .omitted)).foregroundColor(.gray)
                
                Text("Today").font(.largeTitle).fontWeight(.bold)
            }//:VSTACK
            .padding(.top,getSaveArea().top)
            .hLeading()
            
            Button {
                print("Profile")
            } label: {
                Image("profile").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45  ,height: 45)
                    .clipShape(Circle())
            }
            
        }//:HSTACK
        
        .padding()
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().previewLayout(.sizeThatFits)
    }
}
