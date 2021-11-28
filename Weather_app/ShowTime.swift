//
//  ShowTime.swift
//  Weather_app
//
//  Created by Beket Muratbek on 14.11.2021.
//
import SwiftUI
import Foundation

struct ShowTime: View {
        @State var timeNow = ""
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        var dateFormatter: DateFormatter {
                let fmtr = DateFormatter()
                fmtr.dateFormat = "hh:mm:ss a"
                return fmtr
        }
        
        var body: some View {
                Text("Currently Time !: " + timeNow)                .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            self.timeNow = dateFormatter.string(from: Date())
                        }
        }
    
}
struct ShowTime_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShowTime()
        }
    }
}
