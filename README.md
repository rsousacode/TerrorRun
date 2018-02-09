------------ Made in Processing 3 
------------ 
This is sketch game using the Tiled Map Editor, and it's prototype using a darkness effect. You play as Grin, a skeleton that is lost in the world of darkness.

He only has a lantern, and need's to catch batteries to mantain his light. Traps and enemies waits from him.

This is just a prototype and has intended bugs.

----
-------------
----
-------------
----
------------
How I run/build the source code?
------------
You have to install https://processing.org, use the default "Java" core of that IDE.
Use libraries (Sketch -> Add Library) 
minim library,
ptmx (for loading the map)
----
---
----
------------
------------

Some exercises you have to do to improve the quality of the code: 

- Improve your use of constructors. Define them such that most of the initial state is passed as arguments. This greatly increases the flexibility of the classes, making them less dependent on other specific objects and classes.

- Calling the Handler class GameObjectManager would help.

- The ID enumeration is not really necessary.

- Calling “scoreManager” to the only instance of GameManager is really confusing.

- Game state and the various related booleans should be part of the GameManager class. The same for the various game objects.
Meaningless names such as “buffer13” should be avoided at all costs.

- The code does need even more refactoring (https://en.wikipedia.org/wiki/Code_refactoring).
---
---
------------
------------

