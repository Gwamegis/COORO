//
//  ReviewView.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/19.
//

import SwiftUI

struct ReviewView: View {
    let review: Review
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Circle().frame(width: 24)
                        .foregroundColor(.Grey09)
                    Text("로봇러버")
                        .foregroundColor(.LightGrey)
                }
                Text(review.content)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let photo = review.photo {
                    photo
                        .resizable()
                        .scaledToFill()
                        .frame(width: 152, height: 152)
                        .cornerRadius(20)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.Grey03)
        .cornerRadius(10)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(review: Review(score: 10, content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요."))
    }
}
