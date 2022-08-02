//
//  AddButtonView.swift
//  weatherForecast
//
//  Created by user225360 on 7/28/22.
//

import SwiftUI

struct AddButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.white)
            )
            .shadow(
                color: .black.opacity(0.25),
                radius: 10, x: 0.0, y: 0.0
            )
            .padding()
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(iconName: "plus")
            .previewLayout(.sizeThatFits)
    }
}
