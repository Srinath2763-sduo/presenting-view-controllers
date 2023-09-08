#  About

### This an experiment project to see how different properties play out while presenting a view controller on different screen sizes, and from container view controllers.

1. Red View Controller is root view of a nav controller. The nav controller is the root view presented by window.

2. Red View Controller exposes a picker which dynamically sets the `modalPresentationStyle` of the Green View Controller 

3. Anytime you present a view controller, Green View Controller is instantiated and presented / showed / showed detail of, based on the picker value selected.

4. Yellow View is embedded in a container view controller. clicking on show / present / show detail calls appropriate methods on the yellow view controller.

# To see the actual magic:
## run on any device, choose currentContext in the picker and on the yellow view controller (embedded) click `present` button. Now changet picker value to anything other than currentContext / overCurrentContext. See how the presentation varies. This project quickly helps you to preview how different configs on UIViewController can help you achieve the desired presentations.

 ![Simulator Screen Shot - iPhone 14 Pro - 2023-09-08 at 00 30 23](https://github.com/Srinath2763-sduo/presenting-view-controllers/assets/62918398/abaee980-70f9-4948-968f-a4fcdc826777)
![Simulator Screen Shot - iPhone 14 Pro - 2023-09-08 at 00 30 50](https://github.com/Srinath2763-sduo/presenting-view-controllers/assets/62918398/eab125f4-cd52-4170-88e9-e225e5896d64)

# Note:
## App will crash in a popover right now.
