//
//  CircleCapsulListView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 18/03/26.
//

import SwiftUI

struct FetchData {
    var list1: [Bool] = [false, false, true, true, false]
    var list2: [Bool] = [true, false, false, true, false]
    var list3: [Bool] = [false, false, true, true, true]
    var list4: [Bool] = [false, true, false, false, false]
    var listData: [[Bool]]  { [list1, list2, list3, list4] }
}

struct CircleCapsulListView: View {

    @State var fetchData: FetchData = FetchData()
    
    var body: some View {
        List(fetchData.listData, id: \.self) { list in
            RowView(list: list)
        }
    }
}

struct RowView : View {
    let list : [Bool]
    
    var lastTrueIndexs:[Int] {
        var arr: [Int] = []
        guard var lastIndex = list.lastIndex(of: true) else { return []
        }
        while list[lastIndex] == true {
            arr.insert(lastIndex, at: 0)
            lastIndex -= 1
            
            // Break the loop if lastIndex is 0
            if lastIndex < 0 {
                break
            }
        }
        return arr
    }

    
    var body: some View {
        Text("\(list)")
             HStack {
                 ForEach(list.indices, id: \.self) { index in
                     
                 if lastTrueIndexs.isEmpty || index < lastTrueIndexs.first! || index > lastTrueIndexs.last! {
                     Circle()
                         .fill(list[index] == true ? Color.green : Color.gray)
                         .frame(width: 60, height: 55)
                 }
                     else if index == lastTrueIndexs.first! {
                         ZStack {
                             HStack {
                                 ForEach(lastTrueIndexs.indices, id: \.self) { _ in
                                     Circle()
                                         .fill(list[index] == true ? Color.green : Color.gray)
                                         .frame(width: 60, height: 55)
                                 }
                             }
                             .background(
                                Capsule()
                                    .fill(Color.red)
                             )
                         }
                     }
             }
         }
    }
}

#Preview {
    CircleCapsulListView()
}
