//
//  HeaderView.swift
//  WeatherTell
//
//  Created by Giorgi Samkharadze on 16.11.22.
//

import SwiftUI
import Foundation

struct HeaderView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: -15) {
            Text(viewModel.headerViewModel.location)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 36))
                .padding()
            
            AsyncImage(url: URL(string: viewModel.headerViewModel.iconURLString))
                .frame(width: 150, height: 150)
            
            
            
            Text(viewModel.headerViewModel.currentTemp)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 90))
                .padding()
            
            Text(viewModel.headerViewModel.currentConditions)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 45))
                .padding()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
            
    }
}
