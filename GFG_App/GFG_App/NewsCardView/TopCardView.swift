
import Foundation
import SwiftUI

struct TopCardView: View {
    @State var article : Item
    
    var body: some View {
        VStack{
            let url = URL(string: article.enclosure.link)!
            Image("Image").fromData(url: url)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color(hex: 0x308D46))
                    Divider()
                    Text(String().toDate(inputDate: article.pubDate))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }.layoutPriority(100)
                Spacer()
            }.padding()
            
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}


struct TopCardView_Previews: PreviewProvider {
    static var previews: some View {
        TopCardView(article: Service().results[0])
    }
}
