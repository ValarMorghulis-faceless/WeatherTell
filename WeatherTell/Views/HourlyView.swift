//
//  HourlyView.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 16.11.22.
//

import SwiftUI

struct HourlyView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel

    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                //viewModel.hourlyData
                
                ForEach(0...24, id: \.self) {num in
                    
                    HourView(model: HourData())
                }
                
            }

        }
    }
}

struct HourView: View {
    var model: HourData
    var body: some View {
        VStack {
            // image, temp, hour
            Image(systemName: model.imageURL)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35, alignment: .center)
            Text(model.temp)
                .bold()
                .foregroundColor(.white)
            Text(model.hour)
                .foregroundColor(.white)
                
        }
        .padding()
    }
}


struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
            .preferredColorScheme(.dark)
    }
}
