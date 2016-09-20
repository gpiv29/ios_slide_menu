# ios_slide_menu

gpiv29 (Guido Pardi)

Here lies the only living code from an application idea that lost its way - it is the functioning beginning of an app which has a slide out menu and two pages. I emphasized the use of storyboards to create the familiar effect of a menu sliding into view, which is dismissed when tapping one of its items or tapping the space outside of the menu. 

RootController uses a "side panel" view to represent the menu, a "shadow view" to represent the semi-transparent area that can be tapped to dismiss the menu, and a container view which holds the opened screen and slides off of the right edge of view. The menu starts off of the left edge of the screen and animates into view using animateWithDuration.

Some constraints were added to illustrate how one can layout views in a responsive way. Of course, all of the labels are a bit bizarre and reflect an app I was creating called "Peoplenotes"; There is one page for displaying People, and one page for displaying Lists (the intention was for users to be able to store a directory of people, and use lists to keep notes about them i.e. if you are taking attendence, if you owe a group of people money, etc.). I began adding models to coredata for creating a database of People and Lists, but gutted all of that for the greater good of having a working project to refer to.

