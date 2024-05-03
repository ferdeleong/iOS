//
//  SwiftUIView.swift
//  modificadores
//
//  Created by Fernanda De León on 02/05/24.
//

import SwiftUI
import Foundation

struct SwiftUIView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                AsyncImage(url: URL(string: "https://imgs.search.brave.com/BUKEBtxD7O_Ks4pKIqSR2HrgqT-dbklZV6SBAfL58_o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE4/NDY1NDg0OS9waG90/by9wdXBweS1ydW5u/aW5nLWF0LXRoZS1w/YXJrLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1XVnJKejVF/SFYxNTZmeFN3LWJ6/OXpZVHp4QjZYY2l4/LUFna1dDLXBORng4/PQ")) {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    ProgressView()
                }
            }
            .padding()
            .frame(width: geo.size.width / 2)
            .frame(width: geo.size.width)
        }
    }
}

#Preview {
    SwiftUIView()
}
