//
//  TextVeiws.swift
//  Bullseye
//
//  Created by d vasylenko on 05.02.2022.
//

import SwiftUI

struct InstructuionText: View {
    var text: String
    
    var body: some View {
        
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text (text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLableText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextViewColor"))
    }
}

struct TextVeiws_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        InstructuionText(text: "Instructions")
        BigNumberText(text: "999")
        }
    }
}
