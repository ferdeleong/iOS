//
//  AgregaEmpleado.swift
//  ejemploCodable2
//
//  Created by Fernanda De León on 26/04/24.
//

import SwiftUI

struct AgregaEmpleado: View {
    @Environment(\.dismiss) var quitaVista
    @ObservedObject var listaEmp : ListaEmpleados
    
    @State var nombre : String = ""
    @State var sueldo : Double = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Sueldo", value: $sueldo, format:
                        .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                Button("Guardar") {
                    let emp = Empleado(nombre: nombre, sueldo: sueldo)
                    listaEmp.empleados.append(emp)
                    quitaVista()
                }
            }
            .navigationTitle("Empleado")
        }
    }
}

#Preview {
    AgregaEmpleado(listaEmp: ListaEmpleados())
}
