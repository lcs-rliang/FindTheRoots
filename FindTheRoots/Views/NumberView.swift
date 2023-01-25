//
//  NumberView.swift
//  FindTheRoots
//
//  Created by dyhidrogen monoxide on 2023/1/25.
//

import SwiftUI

struct NumberView: View {
    
    let label: String
    let value: Double
    let precision: Int
    
    var body: some View {
        Text("\(label) \(value.formatted(.number.precision(.fractionLength(precision))))")
    }
    
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(label: "pi: ", value: 3.14159, precision: 1)
    }
}
