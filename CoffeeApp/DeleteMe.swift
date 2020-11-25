//
//  DeleteMe.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 25.11.2020.
//

import SwiftUI

struct DeleteMe: View {
    init() {
        UITableView.appearance().separatorColor = .clear
       }
    var inputArray = ["100","201","302"]
    @State var slectedSegmant = "ActionSheet"
    @State var slectedObj = "100"
    @State var enableSheet = false
    var test = false
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Picker(selection: $slectedSegmant, label: Text("Segment")) {
                    Text("Alert").tag("Alert")
                    Text("ActionSheet").tag("ActionSheet")
                }.pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                    .padding(EdgeInsets.init(top: 50, leading: 10, bottom: 0, trailing: 10))

                Text("Alert & Pickers")
                    .font(Font.system(size: 35, design: .rounded))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                List((0...50),id: \.self) { input in
                    ZStack {
                        HStack(spacing: 10) {
                            Image(systemName: "book")
                                .font(.title)
                                .padding(.leading, 10)
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text("Simple")
                                Text("3 different buttons")
                            })
                            Spacer()
                        }.padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white).shadow(radius: 1.5)
                            )

                        Button(action: {
                            self.enableSheet = true
                        }) {
                            Text("")
                        }
                    }
                }.padding()
            }.blur(radius: $enableSheet.wrappedValue ? 1 : 0)
                .overlay(
                    $enableSheet.wrappedValue ? Color.black.opacity(0.6) : nil
                )
           if $enableSheet.wrappedValue {
                GeometryReader { gr in
                    VStack {
                        VStack {
                            Text("PickerView")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                            Text("Prefered ContentHeight")
                                .padding(.top, 5)
                            Picker("test", selection: self.$slectedObj) {
                                Text("100").id("100")
                                Text("201").id("201")
                                Text("301").id("302")
                            }.labelsHidden()
                        }.background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white).shadow(radius: 1))
                        VStack {
                            Button(action: {
                                debugPrint("Done Selected")
                                self.enableSheet = false
                            }) {
                                Text("Done").fontWeight(Font.Weight.bold)
                            }.padding()
                                .frame(maxWidth: gr.size.width  - 90)
                                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.white).shadow(radius: 1))

                        }
                    }.position(x: gr.size.width / 2 ,y: gr.size.height - 200)
                }
            }
        }.edgesIgnoringSafeArea(.all)
      }
     }

struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe()
    }
}
