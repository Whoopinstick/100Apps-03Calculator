//
//  CalcButtonModifier.swift
//  03 - Calc
//
//  Created by Kevin Paul on 7/26/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct CalcButtonModifier: ViewModifier {
    var fgColor: Color
    var bgColor: Color
    func body(content: Content) -> some View {
        content
            .buttonStyle(PlainButtonStyle())
            .contentShape(Circle())
            .foregroundColor(fgColor)
            .background(bgColor)
            .clipShape(Circle())
    }
    
}







extension View {
    func calcButton(fgColor: Color, bgColor: Color) -> some View {
        self.modifier(CalcButtonModifier(fgColor: fgColor, bgColor: bgColor))
    }
}
