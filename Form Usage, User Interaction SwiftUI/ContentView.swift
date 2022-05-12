//
//  ContentView.swift
//  Form Usage, User Interaction SwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertGorunsunMu = true
    
    @State private var hatirlatmaAcikMi = false
    
    @State private var zamanListesi = ["1 Gün", "1 Hafta", "1 Ay"]
    
    @State private var secilmisZamanIndeks = 0
    
    @State private var odemeListesi = ["Haftalık", "Aylık", "Yıllık"]
    
    @State private var secilenOdemeIndeks = 0
    
    var body: some View {
        
        NavigationView{
            
            Form{
                
                Section(header: Text("Hatırlatma"), footer: Text("Bildirim Sıklıgını Ayarlayabilirsiniz")){
                    
                    Picker(selection: $secilmisZamanIndeks,label: Text("")){
                        
                        ForEach(0..<self.zamanListesi.count){
                            Text(self.zamanListesi[$0]).tag($0)
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    
                    Toggle(isOn: $hatirlatmaAcikMi) {
                        Text("Hatırlatma Kapat")
                    }
                }
                
                Section(footer: Text("Ödeme Sıklıgını Ayarlayabilirsiniz")){
                    
                    Picker(selection: $secilenOdemeIndeks,label: Text("Ödeme Sıklığı")){
                        
                        ForEach(0..<self.odemeListesi.count){
                            Text(self.odemeListesi[$0]).tag($0)
                        }
                        
                    }
                    
                }
                
                Section{
                    
                    Button {
                        self.alertGorunsunMu = true
                        
                        print("Hatırlatma : \(self.zamanListesi[self.secilmisZamanIndeks])")
                        
                        print("Hatırlatma Açık mı : \(self.hatirlatmaAcikMi)")
                        
                        print("Ödeme Sıklığı : \(self.odemeListesi[self.secilenOdemeIndeks])")
                    } label: {
                        Text("Değişiklikleri Kaydet")
                    }
                    .alert(isPresented: $alertGorunsunMu) {
                        
                        Alert(title: Text("Başarılı"), message: Text("Hatırlatma : \(self.zamanListesi[self.secilmisZamanIndeks])\nHatırlatma Açık mı : \(String(self.hatirlatmaAcikMi)) \nÖdeme Sıklığı : \(self.odemeListesi[self.secilenOdemeIndeks])")
                              
                              , primaryButton: .destructive(Text("Tamam"))
                              , secondaryButton: .cancel(Text("İptal")))
                    }

                }
                
                
                
            }
            .navigationTitle("Ayarlar")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
