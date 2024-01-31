//
//  ContentView.swift
//  ConverterExercise
//
//  Created by Liko Setiawan on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputTemperature = 0
    @State private var typeConverter = "Celcius"
    @State private var outputConverter = "Fahrenheit"
    let typeConverters = ["Celcius", "Fahrenheit", "Kelvin"]
    @State private var result = 0.0
    
    var resultConvertFahrenheit : Double {
        let inputTemperature = Double(inputTemperature)
        var result = result
        
        if typeConverter == "Celcius" && outputConverter == "Fahrenheit"{
            result = inputTemperature * 9/5 + 32
        }else if typeConverter == "Celcius" && outputConverter == "Kelvin"{
            result = inputTemperature + 273.15
        }else if typeConverter == "Fahrenheit" && outputConverter == "Celcius"{
            result = (inputTemperature - 32) * 5/9
        }else if typeConverter == "Fahrenheit" && outputConverter == "Kelvin"{
            result = (inputTemperature - 32) * 5/9 + 273.15
        }else if typeConverter == "Kelvin" && outputConverter == "Celcius"{
            result = inputTemperature - 273.15
        }else if typeConverter == "Kelvin" && outputConverter == "Fahrenheit"{
            result = (inputTemperature - 273.15 ) * 9/5 + 32
        }
        else{
            return inputTemperature
        }
        
        return result
    }
    
    
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Input Temp", value : $inputTemperature, format : .number )
                    
                    Picker("Type", selection : $typeConverter){
                        ForEach(typeConverters, id : \.self ){type in
                            Text("\(type)")
                        }
                    }
                }
                
                Section("Convert To :"){
                    Picker("Convert", selection : $outputConverter){
                        ForEach(typeConverters, id : \.self){ output in
                            Text("\(output)")
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section("Hasil Conversi Fahrenheit"){
                    Text(resultConvertFahrenheit, format : .number)
                    
                    
                }
            }
            .navigationTitle("Temp Converter")
        }
        
    }
}

#Preview {
    ContentView()
}
