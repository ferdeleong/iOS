//
//  ContentView.swift
//  Eejmplocharts
//
//  Created by Fernanda De León on 17/05/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        Chart {
            BarMark(x: .value("Catelgoria", "verde"),
                    y: .value("Valor", 12))
            .foregroundStyle(.green)
            BarMark(x: .value("Catelgoria", "azul"),
                    y: .value("Valor", 18))
            .foregroundStyle(.blue)
            BarMark(x: .value("Catelgoria", "amarillo"),
                    y: .value("Valor", 50))
            .foregroundStyle(.yellow)
        }
        .padding()
        .frame(height: 300)
        
        Chart {
            LineMark(x: .value("Mes", "Enero"), y: .value("Valor", 70))
            LineMark(x: .value("Mes", "Febrero"), y: .value("Valor", 120))
            LineMark(x: .value("Mes", "Marzo"), y: .value("Valor", 90))
            LineMark(x: .value("Mes", "Abril"), y: .value("Valor", 100))
        }
        .border(.black)
        .padding()
        .chartYScale(domain: 60...130)
        
        Chart {
            PointMark(x: .value("Nivel", "A"), y: .value("Cantidad", 1.5))
            PointMark(x: .value("Nivel", "B"), y: .value("Cantidad", 2.2))
            PointMark(x: .value("Nivel", "C"), y: .value("Cantidad", 0.9))
            PointMark(x: .value("Nivel", "D"), y: .value("Cantidad", 1.7))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
