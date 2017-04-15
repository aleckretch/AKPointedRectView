# AKPointedRectView
A Swift 3 library to easily create a rectangle with a centered triangle attached to the middle of its top, right, bottom, or left end. Perfect for notices or drop-down menus.

## Adding AKPointedRectView to your project

### Source files

Directly add the `AKPointedRectView.swift` source file to your project.

1. Download the [latest code version](https://github.com/aleckretch/AKPointedRectView/archive/master.zip) or add the repository as a git submodule to your git-tracked project. 
2. Open your project in Xcode, then drag and drop `AKPointedRectView.swift` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project. 

## Usage

Create an instance of AKPointedRectView. The parameters of the constructor are: `frame` (CGRect) - the frame of the entire view (triangle and rect body), `color` (UIColor) - the background color of the view, `triangleHeight` (CGFloat) - the height of the triangle, `trianglePosition` (TrianglePosition enum values: .top, .right, .bottom, .left) - the side of the body the triangle will be placed, `cornerRadius` (CGFloat) - the corner radius of the rect body of the view. `cornerRadius` can be omitted.

```swift 3
let pointedRectView = AKPointedRectView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), color: UIColor.white, triangleHeight: 10.0, trianglePosition: .top, cornerRadius: 2.0)
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
