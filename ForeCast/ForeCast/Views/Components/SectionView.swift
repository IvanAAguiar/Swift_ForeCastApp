//
//  SectionView.swift
//  ForeCast
//
//  Created by user225360 on 8/1/22.
//

import SwiftUI

struct SectionView: View {
    let days: [CityWeatherViewModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack (alignment: .firstTextBaseline){
                Text(days[0].dtTxt[0])
                    .fontWeight(.bold)
            }
            .padding(2)
            HStack() {
                ForEach(days, id: \.forecast.id)  { index in
                    CellView(tempMax: index.max, tempMin: index.min, hour: index.hour)
                }
            }
            .padding(2)
        }
        .frame(width: .maximum(345, .zero), alignment: .leading)
        .background(.blue.opacity(0.05))
        .cornerRadius(10)
    }
}
