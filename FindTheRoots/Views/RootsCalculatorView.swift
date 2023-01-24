//
//  RootsCalculatorView.swift
//  FindTheRoots
//
//  Created by dyhidrogen monoxide on 2023/1/24.
//

import SwiftUI

struct RootsCalculatorView: View {
    // MARK: Stored Properties
    
    @State var a: Double = 10
    @State var b: Double = 10
    @State var c: Double = 10
    
    // List of prior results
    @State var priorResults: [Result] = []
    // MARK: Computed Properties
    
    // The result possibilities are:
    // 1. DIscriminant is negatice, no real roots
    // 2. Discriminant is zero, so two equal real roots
    // 3. Discriminant is positive, so two different real roots
    var result: String {
        
        let discriminant = b * b - 4 * a * c
        
        if discriminant < 0 {
            return "No real roots."
        } else{
            let x1 = (b * -1 - discriminant.squareRoot() ) / (2 * a)
            let x2 = (b * -1 + discriminant.squareRoot() ) / (2 * a)
            
            return "x ≈ \(x1.formatted(.number.precision(.fractionLength(2)))) and x ≈ \(x2.formatted(.number.precision(.fractionLength(2))))"
        }
    }
    //?
    var body: some View {
        VStack{
            
            HStack{
                Text("Find the Roots")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.all, 20.0)
            
            VStack{
                Image("formula1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                
                Image("formula2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
            }
            .padding()
            
            HStack{
                VStack{
                    Text("a: \(a.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font.custom("Times New Roman",
                                          size: 24.0,
                                          relativeTo: .body))
                    
                    Slider(value: $a,
                           in: -50...50,
                           label: {Text( "variation a")})
                }
                
                VStack{
                    Text("b: \(b.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font.custom("Times New Roman",
                                          size: 24.0,
                                          relativeTo: .body))
                    
                    Slider(value: $b,
                           in: -50...50,
                           label: {Text( "variation b")})
                }
                
                VStack{
                    Text("c: \(c.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font.custom("Times New Roman",
                                          size: 24.0,
                                          relativeTo: .body))
                    
                    Slider(value: $c,
                           in: -50...50,
                           label: {Text( "variation c")})
                }
                
                
                
            }
            .padding()
            
            Text("\(result)")
                .font(Font.custom("Times New Roman",
                                  size: 24.0,
                                  relativeTo: .body))
            
            Button(action: {
                let latestResult = Result(a: a,
                                          b: b,
                                          c: c,
                                          roots: result)
                priorResults.append(latestResult)
            }, label: {
                Text("Save Result")
            })
            .buttonStyle(.bordered)
            .padding()
            
            // History label
            HStack {
                Text("History")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            
            //The actual list of results
            List(priorResults)
        }
        .padding()
        .navigationTitle("Find the Roots")
        
    }
}

struct RootsCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        RootsCalculatorView()
    }
}

