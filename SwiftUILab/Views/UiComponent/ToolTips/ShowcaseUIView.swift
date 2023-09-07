//
//  ToolTipsUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/9/23.
//

import SwiftUI
import MapKit

struct ShowcaseUIView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 23.804366732568923 , longitude: 90.41396089578745),
        latitudinalMeters: 1000,
        longitudinalMeters: 1000)
    var body: some View {
        TabView{
            GeometryReader{proxy in
                let safeArea = proxy.safeAreaInsets
                Map(coordinateRegion: $region)
                    .overlay(alignment:.top, content: {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .frame(height: safeArea.top)
                    })
                    .ignoresSafeArea()
                    .overlay(alignment:.topTrailing) {
                        VStack(alignment: .trailing){
                            
                            HStack{
                                Button {
                                    self.mode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "chevron.backward.circle.fill")
                                        .font(.title3Regular)
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .background{
                                            RoundedRectangle(cornerRadius: 10,style: .continuous)
                                                .fill(.ultraThinMaterial)
                                        }
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "location.fill")
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background{
                                            RoundedRectangle(cornerRadius: 10,style: .continuous)
                                                .fill(Color.primaryColor)
                                        }
                                }
                                .showCase(order: 0, title: "My Current Location", cornerRadius: 10,style: .continuous)
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "suit.heart.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                                            .fill(Color.red)
                                    }
                            }
                            .showCase(order: 1, title: "My Favourite Location", cornerRadius: 10,style: .continuous)


                        }.padding(16)
                    }
            }
            .tabItem {
                Image(systemName: "map.circle")
                Text("Map")
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            
            Text("")
                .tabItem{
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Dashboard")
                }
            
            Text("")
                .tabItem{
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
        .overlay(alignment: .bottom, content: {
            HStack(spacing: 0) {
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 45,height: 45)
                    .showCase(order: 2, title: "My Map", cornerRadius: 10,style: .continuous)
                    .frame(maxWidth: .infinity)
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 45,height: 45)
                    .showCase(order: 4, title: "My Dashboard", cornerRadius: 10,style: .continuous,scale: 1.2)
                    .frame(maxWidth: .infinity)
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 45,height: 45)
                    .showCase(order: 3, title: "My Profile", cornerRadius: 10,style: .continuous)
                    .frame(maxWidth: .infinity)
            }
            .allowsTightening(false)
        })
        
        .modifier(ShowcaseRoot(showHighlights: true, onFinished: {
            print("Finished")
        }))
        .navigationBarHidden(true)
    }
}

struct ToolTipsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShowcaseUIView()
    }
}
