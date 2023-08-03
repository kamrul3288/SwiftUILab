# NavigationBar

- ``How to chnage navigation bar color in swift ui?``

let navBarAppearance = UINavigationBarAppearance()
navBarAppearance.configureWithOpaqueBackground()
navBarAppearance.backgroundColor = UIColor(Color.primary)
navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance

- ``How to chnage status bar color in swift ui?``
1) open info.plist
Status bar style = Light Content
View controller-based status bar appearance = No

- ``How to chnage navigation back btn color in swift ui?``
Just chnage the accent color
