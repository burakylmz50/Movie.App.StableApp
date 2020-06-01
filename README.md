
<table>
  <tr>
    <td>Launch Screen</td>
     <td>Home Page</td>
     <td>Details Page-1</td>
    <td>Details Page-2</td>
  </tr>
  <tr>
    <td valign="top"><img src="https://raw.githubusercontent.com/burakylmz50/Movie.App.StableApp/master/Images/Stable%20App-1.png?token=AJSWA2XO7RK6ACJAI2IR44262V3SA"></td>
    <td valign="top"><img src="https://raw.githubusercontent.com/burakylmz50/Movie.App.StableApp/master/Images/Stable%20App-2.png.png?token=AJSWA2RCBEYKSNVKRKVHBD262V3Z6"></td>
    <td valign="top"><img src="https://raw.githubusercontent.com/burakylmz50/Movie.App.StableApp/master/Images/Stable%20App-3.png.png?token=AJSWA2Q2TGU4FDYQH2E4JJS62V33I"></td>
       <td valign="top"><img src="https://raw.githubusercontent.com/burakylmz50/Movie.App.StableApp/master/Images/Stable%20App-4.png.png?token=AJSWA2SEJIMKXX5PXSFC25C62V336"></td>
  </tr>
 </table>

## Setup
* Close Xcode
* Open a terminal window, and $ cd into your project directory.
* Run $ pod install
* You may require to run $ pod update
* $ open MoviesApplication.xcworkspace and build.

## Code structure

I check if there is any change in the data at 1-minute intervals. If there is any change, I refresh the list and direct the user to the top of the page.

The movie found when the watch button is pressed is saved in the phone's memory.
* If the button is Yellow, the phone is in the memory,
* if the button is Red, the phone is deleted from memory,
* if the button is dark gray, it means the phone is not in memory.


## Design pattern
MVC design pattern is used for this project.

## Third Party Libraries
* <a href="https://github.com/SnapKit/SnapKit">SnapKit</a>
* <a href="https://github.com/0xced/XCDYouTubeKit">XCDYouTubeKit</a>


## Design
The designs were made on **Figma** depend on the template you sent.

## Requirements
* iOS 13.2+
* Xcode 11.0+
* Swift 4.0+

## Author
If you wish to contact me, email at: byilmaz50@hotmail.com

## License
Stable App is available under the MIT license. See the LICENSE file for more info.
