//
//  ContentView.swift
//  modificadores
//
//  Created by Fernanda De León on 02/05/24.
//

import SwiftUI

struct ContentView: View {
    var opciones = ["Lun", "Mar", "Mie", "Jue", "Vie"]
    @State var opcionElegida : String = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.purple.opacity(0.4)
                VStack (alignment: .center) {
                    Image("Mickey")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 2)
                        .border(.black, width: 5)
                    
                    Picker(selection: $opcionElegida) {
                        ForEach(opciones, id: \.self) { dia in
                            Text(dia)
                        }
                    } label : {
                        Text("Elige un dia")
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
