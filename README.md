<a href="https://www.buymeacoffee.com/bbc6bae9" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

![pangu](./pangu.png)

Quickly build a bugfree SwiftUI Router App (`TabView` + `Navigation` + `Router`) with one line of code.

## Feature

🔥 Perfect router solution

🚶 Lazy tab root page

🌲 The `init` and `body` methods of each page under the navigation system will only be called once.

📱 Minimum deployment iOS14 

## Usage

1、 Define your Tab model

```swift
import SwiftUI
import Pangu

enum Tab: Tabable {
    case home
    case profile

    @ViewBuilder
    func rootPage() -> some View {
        switch self {
        case .home:
            HomePage()
        case .profile:
            ProfilePage()
        }
    }

    func label() -> some View {
        switch self {
        case .home:
            return Label("Home", systemImage: "house")
        case .profile:
            return Label("Profile", systemImage: "hand.thumbsup.fill")
        }
    }
}
```

2、Define your route and it‘s page (SwiftUI.View)

```swift
import SwiftUI
import Pangu

enum Route: Routable {
    
    case detail
    
    case more
    
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .detail:
            DetailPage()
        case .more:
            MorePage()
        }
    }
}
```

3、Quickly build a SwiftUI App scaffold  with one line of code.

 ```swift
 import Pangu
 
 struct DemoApp: App {
     var body: some Scene {
         WindowGroup {
             PanguTabView<Tab, Route>(tab: .home)
         }
     }
 }
 ```

4、Define your Router type

 ```swift
typealias PGRouter = PanguRouter<Tab, Route>
 ```

4、Route from any View

 ```swift
struct HomePage: View {
    @EnvironmentObject var router: PGRouter

    var body: some View {
        Button("push") {
            router.pushToActiveTab(route: .detail(name: "hello"))
        }
        .navigationTitle("Home")
    }
}
 ```
