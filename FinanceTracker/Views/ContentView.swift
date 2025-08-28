import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    
    var body: some View {
        TabView(selection: $appStateViewModel.selection){
            TransactionView()
                .tabItem{
                    VStack {
                        Image(systemName: "car.fill")
                        Text("Home")
                    }
                }
                .tag(AppStateViewModel.Tab.home)
            ExchangesView()
                .tabItem{
                    VStack {
                        Image(systemName: "car.fill")
                        Text("Exchanges")
                    }
                }
                .tag(AppStateViewModel.Tab.rates)
            Text("More")
                .tabItem{
                    VStack {
                        Image(systemName: "car.fill")
                        Text("More")
                    }
                }
                .tag(AppStateViewModel.Tab.more)

        }
    }
}

//#Preview {
//    ContentView()
//}
