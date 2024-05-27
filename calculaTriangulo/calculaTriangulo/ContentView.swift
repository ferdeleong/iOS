//
//  calculaTrianguloApp.swift
//  calculaTriangulo
//
//  Created by Fernanda De Leon on 05/04/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var lado1 = ""
    @State var lado2 = ""
    @State var lado3 = ""
    @State var tipoTriangulo = ""
    @State var areaTriangulo = ""
    @State var showAlert = false
    @State var imgTriangulo = ""

    var body: some View {
        VStack {
            Text("Triangulos")
                .font(.largeTitle)
                .padding()

            HStack {
                Text("Lado 1:")
                TextField("", text: $lado1)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }

            HStack {
                Text("Lado 2:")
                TextField("", text: $lado2)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }

            HStack {
                Text("Lado 3:")
                TextField("", text: $lado3)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }

            Button(action: {
                guard let a = Double(lado1),
                      let b = Double(lado2),
                      let c = Double(lado3) else {
                    tipoTriangulo = ""
                    areaTriangulo = ""
                    showAlert = true
                    return
                }

                let triangulo = Triangulo(lado1: a, lado2: b, lado3: c)
                if triangulo.validarTriangulo() {
                    tipoTriangulo = triangulo.tipoTriangulo()
                    areaTriangulo = String(format: "%.2f", triangulo.area())
                } else {
                    tipoTriangulo = ""
                    areaTriangulo = ""
                    showAlert = true
                }
                
            }) {
                Image("calc")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Porfavor introducir valores validos."), dismissButton: .default(Text("OK")))
            }
            
            Image(tipoTriangulo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)

            Text("Tipo: \(tipoTriangulo)")
                .padding()

            if !areaTriangulo.isEmpty {
                Text("Area: \(areaTriangulo)")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
