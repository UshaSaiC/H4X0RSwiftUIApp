import SwiftUI

struct ContentView: View {
    var body: some View {
        // NavigationView helps in navigating between screens and we can easily go back to previous screen via this
        NavigationView{
            // List{
            //   Text("Hello, world1!")
            //   Text("Hello, world1!")
            //}
            
            // below we are looping through posts array and printing its text in a list view
            List(posts) { post in
                Text(post.title)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("H4X0R NEWS")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    // Identifiable helps in figuring out the objects based on id instead of some random order. For a struct to be identifiable it should have id property of type string
    struct Post: Identifiable {
        let id: String
        let title: String
    }
    
    let posts = [
        Post(id: "1", title: "H1"),
        Post(id: "2", title: "H2"),
        Post(id: "3", title: "H3"),
        Post(id: "4", title: "H4")
    ]
}
