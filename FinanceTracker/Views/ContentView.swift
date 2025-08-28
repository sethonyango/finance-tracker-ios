import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    
    var body: some View {
        TabView(selection: $appStateViewModel.selection){
            TransactionView()
                .tabItem{
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(AppStateViewModel.Tab.home)
            ExchangesView()
                .tabItem{
                    VStack {
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Exchanges")
                    }
                }
                .tag(AppStateViewModel.Tab.rates)
            Text("More")
                .tabItem{
                    VStack {
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
                }
                .tag(AppStateViewModel.Tab.more)
        }
    }
}
