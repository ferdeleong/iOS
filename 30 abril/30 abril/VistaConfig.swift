//
//  VistaConfig.swift
//  30 abril
//
//  Created by Fernanda De León on 30/04/24.
//

import SwiftUI

struct VistaConfig: View {
    @AppStorage("nombre") var nombre: String = "hola"
    @AppStorage("toggle") var valorToggle : Bool = false
    @AppStorage("slider")  var valorSlider : Double = 0.5
    
    var body: some View {
        VStack {
            Text("Configuracion de la aplicacion")
                .font(.title2)
                .padding(.bottom, 50)
            TextField("Nombre ", text: $nombre)
                .textFieldStyle(.roundedBorder)
            Toggle("On/Off", isOn: $valorToggle)
            Slider(value: $valorSlider)
        }
        padding(20)
    }
}

#Preview {
    VistaConfig()
}
