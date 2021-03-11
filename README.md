# 10Pearls Xcode Templates
This project adds a new project and file template within Xcode. Currently both `Swift` and `Objective-C` is supported. Future updates will remove support for `Objective-C`.

## Requirements
- CocoaPods
- Xcode

## Getting things ready

### Script Installation 
Run the following command within the terminal to install the `xcode-seed` script. This should only be done once as any further changes are to be made by the `xcode-seed` script.

```
$ bash -c "$(curl -s https://raw.githubusercontent.com/10pearls/xcode_project_template/master/Scripts/install.sh)"
```

**Note:** The command executed above only installs the `xcode-seed` script. No changes to Xcode project and file templates have been made so far.

### Seed Project Updates

In order install XCode project and file templates, run the following command.

```
$ xcode-seed -u
```

This commands needs to be executed at least once. Running it for the first time will add the project and file templates to Xcode. Successive execution of the command will update the templates if needed.

### Seed Project Version

In order to determine the current and server version of xcode-seed file, run the following command.

```
$ xcode-seed -v
```

This commands will determine the version of the server file and will compare it with your current version. Successive execution of the command will display both server and in-use versions and will let us know if it requires an update.

## Try out the templates

### Creating a new project
Follow the instructions below to create a new Xcode project using the project template installed via `xcode-seed` command. 
1. Choose the option to create a new project within Xcode
2. In the project template selection dialog, scroll to the bottom to view `TenPearls` category.
3. Select `iOS Starter App` and press `Next`.
4. Fill in the project information and programming language to use.
5. Before pressing `Next`, **uncheck** both `Include UI Tests` and `Include Unit Tests`.
6. Choose project folder location and press `Create`.
7. Close the opened Xcode project window.
8. Navigate to project folder location via terminal.
9. Run the following command to install `CocoaPod` dependencies.
```
$ pod install
```
10. Open the XCode project by using the newly created `.xcworkspace` file.
11. Run the application via XCode to see a simple login screen.

**Note**: Choosing `iOS Empty App` results a barebone XCode project.

### Creating a new Scene
Follow the instructions below to create a new Scene within a project using the file template installed via `xcode-seed` command. 
1. Expand the `Scenes` group within the project file explorer in Xcode.
2. Add a new group within `Scenes` with name of the scene to be added.
3. Select `New File` by right clicking the newly created group.
4. In the file template selection dialog, scroll to the bottom to view `TenPearls` category.
5. Select `Scene` file type and press `Next`. 
6. Fill in the scene name (Controller/View suffix will be added automatically), programming language to use and press `Next`. 
7. Choose file location and confirm the `group` name before pressing `Create`.
8. A `Controller`, `View` and `xib` should now populate the newly created group and are waiting to be coded into.

### Adding Navigation Bar Buttons to a Controller
To add navigation bar buttons to a controller that is a subclass of `BaseController`, **override** the `navigationBarLeftButtons` and `navigationBarRightButtons` to return a array of `NavigationBarItem`. 
```
override func navigationBarLeftButtons() -> [NavigationBarItem] {
	let addBtn = NavigationBarItem(type: .titleButton(title: "+"), target: self, onClickSelector: #selector(onAddbtnTap))
	return [addBtn]
}

@objc
func onAddbtnTap() {
	//do something
}
```

### Creating a new Control
Follow the instructions below to create a new Control within a project using the file template installed via `xcode-seed` command. 
1. Expand the `Controls` group within the project file explorer in Xcode.
2. Add a new group within `Controls` with name of the scene to be added.
3. Select `New File` by right clicking the newly created group.
4. In the file template selection dialog, scroll to the bottom to view `TenPearls` category.
5. Select `Control` file type and press `Next`. 
6. Fill in the control name, programming language to use and press `Next`. 
7. Choose file location and confirm the `group` name before pressing `Create`.
8. A swift file and `xib` should now populate the newly created group and are waiting to be coded into.

### Making an API Call
The project template added to Xcode comes with some networking code which uses the `Alamofire` library. In order make use of the prewritten networking code, follow the instructions below.
1. Create a class/struct within `Entities` conforming to `Codable` for API Response. 
2. Within `Services`, create a struct conforming to `HTTPRequestProtocol`.
3. Implement the missing protocol methods and variables.
4. Additional endpoint configurations can be made by overriding `HTTPRequestProtocol` methods.
5. Sample code below can be used to make the API request.

```
Login(userName: "username", password: "password") { result in
	switch result {
	case .success(let response):
		//handle success
	case .failure(let error):
		//handle failure
	}
}.makeRequest(User.self) //provide the Codable entity to make request
```

**Note**: Generic configuration such as setting `baseURL` can be made in the `HTTPRequestProtocol` extension. For endpoint specific configuration, override the `HTTPRequestProtocol` methods.

### Contributing

This project welcomes [contribution and suggestion](https://github.com/10pearls/xcode_project_template/blob/master/docs/contribute.md)