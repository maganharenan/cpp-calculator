//
//  ContentView.swift
//  CalculatorExample
//
//  Created by Renan Maganha on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstNumber: String = ""
    @State var secondNumber: String = ""
    @State var result: String = ""
    
    var body: some View {
        VStack {
            Text("C++ Calculator")
                .font(.title)
                .padding(.top, 60)
                
            Spacer()
            
            VStack {
                HStack {
                    TextField("Enter a number", text: $firstNumber)
                        .modifier(TextFieldModifier())
                    
                    
                    TextField("Enter a number", text: $secondNumber)
                        .modifier(TextFieldModifier())
                }
                
                Text("RESULT:")
                    .font(.headline)
                    .padding(.top, 60)
                
                Text(result)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .font(.system(size: 70, weight: .bold))
                    .foregroundStyle(.blue)
                
                HStack {
                    Button {
                        self.result = getResult(for: .sum)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(BlueButton(color: .blue))
                    
                    Button {
                        self.result = getResult(for: .subtract)
                    } label: {
                        Image(systemName: "minus")
                    }
                    .buttonStyle(BlueButton(color: .pink))
                    
                    Button {
                        self.result = getResult(for: .multiply)
                    } label: {
                        Image(systemName: "multiply")
                    }
                    .buttonStyle(BlueButton(color: .cyan))
                    
                    Button {
                        self.result = getResult(for: .divide)
                    } label: {
                        Image(systemName: "divide")
                    }
                    .buttonStyle(BlueButton(color: .purple))
                }
            }
            .frame(maxHeight: .infinity)
        }
        .padding()
    }
    
    private func getResult(for operation: Operation) -> String {
        let wrapper = ObjCWrapper()
        let firstNumber = Int32(self.firstNumber) ?? 0
        let secondNumber = Int32(self.secondNumber) ?? 0
        
        switch operation {
        case .sum:
            let result = wrapper.addNumber(firstNumber, withNumber: secondNumber)
            return String( result)
        case .subtract:
            let result = wrapper.subtractNumber(firstNumber, withNumber: secondNumber)
            return String(result)
        case .multiply:
            let result = wrapper.multiplyNumber(firstNumber, withNumber: secondNumber)
            return String(result)
        case .divide:
            let result = wrapper.divideNumber(firstNumber, withNumber: secondNumber)
            return String(result)
        }
    }

}

#Preview {
    ContentView()
}

enum Operation {
    case sum
    case subtract
    case multiply
    case divide
}

struct BlueButton: ButtonStyle {
    
    var color: Color = .blue
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(width: 60, height: 60)
            .background(color)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 50)
            .multilineTextAlignment(.center)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .foregroundStyle(.secondary)
            )
    }
    
}
