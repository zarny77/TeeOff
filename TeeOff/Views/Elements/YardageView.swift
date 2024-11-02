//
//  YardagesView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

struct YardageView: View {
    
    // store yardages and pin colour
    let yds: Int
    let pin: Color
    
    // add them in an init
    init(yds: Int, pin: Color)
    {
        self.yds = yds
        self.pin = pin
    }
    var body: some View {
    
        // build circle marker with input colour and yardage
        HStack{
            Circle()
                .fill(pin)
                .frame(width: 10, height: 10)
            Text(String(yds))
                .font(.caption)
        }
    }
}

#Preview {
    YardageView(yds: 321, pin: Color.blue)
}
