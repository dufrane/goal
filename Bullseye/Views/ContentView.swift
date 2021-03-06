//
//  ContentView.swift
//  Bullseye
//
//  Created by d vasylenko on 05.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        ZStack {
            Color( "BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                InstructionsView (game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                
                
            }
        }
    }
}



struct InstructionsView: View{
    @Binding var game: Game
    var body: some View {
        VStack{
        InstructuionText(text: "🎯🎯🎯\n Put the Bullseye as close as you can to")
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
        BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View{
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLableText(text: "1")
        
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLableText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View{
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            alertIsVisible = true
            }
        )
        {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(11.0)
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(sliderValue.rounded())
            return Alert(title: Text("Hello There!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue:roundedValue)) points this round"), dismissButton: .default(Text("Awsome!"))
                )
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
