//
//  AgregaEmpleado.swift
//  ejemploCodable2
//
//  Created by Fernanda De León on 26/04/24.
//

import SwiftUI

struct AgregaCoordenada: View {
    @Environment(\.dismiss) var quitaVista
    @ObservedObject var listaCoord : ListaCoordenadas
    
    @State var coordx : Int = 0
    @State var coordy : Int = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Coordenada X", value: $coordx, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                TextField("Coordenada Y", value: $coordy, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                Button("Guardar") {
                    let coord = Coordenada(coordx: coordx, coordy: coordy)
                    listaCoord.coordenadas.append(coord)
                    quitaVista()
                }
            }
            .navigationTitle("Agrega Coordenada")
        }
    }
}

#Preview {
    AgregaCoordenada(listaCoord: ListaCoordenadas())
}
