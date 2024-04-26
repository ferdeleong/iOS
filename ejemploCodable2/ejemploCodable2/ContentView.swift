//
//  ContentView.swift
//  ejemploCodable
//
//  Created by Fernanda De León on 26/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var listaEmp = ListaEmpleados()
    @State var muestraAgregarEmp = false

    var body: some View {
        NavigationStack {
            List  {
                ForEach(listaEmp.empleados, id:\.nombre) { emp in
                    Text(emp.nombre)
                }
                .onDelete(perform: borraEmp)
            }
            .navigationTitle("Lista Empleados")
            .toolbar {
                Button {
                    muestraAgregarEmp = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $muestraAgregarEmp) {
                AgregaEmpleado(listaEmp: listaEmp)
            }
        }
    }
    
    func borraEmp(at offsets: IndexSet) {
        listaEmp.empleados.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
