CanvasScale9
============

Scale 9 (9-slice) scaling transform for HTML 5 Canvas images.

Basic usage:
```javascript
myScale9 = new Scale9(myImage, 10, 10, 200, 200)
myScale9.resize(newWidth, newHeight)
myscale9.drawImageTo(myCanvasContext, 0, 0)
```

**Example**
[The Wine Glass Example](http://senocular.github.com/CanvasScale9/examples/TheWineGlass.html)

Note: This code is written in CoffeeScript, and compiled dynamically using the CoffeeScript libary. I didn't include a JavaScript version in the repo but can by request.  In the meantime you can also perform a quick manual conversion via [coffeescript.org](http://coffeescript.org/) (or your own installed version of CoffeeScript).

Note: The sample HTML file may not function when run locally due to browser-based security restrictions preventing the loading of the Scale9 CoffeeScript file. You may need to run the file from a server (http) location.


Constructor
-----------

`new Scale9(image, x, y, width, height)`

Creates a new Scale9 instance.

* `image`: An Image instance to resize with 9-slice scaling
* `x`: the left edge of the scale 9 grid rectangle defining the 9-slice scaling sectors of the image
* `y`: the top edge of the scale 9 grid rectangle 
* `width`: the width of the scale 9 grid rectangle 
* `height`: the height of the scale 9 grid rectangle 


Members
-------

**setRect**

`setRect(x, y, width, height)`

Sets the dimensions of the scale 9 grid rectangle defining the 9-slice scaling sectors of the scaled image. This is modeled after the [scale9Grid](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/DisplayObject.html#scale9Grid) property used in ActionScript.

* `x`: the left edge of the scale 9 grid rectangle
* `y`: the top edge of the scale 9 grid rectangle 
* `width`: the width of the scale 9 grid rectangle 
* `height`: the height of the scale 9 grid rectangle 

**getRect**

`getRect()`

Returns the dimensions of the scale 9 grid rectangle defining the 9-slice scaling sectors of the scaled image. The dimensions are returned as a generic object with the following properties:

* `x`: the left edge of the scale 9 grid rectangle
* `y`: the top edge of the scale 9 grid rectangle 
* `width`: the width of the scale 9 grid rectangle 
* `height`: the height of the scale 9 grid rectangle 


**resize**

`resize(width, height)`

Resizes the scaled image to a specific width and height.

* `width`: the new width of the image
* `height`: the new height of the image


**scale**

`scale(scaleX, scaleY)`

Scales the scaled image to a specific width and height based on a percentage of the image's original width and height.

* `scaleX`: a percentage to scale the width of the image
* `scaleY`: a percentage to scale the height of the image


**drawImageTo**

`drawImageTo(context2d, x, y)`

Draws the scaled image to the specified canvas context at the specified coordinates in the canvas.  This mirrors Context2D.drawImage, but does not support the additional resizing parameters (x and y position only).

* `context2d`: the context in which to draw the scaled image
* `x`: the x location to draw the image
* `y`: the y location to draw the image