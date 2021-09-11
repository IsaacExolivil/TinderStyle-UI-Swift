//
//  ContentView.swift
//  TinderStyle
//
//  Created by Isaac Loez on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    
    private let threshold: CGFloat = 100
    
    @GestureState private var dragStyle = DragStyle.none
    
    //Variable de mazo = deck
    var deck : [cardView] = {
        var cards = [cardView]()
        
        for idx in 0..<2{
            cards.append(cardView(person: persons[idx]))
        }
        return cards
        
    }()
    
    var body: some View {
        VStack{
        TopBarView()
                Spacer(minLength: 10)
            ZStack{
                ForEach(deck) { card in
                    card
                        .zIndex(self.isTopCard(card: card) ? 1 : 0)
                        .overlay(
                            ZStack{
                                //Aparece animacion de que hizo el suuario si cancelar o darle like
                                Image("cancel")
                                    .background(Color.red)
                                    .foregroundColor(.black)
                                    .font(.system(size: 120))
                                    .opacity(self.dragStyle.translation.width <
                                                -self.threshold && self.isTopCard(card: card) ? 1: 0)
                                
                                
                                Image("item")
                                    .foregroundColor(.white)
                                    .font(.system(size: 120))
                                    .opacity(self.dragStyle.translation.width > self.threshold && self.isTopCard(card: card) ? 1 : 0)
                                
                            }
                        )
                        //añadimos animaciones
                        .offset(x: self.isTopCard(card: card) ? self.dragStyle.translation.width : 0,
                                y: self.isTopCard(card: card) ? self.dragStyle.translation.height : 0)
                        .scaleEffect(self.dragStyle.isDragging && self.isTopCard(card: card) ? 0.9 : 1.0)
                        .rotationEffect(Angle(degrees: Double( self.isTopCard(card: card) ? self.dragStyle.translation.width/20 : 0)))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 100))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                        .sequenced(before: DragGesture())
                           .updating(self.$dragStyle, body: {(value, state, transaction) in
                                switch value {
                                 case .first(true):
                                state = .pressing
                                case .second(true, let drag):
                                  state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                             }
                            
                          })
                        
                        )
                }
                
            }
        
            BottomBarView().background(Color.init(CGColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)))
                // opaca al momento de selecionar la tarjeta //
                .opacity(self.dragStyle.isDragging ? 0.1 : 1.0)
                .animation(.linear)
        }
        
    }
    
    private func isTopCard(card: cardView) ->Bool{
        guard let idx = deck.firstIndex(where: {$0.id == card.id})
        else {
            return false
        }
        return idx == 0
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
