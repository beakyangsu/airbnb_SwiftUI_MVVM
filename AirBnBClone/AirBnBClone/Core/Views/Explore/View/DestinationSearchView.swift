//
//  DestinationSearchView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show : Bool
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0

    @ObservedObject var exploreViewModel: ExploreViewModel


    //State로 해야 화면 나갔다 돌아와도 값이 유지됨


    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Button {
                    // withAnimation fade out
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()

                //destination에 값이 있을때만 버튼이 보임
                if !exploreViewModel.destination.isEmpty {
                    Button("Clear") {
                        exploreViewModel.destination = ""
                        exploreViewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                }
            }
            .padding()


            VStack(alignment: .leading) {
                //Where to go
                if selectedOption == .location {
                    VStack(alignment: .leading) {
                        Text("Where to go?")
                            .font(.title2)
                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Search destinations", text: $exploreViewModel.destination)
                                .font(.subheadline)
                                .onSubmit {
                                    //텍스트필드 입력끝나면!
                                    exploreViewModel.updateListingsForLocation()
                                    //입력끝나면 화면 종료
                                    withAnimation(.snappy) {
                                        show.toggle()
                                    }

                                }
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }

                } else {
                    CollapsedPickerView(title: "Where to go", description: "Add Destinamtion")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }

            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    //date selection view
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                } else {
                    CollapsedPickerView(title: "When", description: "Add Dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }


            VStack(alignment: .leading)  {
                if selectedOption == .guests {
                    //date selection view
                    Text("Who's comming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add Guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(true), exploreViewModel: ExploreViewModel(service: ExploreService()))
}


//새로운 뷰 스타일을 정의 : ViewModifier
//중복되는 스타일 적용시 이걸로 단축가능
struct CollapsibleDestinationViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()

                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)

        }
    }
}
