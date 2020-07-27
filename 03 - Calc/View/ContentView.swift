//
//  ContentView.swift
//  03 - Calc
//
//  Created by Kevin Paul on 7/21/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0.0
    @State private var secondNumber = 0.0
    @State private var numberText = "0"
    @State private var inTypingMode = true
    @State private var selectedOperator = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Colors.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if self.inTypingMode {
                            Text("\(self.numberText)")
                                .font(.system(size: 60))
                                .foregroundColor(.white)
                                .padding(.trailing, geo.size.width / 20)
                        } else {
                            Text("\(self.number, specifier: "%g")")
                                .font(.system(size: 60))
                                .foregroundColor(.white)
                                .padding(.trailing, geo.size.width / 20)
                        }
                        
                    }
                    .padding()
                    
                    HStack {
                        Button("AC") {
                            self.number = 0.0
                            self.secondNumber = 0.0
                            self.numberText = "0"
                            self.inTypingMode = true
                            self.selectedOperator = ""
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .primary, bgColor: Colors.lightGray)
                        
                        Button("+/-") {
                            self.number *= -1
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .primary, bgColor: Colors.lightGray)
                        
                        
                        Button("%") {
                            if self.number != 0 {
                                self.number *= 0.01
                                self.secondNumber = 0.0
                                self.numberText = String(self.number)
                            }
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .primary, bgColor: Colors.lightGray)
                        
                        Button("/") {
                            self.operatorPressed("/")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.yellow)
                        
                    }
                    .padding([.top, .bottom], geo.size.height / 100)
                    
                    HStack {
                        Button("7") {
                            self.numberPressed("7")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("8") {
                            self.numberPressed("8")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        
                        Button("9") {
                            self.numberPressed("9")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("X") {
                            self.operatorPressed("*")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.yellow)
                        
                    }
                    .padding([.top, .bottom], geo.size.height / 100)
                    
                    HStack {
                        Button("4") {
                            self.numberPressed("4")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("5") {
                            self.numberPressed("5")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        
                        Button("6") {
                            self.numberPressed("6")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("-") {
                            self.operatorPressed("-")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.yellow)
                        
                    }
                    .padding([.top, .bottom], geo.size.height / 100)
                    
                    HStack {
                        Button("1") {
                            self.numberPressed("1")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("2") {
                            self.numberPressed("2")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        
                        Button("3") {
                            self.numberPressed("3")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("+") {
                            self.operatorPressed("+")
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.yellow)
                        
                    }
                    .padding([.top, .bottom], geo.size.height / 100)
                    
                    HStack {
                        Button("0") {
                            self.numberPressed("0")
                        }
                        .frame(width: geo.size.width * 0.42, height: geo.size.height * 0.1)
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Rectangle())
                        .foregroundColor(Color.white)
                        .background(Colors.darkGray)
                        .clipShape(Rectangle())
                        .cornerRadius(35.0)
                        
                        Button(".") {
                            if self.inTypingMode {
                                if self.numberText.contains(".") {
                                    //
                                } else {
                                    self.numberText.append(".")
                                }
                            }
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.darkGray)
                        
                        Button("=") {
                            if self.selectedOperator == "/" {
                                self.number = self.number / Double(self.numberText)!
                            } else if self.selectedOperator == "*" {
                                self.number = self.number * Double(self.numberText)!
                            } else if self.selectedOperator == "-" {
                                self.number = self.number - Double(self.numberText)!
                            } else if self.selectedOperator == "+" {
                                self.number = self.number + Double(self.numberText)!
                            }
                            
                            self.secondNumber = 0.0
                            self.numberText = String(self.number)
                            self.inTypingMode = false
                            self.selectedOperator = ""
                            
                        }
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                        .calcButton(fgColor: .white, bgColor: Colors.yellow)
                        
                    }
                    .padding([.top, .bottom], geo.size.height / 100)
                    
                }
                
                
                
            }
        }
    }
    
    func numberPressed(_ value: String) {
        if self.inTypingMode && value != "0" {
            if self.numberText == "0" {
                self.numberText = value
            } else {
                self.numberText.append(value)
            }
        }
        
        if self.inTypingMode && value == "0" {
            if self.numberText == "0" {
            } else {
                self.numberText.append("0")
            }
        }
           
    }
    
    func operatorPressed(_ value: String) {
           self.inTypingMode = true
           self.selectedOperator = value
           self.number = Double(self.numberText)!
           self.numberText = "0"
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
