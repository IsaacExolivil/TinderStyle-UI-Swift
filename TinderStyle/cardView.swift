//
//  cardView.swift
//  TinderStyle
//
//  Created by Isaac Loez on 11/09/21.
//

import SwiftUI

struct cardView: View, Identifiable {
    let id = UUID()
    
    //extraemos nuestro person de la data
    let person: person
    
    var body: some View {
        Image(person.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0,
                   maxWidth: .infinity)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .overlay(
                VStack{
                    Text(person.name)
                        .font(.system(.title, design: .rounded))
                        //Hace el texto en negritas
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                    
                }.padding([.top, .horizontal], 20), alignment: .top
            )
    }
}

struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(person: persons[0])
    }
}
