import SwiftUI

struct CardView: View {
    
    @State var article : Item
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading){
                Text(article.title).padding(.bottom).foregroundColor(Color(hex: 0x308D46))
                Text(String().toDate(inputDate: article.pubDate)).foregroundColor(Color.secondary)
            }.padding()
            
            let url = URL(string: article.thumbnail)!
            Image("Image").fromData(url: url).frame(maxWidth: 150.0, maxHeight: .infinity, alignment: .center)
            
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let arr = Service().results
        if arr.count > 0 {
            CardView(article: arr[0])
        }
        
    }
}
