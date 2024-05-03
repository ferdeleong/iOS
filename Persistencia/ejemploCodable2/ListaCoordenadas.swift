//
//  ListaEmpleados.swift
//  ejemploCodable
//
//  Created by Fernanda De León on 26/04/24.
//

import Foundation

class ListaCoordenadas : ObservableObject {
    @Published var coordenadas = [Coordenada]() {
        didSet {
            if let codificado = try? JSONEncoder().encode(coordenadas) {
                try? codificado.write(to: rutaArchivo())
            }
            else {
                print("error al codificar")
            }
        }
    }
    
    init() {
        if let datosRecuperados = try? Data.init(contentsOf: rutaArchivo()) {
            if let datosDecodificados = try? JSONDecoder().decode([Coordenada].self, from: datosRecuperados) {
                coordenadas = datosDecodificados
                return
            } else {
                print("error al codificar")
            }
        }
        coordenadas = []
    }
    
    func rutaArchivo() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Coordenadas.JSON")
        return pathArchivo
    }
}
