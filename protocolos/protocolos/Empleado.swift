//
//  Empleado.swift
//  protocolos
//
//  Created by Fernanda De León on 26/04/24.
//

import Foundation

class Empleado : CustomStringConvertible, Equatable, Comparable, Codable {
    
    var
}

listaEmp.sort(by: >)

for emp in listaEmp {
    print(emp)
}

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(listaEmp),
   let jsonString = String(data: jsonData, encoding: .utf8)
    print(jsonString)
}

let plistEncoder = PropertyListEncoder()
plistEncoder.outputFormat = .xml
if let plistData = try? plistEncoder.encode(listaEmp),
   let plistString = String(data: plistData, encoding: .utf8) {
    print(plistString)
}
