//
//  ResultView.swift
//  FindTheRoots
//
//  Created by dyhidrogen monoxide on 2023/1/24.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: Stored properties
    let somePriorResult: Result
    
    // MARK: Computed Properties
    var body: some View {
        VStack(spacing: 10) {
            
            //Input values
            HStack {
              
                NumberView(label: "a =", value: somePriorResult.a, precision: 1)
                
                NumberView(label: "b =", value: somePriorResult.b, precision: 2)
                
                NumberView(label: "c =", value: somePriorResult.c, precision: 3)
            }
            
            Text(somePriorResult.roots)
                .font(Font.custom("Times New Roman", size: 20.0, relativeTo: .body))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
    }
}
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(somePriorResult: resultForPreviews)
    }
}
