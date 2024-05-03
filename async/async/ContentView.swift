//
//  ContentView.swift
//  async
//
//  Created by Fernanda De León on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var datosNASA = NasaInfo(title: "-", url: "-")
    @State var foto = Image(systemName: "person")
    @State var fecha = Date()
    
    var body: some View {
        VStack {
            Text(datosNASA.title)
                .font(.title)
            DatePicker("Elige una fecha", selection: $fecha, displayedComponents: .date)
            foto
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
        }
        .padding()
        .onAppear() {
            Task {
                await obtenerDatos()
            }
        }
        .onChange(of: fecha) {
            Task {
                await obtenerDatos()
            }
        }
    }
    
    func obtenerDatos() async {
        guard var url = URL(string: "https://api.nasa.gov/planetary/apod")
        else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fechaStr = formatter.string(from: fecha)
        
        url.append(queryItems: [
            URLQueryItem(name: "api_key", value: "DEMO_KEY"),
            URLQueryItem(name: "date", value: fechaStr)
        ])
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(NasaInfo.self, from: data) {
                datosNASA = decodedData
                cargaFoto()
            }
        }
        
        catch {
            print("Error al traer los datos")
        }
    }
    
    func cargaFoto() {
        guard let urlFoto = URL(string: datosNASA.url)
        else {
            return
        }
        
        if let unaFoto = try? Data(contentsOf: urlFoto) {
            if let uiimage = UIImage(data: unaFoto) {
                foto = Image(uiImage: uiimage)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
