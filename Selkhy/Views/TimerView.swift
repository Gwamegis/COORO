//
//  TimerView.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/20.
//

import SwiftUI

struct TimerView: View {
    enum Field: Hashable {
        case minute
        case second
    }
    
    @Binding var isShowTimer: Bool
    @State var minute = ""
    @State var second = ""
    @State var minutePlaceholder = "00"
    @State var secondPlaceholder = "00"
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            ZStack {
                Image("timer_back")
                    .resizable()
                    .scaledToFit()
                HStack(spacing: 16) {
                    ZStack(alignment: .trailing) {
                        Text(minutePlaceholder)
                            .foregroundColor(.Grey02)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        HStack {
                            TextField("", text: $minute)
                                .focused($focusedField, equals: .minute)
                                .keyboardType(.numberPad)
                                .onChange(of: minute) { newValue in
                                    switch newValue.count {
                                    case 0:
                                        minutePlaceholder = "00"
                                    case 1:
                                        minutePlaceholder = "0"
                                    case 2:
                                        minutePlaceholder = ""
                                    case 3:
                                        focusedField = .second
                                        second = newValue.lastString
                                        minute.removeLast()
                                        secondPlaceholder = "0"
                                    default:
                                        minutePlaceholder = ""
                                    }
                                }
                        }
                    }
                    .frame(width: 90)
                    Text(":")
                        .foregroundColor(second.count < 1 ? .Grey02 : .Point)
                    ZStack(alignment: .leading) {
                        Text(secondPlaceholder)
                            .foregroundColor(.Grey02)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        TextField("", text: $second, prompt: Text("00").foregroundColor(.Grey02))
                            .focused($focusedField, equals: .second)
                            .keyboardType(.numberPad)
                            .onChange(of: second) { newValue in
                                switch newValue.count {
                                case 0:
                                    secondPlaceholder = "00"
                                    focusedField = .minute
                                case 1:
                                    secondPlaceholder = "0"
                                case 2:
                                    secondPlaceholder = ""
                                default:
                                    second.removeLast()
                                    
                                }
                            }
                        
                    }
                    .frame(width: 90)
                }
                .font(Font.Cooro.TimerFont)
                .foregroundColor(Color.Point)

            }
            Button {
                isShowTimer.toggle()
            } label: {
                Text("타이머 설정")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 19)
                    .frame(maxWidth: .infinity)
                    .background(Color.Point).opacity(minute.isEmpty || second.isEmpty ? 0.4 : 1)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)

        }
        .frame(maxHeight: .infinity)
        .background(Color.Background)
        .onAppear() {
            focusedField = .minute
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(isShowTimer: .constant(true))
    }
}
