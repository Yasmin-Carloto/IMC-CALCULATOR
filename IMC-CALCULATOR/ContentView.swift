//
//  ContentView.swift
//  IMC-CALCULATOR
//
//  Created by Yasmin Carloto on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var weight: String = ""
    @State var height: String = ""
    @State var imcResult: String = "Informe seus dados!"
    
    var body: some View {
        VStack(alignment: .leading){
            Label("Calculadora IMC", image: "globe")
                .labelStyle(.titleOnly)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.leading)
            
            VStack{
                TextField("Peso (Kg)", text: $weight)
                    .padding(.vertical, 10)
                    .padding(.bottom, 10)
                    .overlay{
                        Divider()
                            .background(Color.mint)
                            .offset(x: 0, y: 15)
                        }
                
                TextField("Altura (cm)", text: $height)
                    .padding(.vertical, 10)
                    .padding(.bottom, 10)
                    .overlay(VStack{
                        Divider()
                            .background(Color.mint)
                            .offset(x: 0, y: 15)
                    })
            }
            .padding(.top, 30)
            .padding(.bottom, 30)
            
            Button("Calcular", systemImage: "arror.up") {
                if let heightNumber = Float(height), let weightNumber = Float(weight){
                    let doubleHeight = heightNumber*heightNumber
                    let imc = weightNumber/doubleHeight
                    imcResult = "O resultado do seu IMC é \(String(format: "%.2f", imc))"
                }else{
                    imcResult = "Você precisa preencher todos os campos antes de calcular o IMC."
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(Color.mint)
            .cornerRadius(20)
            .foregroundColor(Color.black)

            Text(imcResult)
                .frame(maxWidth: .infinity)
                .padding(20)
                .foregroundColor(Color.mint)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 800)
        .padding()
    }
}

#Preview {
    ContentView()
}
