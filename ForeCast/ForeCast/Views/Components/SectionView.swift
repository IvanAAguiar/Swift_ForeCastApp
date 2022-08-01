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
        VStack(alignment: .center) {
            Text(days[0].dtTxt[0])
                .fontWeight(.bold)
            HStack(alignment: .center) {
                ForEach(days, id: \.forecast.id)  { index in
                    CellView(tempMax: index.max, tempMin: index.min, hour: index.hour)
                }
            }
        }
    }
}

//struct SectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionView()
//    }
//}
