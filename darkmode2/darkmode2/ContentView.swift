//
//  ContentView.swift
//  darkmode2
//
//  Created by Fernanda De León on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var mostrarModal = false
    @State var mostrarFullScreen = false
    @State var mostrarPopOver = false

    
    var body: some View {
        VStack {
            Button {
                mostrarModal = true
            } label: {
                Text("Vista Modal")
                    .font(.largeTitle)
            }
            Button {
                mostrarFullScreen = true
            } label : {
                Text("Vista Full Screen")
                    .font(.largeTitle)
            }
            Button {
                mostrarPopOver = true
            } label : {
                Text("Vista Pop Over")
                    .font(.largeTitle)
            }
        }
        .popover(isPresented: $mostrarPopOver) {
            vistaPopOver()
        }
        .fullScreenCover(isPresented: $mostrarFullScreen) {
            vistaFullScreen()
        }
        .sheet(isPresented: $mostrarModal) {
            vistaModal()
                .presentationDetents([.medium, .large, .fraction(0.15)])
        }
    }
}

struct vistaModal : View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.pink
            VStack {
                Text("Modal")
                    .font(.largeTitle)
                Button {
                    dismiss()
                } label: {
                    Text("Regresar")
                        .font(.largeTitle)
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct vistaFullScreen : View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.cyan
            VStack {
                Text("Full Screen")
                    .font(.largeTitle)
                Button {
                    dismiss()
                } label: {
                    Text("Regresar")
                        .font(.largeTitle)
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct vistaPopOver : View {
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("Pop Over")
                    .font(.largeTitle)
            }
        }
        .frame(width: 200, height: 200)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
