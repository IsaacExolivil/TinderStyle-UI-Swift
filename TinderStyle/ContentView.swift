//
//  ContentView.swift
//  TinderStyle
//
//  Created by Isaac Loez on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            
        TopBarView()
        cardView(person: persons[0]).background(Color.init(CGColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)))
            BottomBarView().background(Color.init(CGColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.sizeThatFits)
        }
    }
}
struct TopBarView: View {
    var body: some View {
        HStack{
            
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
            Spacer()
            Image("tinder")
                .resizable()
                .frame(width: 160, height: 50, alignment: .top)
            Spacer()
            Image(systemName: "message")
                .font(.system(size: 35))
                
            
        }.padding(15)
    }
}

struct BottomBarView: View {
    var body: some View {
        HStack{
            Image("regresar")
                
                .resizable()
                .frame(width: 60, height: 60, alignment: .top)
            Spacer()
            Image("cancel")
                
                .resizable()
                .frame(width: 70, height: 70, alignment: .top)
           
            
            Image("rayo")
                
                .resizable()
                .frame(width: 70, height: 70, alignment: .top)
            Spacer()
            Image("item")
                .resizable()
                .frame(width: 80, height: 70, alignment: .top)
            Spacer()
            Image("estrella")
                .resizable()
                .frame(width: 80, height: 70, alignment: .top)
            
        }.padding(15)
        
    }
}
