//
//  ExploreView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    //의존성 주입
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())

    //environmentObject 로 하면 앱의 어느곳에서나 데이터를 공유함
    //environmentObject를 사용하는 모든곳에 데이터가 바뀜
    //메인화면에서도 리스팅이 바뀌어야하므로 enviropmentobject가 적당 
    var body: some View {

        //보여주는 뷰를 빠꿀수이씀
        NavigationStack {
            if showDestinationSearchView {
                //present로 보여야함
                DestinationSearchView(show: $showDestinationSearchView, exploreViewModel: viewModel)

                //observedObjct 는 뷰 라이프사이클에 따라 새로생성돼서 내부 값이 유지되지않음

            }
            else {
                ScrollView {
                    //present로 보여야함
                    SearchAndFilterBar(destination: $viewModel.destination)
                        .onTapGesture {
                            withAnimation(.snappy) {
                               // withAnimation fade in 
                                showDestinationSearchView.toggle()
                            }
                        }
                    //화면에 보이는것만 렌더링, 전체를 다 랜더링하지 않음, 성능 최적화
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { item in
                            NavigationLink {
                                //ListingDetailView(item: item)
                                ListingDetailView(listItem: item)
                                    .navigationBarBackButtonHidden()

                            }label: {
                                ListingItemView(listItem: item)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
