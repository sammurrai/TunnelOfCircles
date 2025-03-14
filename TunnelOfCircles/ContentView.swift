//
//  ContentView.swift
//  TunnelOfCircles
//
//  Created by Sam Pugliese on 2024-05-09.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.cyan, .blue]
    @State private var depth = 20.0
    
    let minDiameter = 50.0
    let diameterChange = 70.0
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Tunnel of Circles")
                .font(.largeTitle)
                .padding()
            Text("Coolness, Baby")
                .font(.headline)
                .padding()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            ZStack {
                ForEach(0..<7) { index in
                    Circle()
                        .stroke(lineWidth: 30)
                        .foregroundStyle(colors[index % 2])
                        .frame(height: minDiameter + diameterChange * Double(index))
                        .padding3D(.back, depth)
                }
            }
            .padding(.bottom, 30)
            Grid {
                GridRow {
                    Text("Depth")
                    Slider(value: $depth, in: 0...50) {
                        Text("Depth")
                    }
                }
                GridRow {
                    Text("Colors")
                    HStack {
                        ColorPicker("Color", selection: $colors[0])
                        ColorPicker("Color", selection: $colors[1])
                        Spacer()
                    }
                    .labelsHidden()
                }
            }
            .padding(30)
            .background(.thickMaterial)
            .frame(maxWidth: 320)
        }
        .frame(minWidth: 1120, minHeight: 1120)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
