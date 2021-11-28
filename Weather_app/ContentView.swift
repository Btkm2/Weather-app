//
//  ContentView.swift
//  Weather_app
//
//  Created by Beket Muratbek on 03.10.2021.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color("LightBlue")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                CityWeatherView(CityName: "Almaty, KZ")
//                VStack(spacing: 8){
//                    Image(systemName: "cloud.fill")
//                        .renderingMode(.original)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 150, height: 150)
//                    Text("8°")
//                        .font(.system(size: 50, weight: .medium, design:.default))
//                        .foregroundColor(.white)
//                }
//                .padding(.bottom,40)
                HStack(spacing:40){
                    WeeklyWeather(imageName: "cloud.fill", temp: 8)
//                        .padding(.trailing,7)
//                        .padding(.leading,UIScreen.main.bounds.width*0.4)
                        .frame(width: 150, height: 220)
                        
                    //WeeklyWeather(imageName: "cloud.drizzle.fill", temp: 5)
//                    VStack{
//                        Text("18:28")
//                            .font(.system(size: 16, weight: .medium, design: .default))
//                            .foregroundColor(.white)
//                        Image(systemName: "sunset.fill")
//                            .renderingMode(.original)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.09)
//                    }
//                    .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.15)
//                    .padding(.trailing) //time of sunset
//                    .padding(.leading,UIScreen.main.bounds.width*0.4)
                }
                let date = Date()
                Text(date, style: .time).foregroundColor(.white)
                ShowTime()
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing:14){
                        WeatherDays(dayofweek: "MON", image: "cloud.fill", temp: 8)
                        WeatherDays(dayofweek: "TUE", image: "cloud.rain.fill", temp: 5)
                        WeatherDays(dayofweek: "WED", image: "cloud.fill", temp: 8)
                        WeatherDays(dayofweek: "THU", image: "cloud.sun.fill", temp: 9)
                        WeatherDays(dayofweek: "FRI", image: "smoke.fill", temp: 7)
                        WeatherDays(dayofweek: "SAT", image: "cloud.sun.rain.fill", temp: 6)
                        WeatherDays(dayofweek: "SUN", image: "cloud.heavyrain.fill", temp: 3)
                        WeatherDays(dayofweek: "SUN", image: "cloud.heavyrain.fill", temp: 10)
                        WeatherDays(dayofweek: "SUN", image: "cloud.heavyrain.fill", temp: -1)
                        WeatherDays(dayofweek: "SUN", image: "cloud.heavyrain.fill", temp: 0)
                    }.padding()
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDisplayName("iPhone 12 mini")
//            ContentView().previewDisplayName("iPhone 12 mini")
//            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)")).previewDisplayName("iPhone SE")
        }
    }
}

struct WeatherDays: View {
    var dayofweek:String
    var image:String
    var temp:Int
    
    var body: some View {

        VStack{
            Text(dayofweek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.09)
            Text("\(temp)°")
                .font(.system(size: 24, weight: .medium, design:.default))
                .foregroundColor(.white)
        }.frame(width: 50, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
struct CityWeatherView:View{
    var CityName:String
    var body: some View{
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct WeeklyWeather:View{
    var imageName:String
    var temp:Int
    var body: some View{
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("\(temp)°")
                .font(.system(size: 50, weight: .medium, design:.default))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
struct TestView: View {
        @State var timeNow = ""
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        var dateFormatter: DateFormatter {
                let fmtr = DateFormatter()
                fmtr.dateFormat = "hh:mm:ss a"
                return fmtr
        }
        
        var body: some View {
                Text("" + timeNow)
                        .onReceive(timer) { _ in
                                self.timeNow = dateFormatter.string(from: Date())
                        }
        }
}
//struct ShowTime: View{
//    let hour = calendar.component(.hour, from: date)
//    let minute = calendar.component(.minute, from: date)
//    let seconds = calendar.component(.second, from: date)
//    var body: some View{
//        Text(hour + minute + seconds)
//    }
//}
