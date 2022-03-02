
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var service : Service
    var body: some View {
        RefreshableView(onRefresh: { done in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.service.updateNews()
                done()
            }
            
        }) {
            ScrollView(showsIndicators: false){
                VStack(){
                    Text("GeeksForGeeks")
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 10, alignment: .leading)
                        .padding()
                        .font(.title)
                        .foregroundColor(Color(hex: 0x308D46))
                        .background(Color.white)
                    ForEach(0..<service.results.count){ index in
                        
                        if index == 0 {
                            TopCardView(article: service.results[index]).padding()
                        }
                        else{
                            CardView(article: service.results[index]).padding()
                        }
                    }
                }.background(Color(hex: 0xF2F2F2))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Service())
    }
}


