# Overview - 2D Stealth
 This project is a 2D top-down stealth system made for projects in Godot. The player detection and states are individualized for every enemy, so developers can easily drag and drop enemy instances into the scene. Enemies cannot move, but are able to detect a player in their vision, as well as lose sight of players hiding behind objects.

 ## Player Detection
 This mechianic relies on **collision detection** and raycasting to detect the player inside their line of sight or peripheral view, and will lose sight of the player if they hide. When the player moves inside the line of sight of an enemy, they are inside a collision shape. The system uses an **Area2D** node to detect and handle all the collisions that happen between the player and the enemy's vision. **Raycasting** is used to determine if there is anything between the enemy and the player, blocking its vision and keeping the player undetected.

 ## Usage
 The player instance can be replaced with a custom player or deleted. As long as it has a collision shape, it will work. Enemies can be customized as well, and the current collision shapes can be replaced or edited however you wish. As long as the collision shapes exist under an **Area2D** component, they will be used for collision detection and will target the player. Developers will have to put in their own movement algorithms.
