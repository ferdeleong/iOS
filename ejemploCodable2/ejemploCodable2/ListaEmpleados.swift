//
//  ListaEmpleados.swift
//  ejemploCodable
//
//  Created by Fernanda De León on 26/04/24.
//

import Foundation

class ListaEmpleados : ObservableObject {
    @Published var empleados = [Empleado]() {
        didSet {
            if let codificado = try? JSONEncoder().encode(empleados) {
                try? codificado.write(to: rutaArchivo())
            }
            else {
                print("error al codificar")
            }
        }
    }
    
    init() {
        if let datosRecuperados = try? Data.init(contentsOf: rutaArchivo()) {
            if let datosDecodificados = try? JSONDecoder().decode([Empleado].self, from: datosRecuperados) {
                empleados = datosDecodificados
                return
            } else {
                print("error al codificar")
            }
        }
        empleados = []
    }
    
    func rutaArchivo() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Empleado.JSON")
        return pathArchivo
    }
}
