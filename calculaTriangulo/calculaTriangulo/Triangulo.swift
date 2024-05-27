//
//  File.swift
//  TrianguloApp
//
//  Created by Alumno on 05/04/24.
//

import Foundation

class Triangulo {
    var lado1: Double
    var lado2: Double
    var lado3: Double
    
    init(lado1: Double, lado2: Double, lado3: Double) {
        self.lado1 = lado1
        self.lado2 = lado2
        self.lado3 = lado3
    }
    
    func area() -> Double {
        let s = (lado1 + lado2 + lado3) / 2
        let area = sqrt(s * (s - lado1) * (s - lado2) * (s - lado3))
        return area
    }
    
    func validarTriangulo() -> Bool {
        if lado1 > 0 && lado2 > 0 && lado3 > 0
            && (lado1 + lado2 > lado3) && (lado1 + lado3 > lado2) && (lado2 + lado3 > lado1) {
            return true
        } else {
            return false
        }
    }
    
    func tipoTriangulo() -> String {
        if validarTriangulo() {
            if lado1 == lado2 && lado1 == lado3 {
                return "Equilatero"
            } else if lado1 == lado2 || lado1 == lado3 || lado2 == lado3 {
                return "Isosceles"
            } else {
                return "Escaleno"
            }
        } else {
            return "No es un triángulo válido"
        }
    }
}
