//
//  ListingDetailView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct ListingDetailView: View {
    let listItem : Listing
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ImageTabView(images: listItem.imageUrls)
                    .frame(height: 320)

                Button {
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                    //label에 패딩을 넣어야함
                    //버튼에 패딩을 넣으면 실제버튼위치랑 보이는 위치랑 달라져서 눌러도 동작안함
                }
            }

            // Title
            VStack(alignment: .leading, spacing:8) {
                Text(listItem.title)
                    .font(.title)
                    .fontWeight(.semibold)

                VStack(alignment: .leading) {
                    HStack(spacing:2) {
                        RatingView(listItem: listItem)
                        Text(" - ")
                        + Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    Text("\(listItem.city), \(listItem.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading) //스크롤뷰 내에서 정렬

            Divider()

            //host info view
            HStack {
                VStack(alignment:.leading, spacing: 4) {
                    Text("Entire \(listItem.type.descripton) hosted by \(listItem.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)

                    HStack(spacing:2) {
                        Text("\(listItem.numberOfGuest) guests - ")
                        Text("\(listItem.numberOfBedrooms) bedrooms - ")
                        Text("\(listItem.numberOfBeds) beds - ")
                        Text("\(listItem.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)

                Spacer()

                Image(listItem.ownerImageUrl)
                    .resizable()
                    .frame(width: 65, height: 65)
                    .scaledToFill()
                    .clipShape(Circle())
            }
            .padding()

            Divider()

            //features
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listItem.features) { feature in
                    HStack(spacing:12) {
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)

                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()


            //bedroom info
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach (1 ... listItem.numberOfBedrooms, id: \.self) { bedroom in
                            VStack(alignment: .leading, spacing: 5) {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .scrollTargetBehavior(.paging) // 가끼운 인덱스 포지션에서 멈춤, 셀의 중간에서 멈추지않음
            Divider()


            //place offer
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)

                ForEach(listItem.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()


            //map
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                ItemMapView(listItem : listItem)
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 75) //bottm bar위로 올림, 모든 내용이 보이도록
        .overlay(alignment: .bottom) {
            //bottm bar
            VStack {
                Divider()
                    .padding(.bottom)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("$500")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Total before taxes")
                                .font(.footnote)
                            Text("Oct 15 - 20")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .underline()

                        }

                        Spacer()
                        Button {

                        }label: {
                            Text("Reserve")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                .padding(.horizontal, 32)

            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listItem: DeveloperPreview.shared.listings[0])
}
