//
//  DailyView.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 16.11.22.
//

import SwiftUI

struct DailyView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel

    
    var body: some View {
        VStack {
            // viewModel.dailyData
            ForEach(viewModel.dailyData) { model in
                DayRowView(model: model)
                    .padding()
            }
        }
    }
}

struct DayRowView: View {
    
    var model: DayData

    var body: some View {
        HStack {
            Text(model.day)
                .bold()
                .font(.system(size: 32))
                .foregroundColor(.white)
            Spacer()
            VStack {
                Text(model.high)
                    .foregroundColor(.white)
                Text(model.low)
                    .foregroundColor(.white)
            }
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
            .preferredColorScheme(.dark)
    }
}
