//
//  CellView.swift
//  ForeCast
//
//  Created by user225360 on 8/1/22.
//

import SwiftUI

struct CellView: View {
    
    let tempMax: String
    let tempMin: String
    let hour: String
    
    var body: some View {
        VStack {
            Text(hour).fontWeight(.heavy)
            VStack {
                Text(tempMax)
                Text(tempMin)
            }
        }
        .font(.caption)
        .frame(width:50, height: 80, alignment: .center)
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
        .padding(1)
        .previewLayout(.sizeThatFits)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(tempMax: "H: 12.C", tempMin: "L: 10.C", hour: "12:20")
    }
}
