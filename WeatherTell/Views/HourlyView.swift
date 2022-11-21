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
                
                ForEach(viewModel.hourlyData) {model in
                    
                    HourView(model: model)
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
                       
            AsyncImage(url: URL(string: model.imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 35, height: 35)


               // .frame(width: 35, height: 35)
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
