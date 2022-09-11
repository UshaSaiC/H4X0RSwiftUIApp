import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                HStack {
                    Text("\(post.points)")
                    Text(post.title)
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("H4X0R NEWS")
        }
        // onAppear is like viewDidload
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
