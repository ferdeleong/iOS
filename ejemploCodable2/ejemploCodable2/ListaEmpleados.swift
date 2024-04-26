//
//  ListaEmpleados.swift
//  ejemploCodable
//
//  Created by Fernanda De León on 26/04/24.
//

import Foundation

class ListaEmpleados : ObservableObject {
    @Published var empleados = [Empleado]()
    
    init() {
        let empDummy = Empleado(nombre: "dummy", sueldo: 2345)
        empleados.append(empDummy)
    }
}
