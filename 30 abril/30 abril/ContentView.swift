//
//  ContentView.swift
//  30 abril
//
//  Created by Fernanda De León on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("nombre") var nombre: String = "hola"
    @AppStorage("toggle") var valorToggle : Bool = false
    @AppStorage("slider")  var valorSlider : Double = 0.5
    @State var mostrarConfig = false

    
    var body: some View {
        VStack {
            Text(nombre)
                .font( .title)
            Toggle("On/Off", isOn: $valorToggle)
                .disabled(true)
            Slider(value: $valorSlider)
                .disabled(true)
            Button("Configuracion") {
                mostrarConfig = true
            }
        }
        .padding(20)
        .sheet(isPresented: $mostrarConfig) {
            VistaConfig()
        }
    }
}

#Preview {
    ContentView()
}
