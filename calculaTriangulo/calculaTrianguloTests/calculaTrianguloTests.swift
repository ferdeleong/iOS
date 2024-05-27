//
//  calculaTrianguloTests.swift
//  calculaTrianguloTests
//
//  Created por Fernanda De León el 23/05/24.
//

import XCTest
@testable import calculaTriangulo

final class calculaTrianguloTests: XCTestCase {
    
    var triangulo: Triangulo!

    override func setUpWithError() throws {
        // Configuración del entorno antes de la invocación de cada método de prueba.
    }

    override func tearDownWithError() throws {
        // Desmontaje del entorno después de la invocación de cada método de prueba.
        triangulo = nil
    }

    func testTrianguloEquilatero() throws {
        triangulo = Triangulo(lado1: 2, lado2: 2, lado3: 2)
        XCTAssertTrue(triangulo.validarTriangulo(), "El triángulo debería ser válido")
        XCTAssertEqual(triangulo.tipoTriangulo(), "Equilatero", "El triángulo debería ser equilátero")
    }

    func testTrianguloIsosceles() throws {
        triangulo = Triangulo(lado1: 2, lado2: 2, lado3: 3)
        XCTAssertTrue(triangulo.validarTriangulo(), "El triángulo debería ser válido")
        XCTAssertEqual(triangulo.tipoTriangulo(), "Isosceles", "El triángulo debería ser isósceles")
    }

    func testTrianguloEscaleno() throws {
        triangulo = Triangulo(lado1: 3, lado2: 4, lado3: 5)
        XCTAssertTrue(triangulo.validarTriangulo(), "El triángulo debería ser válido")
        XCTAssertEqual(triangulo.tipoTriangulo(), "Escaleno", "El triángulo debería ser escaleno")
    }

    func testTrianguloInvalido() throws {
        triangulo = Triangulo(lado1: 1, lado2: 1, lado3: 3)
        XCTAssertFalse(triangulo.validarTriangulo(), "El triángulo debería ser inválido")
        XCTAssertEqual(triangulo.tipoTriangulo(), "No es un triángulo válido", "El triángulo debería ser inválido")
    }

    func testAreaTriangulo() throws {
        triangulo = Triangulo(lado1: 3, lado2: 4, lado3: 5)
        let area = 6.0
        XCTAssertEqual(triangulo.area(), area, accuracy: 0.0001, "El área del triángulo debería ser 6.0")
    }

    func testEjemploRendimiento() throws {
        // Este es un ejemplo de una prueba de rendimiento.
        measure {
            // Código que se quiere medir el tiempo de ejecución.
        }
    }
}
