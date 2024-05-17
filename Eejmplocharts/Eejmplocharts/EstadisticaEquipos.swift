//
//  EstadisticaEquipos.swift
//  Eejmplocharts
//
//  Created by Fernanda De León on 17/05/24.
//

import SwiftUI
import Charts

struct EstadisticaEquipos: View {
    
    @State var listaEquipos = [
        Equipo(nombre: "Santa Fe", puntos: 8),
        Equipo(nombre: "Escuela 5", puntos: 10),
        Equipo(nombre: "Borregos", puntos: 7),
        
    ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(listaEquipos, id:\.self.nombre) { equipo in
                    BarMark(x: .value("Nombre del Equipo", equipo.nombre),
                            y: .value("Puntos", equipo.puntos))
                }
            }
            .frame(height: 300)
            .padding(30)
            
            Chart {
                ForEach(listaEquipos, id:\.self.nombre) { equipo in
                    PointMark(x: .value("Nombre del Equipo", equipo.nombre),
                            y: .value("Puntos", equipo.puntos))
                }
            }
            .frame(height: 300)
            .padding(30)
            .foregroundStyle(.purple)
            .chartLegend(.visible)
            .chartXAxisLabel("Equipos", alignment: .center, spacing: 0)
            .chartYAxisLabel("Puntos", spacing: 10)
        }
        
    }
}

#Preview {
    EstadisticaEquipos()
}
