//
//  ContentView.swift
//  WidgetsKullanimi
//
//  Created by Mehmet Tuna Arıkaya on 12.12.2024.
//

import SwiftUI

struct AnaSayfa: View {
    @State private var tf  = ""
    @State private var alinanVeri  = ""
    @State private var resimAdi  = "mutlu"
    @State private var switchDurum  = false
    @State private var segmentedDurum  = 0
    @State private var stepperDurum  = 0
    @State private var sliderDurum  = 50.0
    @State private var saat  = Date()
    @State private var tarih  = Date()
    
    var body: some View {
        VStack {
            Text(alinanVeri)
        
            TextField("Veri giriniz", text: $tf)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Oku"){
                alinanVeri = tf
                
            }
            HStack{
                Text("5").onTapGesture(){
                    print("fg")
                }
                Button("Resim1"){
                    resimAdi = "mutlu"
                }
                Image(resimAdi).resizable().frame(width:50,height:50)
                Button("Resim2"){
                    resimAdi = "uzgun"
                    
                }
                
               
                
            }
            Toggle("Toggle testing", isOn: $switchDurum)
                .onChange(of:switchDurum){
                    _, value in
                    print("switch durumu: \(value)")
                }
            
            Picker("",selection: $segmentedDurum){
                Text("Yemekler").tag(0)
                Text("Tatlılar").tag(1)
                Text("İçecekler").tag(2)
                
            }.pickerStyle(.segmented)//mesut abinin appindeki yapi
                .onChange(of:segmentedDurum){
                    _, value in
                    print("segmented durumu: \(value)")
                }.padding()
            Text(String(stepperDurum))
            Stepper("Stepper",value:$stepperDurum,in: 0...10).padding()
        }
        Text(String(Int(sliderDurum)))
        Slider(value: $sliderDurum,in: 0...100).padding()
        DatePicker("Saat",selection: $saat,displayedComponents: .hourAndMinute).padding()
        
        DatePicker("Tarih",selection: $tarih,displayedComponents: .date).padding()
//        
//        let tfa = DateFormatter()
//        tfa.dateFormat = "hh:mm"
//
//        let alinanSaat = tfa.string(from: saat)
//        
//        let tf2 = DateFormatter()
//        tf2.dateFormat = "dd.MM.yyyy"
//        
//        let alinanTarih = tf2.string(from: tarih)
//        
//        Text("\(alinanSaat) - \(alinanTarih)")
    }//bir appinde üstte tarih ve saat vermek istersen iş yapar
    
}

#Preview {
    AnaSayfa()
}
