//
//  RootsCalculatorView.swift
//  FindTheRoots
//
//  Created by dyhidrogen monoxide on 2023/1/24.
//

import SwiftUI

struct RootsCalculatorView: View {
    // MARK: Stored Properties
    
    @State var givenA = "10"
    @State var givenB = "10"
    @State var givenC = "10"
    
    // List of prior results
    @State var priorResults: [Result] = []
    // MARK: Computed Properties
    
    // The result possibilities are:
    // 1. Discriminant is negative, no real roots
    // 2. Discriminant is zero, so two equal real roots
    // 3. Discriminant is positive, so two different real roots
    
    var givenAAsDouble: Double? {
        guard let a = Double(givenA) else {
            return nil
        }
        return a
    }
    
    var discriminant: Double? {
        
        // Try to convert provided a to a Double
        guard let a = givenAAsDouble else {
            // Can't be done..
            // We can't calculate roots...
            // Return a nil for the roots value instead...
            return nil
        }
        
        // Try to convert provided b to a Double
        guard let b = Double(givenB) else {
            // Can't be done..
            // We can't calculate roots...
            // Return a nil for the roots value instead...
            return nil
        }
        
        // Try to convert provided c to a Double
        guard let c = Double(givenC) else {
            // Can't be done..
            // We can't calculate area...
            // Return a nil for the roots value instead...
            return nil
        }
        
        // We have a valid a, b and c values, so return the roots
        // return length * width
        
    }
    
    
    var body: some View {
        VStack{
            
            HStack{
                Text("Find the Roots")
                    .font(.title)
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
                    
                    TextField("Enter an a value", text: $givenA)
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
            .padding(.leading, 20.0)
            
            
            //The actual list of results
            List(priorResults.reversed() ) { currentResult in
                HStack{
                    Spacer()
                    ResultView(somePriorResult: currentResult)
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Find the Roots")
            
        }
    }
    
}
    
    struct RootsCalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            RootsCalculatorView()
        }
    }
    
}


