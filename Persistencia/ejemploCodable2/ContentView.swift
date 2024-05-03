//
//  ContentView.swift
//  ejemploCodable
//
//  Created by Fernanda De León on 26/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var listaCoord = ListaCoordenadas()
    @State var muestraAgregarCoord = false
    @AppStorage("toggle") var valorToggle : Bool = false
    

    var body: some View {
        NavigationStack {
            List  {
                ForEach(listaCoord.coordenadas, id:\.id) { coord in
                    HStack {
                        Text("X: \(coord.coordx)")
                        Text("Y: \(coord.coordy)")
                    }
                    .listRowBackground(valorToggle ? Color.blue.opacity(0.2) : Color.clear)

                }
                .onDelete(perform: borraCoord)
            }
            .navigationTitle("Coordenadas")
            .toolbar {
                Button {
                    muestraAgregarCoord = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            Toggle("On/Off", isOn: $valorToggle)
                .disabled(false)
            .sheet(isPresented: $muestraAgregarCoord) {
                AgregaCoordenada(listaCoord: listaCoord)
            }
            .padding(20)
        }
    }
    
    func borraCoord(at offsets: IndexSet) {
        listaCoord.coordenadas.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
