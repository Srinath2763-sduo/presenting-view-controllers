#  About

### This an experiment project to see how different properties play out while presenting a view controller on different screen sizes, and from container view controllers.

1. Red View Controller is root view of a nav controller. The nav controller is the root view presented by window.

2. Red View Controller exposes a picker which dynamically sets the `modalPresentationStyle` of the Green View Controller 

3. Anytime you present a view controller, Green View Controller is instantiated and presented / showed / showed detail of, based on the picker value selected.

4. Yellow View is embedded in a container view controller. clicking on show / present / show detail calls appropriate methods on the yellow view controller.

#To see the actual magic:
## choose current context in the picker and on the yellow view controller (embedded) click `present` button  

