//
//  ContentView.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    ///Since the response is an array of WeatherModel object
    @State private var results = [WeatherModel]()
    /// dictionary for resuls
    @State private var dictionary = [0: 0, 1:0, 2: 0, 3: 0, 4: 0, 5:0, 6:0, 7:0]
    ///varaible to change the state in buttom
    @State private var isSharePresented: Bool = false

    var body: some View {
        
        ScrollView{
            ///Structure Stack for currentdata
            VStack{
                ForEach(results, id: \.id) { result in
                    VStack{
                        VStack{
                            switch Int(result.currentWeather.temperature) {
                            case -20...(-10):
                                Image(systemName: "thermometer.snowflake").font(.system(size: 100))
                            case -10...0:
                                Image(systemName: "thermometer.low").font(.system(size: 100))
                            case 0...10:
                                Image(systemName: "cloud.sun.fill").font(.system(size: 100))
                            case 10...20:
                                Image(systemName: "sun.max.fill").font(.system(size: 100))
                            case 20...30:
                                Image(systemName: "thermometer.sun.fill").font(.system(size: 100))
                            default:
                                Image(systemName: "thermometer.low").font(.system(size: 100))
                            }
                        }
                        
                        Spacer()
                        
                        Text("\(String(format: "%.1f",result.currentWeather.temperature)) °C").font(.custom("Helvetica", size: 56)) .padding(10)
                        VStack{
                            Text("Potsdam").font(.title)
                            Text("(\(String(format: "%.1f", result.latitude)), \(String(format:"%.1f", result.longitude)))").font(.footnote)
                            Text("\(Date.now, format: .dateTime.weekday())")
                        }
                    }
              ///Structure Stack for Forecas
                    VStack{
                        HStack{
                            Text("7 day Forecas").font(.title3)
                            Spacer()
                        }.padding()
                        HStack{
                            Text("Minimum").padding(.horizontal, 20)
                            Spacer()
                            Text("Maximum").padding(.horizontal, 20)
                            
                        }
                        ForEach(1..<8) { index in
                            HStack{
                                    HStack{
                                        Text("\(String(format: "%.1f",result.daily.temperature2MMin[index])) °C ").padding(10)
                                        Spacer()
                                        Text("\(String(format: "%.1f",result.daily.temperature2MMax[index])) °C ").padding(10)
                                    }
                                    .onTapGesture {
                                        self.isSharePresented = true
                                        self.dictionary[index]! += 1
                                        print(dictionary.sorted(by: { $1.key > $0.key }))
                                    }
                                    .sheet(isPresented: $isSharePresented, onDismiss: {
                                        self.isSharePresented = false
                                        print("Dismiss")
                                    }, content: {
                                        ActivityViewController(activityItems: ["Weather Forecast: \nDay: \(result.daily.time[index]), \nMin temp: \(result.daily.temperature2MMin[index]), \nMax temp: \(result.daily.temperature2MMax[index])"])
                                    })
                            }.padding(.horizontal, 10)
                        }
                    }.padding(10)
                }
            ///calling the Api method
            }.padding().onAppear() {
                print("Check point")
                WeatherService().getDate { (results) in
                    self.results = results
                    print("Api Done")
                    print(dictionary)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
