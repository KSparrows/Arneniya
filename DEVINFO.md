Firstly, the list of variables in the program with brief descriptions follows:

questionPool, a matrix of question strings
sSize, zFactor, and BGC, being sprite size, zoom factor and background color- all data members of the myscn object that will be used to create a figure
myscn, a simpleGameEngine object
gameActive, a boolean that is used to enable the main game loop
gridLength, the length of the grid (15x15)
grass, trees, avatarCode, enemyCode, house, house2, house3, etc - all variables that are equal to various positions on the sprite sheet
background, a matrix of sprite codes to be passed as a parameter to drawScene along with myscn and avatar to create the figure (this extends to background1, background2, background3, and background4 depending on what building the user is in)
avatar, a matrix of sprite codes passed as a parameter to drawScene that is layered over top of background
isWalkable and isBuilding, boolean 15x15 matrices that dictate whether or not certain tiles are building tiles or walkable
avatarVert and avatarHorz, the col and row coordinates for the avatar sprite code on the avatar matrix
aiVert and aiHorz, col and row coordinates for the ai sprite code on the avatar matrix
treeCount, the amount of trees that will be generated. This is relevant because trees are generated procedurally
switchScene, boolean that handles switching to a new background, true when the avatar is adjacent to an isBuilding == 1 tile
currentBackground, variable that is set to whatever the current background is
isWalkableMain and isBuildingMain, variables that are set to the boolean matrices of the default isWalkable and isBuilding backgrounds, logically these do not need to exist but they make the code more readable
k, string that calls getKeyboardInput from simpleGameEngine to record a key input
ghosted, boolean that is true when the user is adjacent to the ghost
sceneOn, integer variable that rotates between 1,2,3, and 4 depending on which building the user attempts to enter

--- In the askQuestion() function ---
questionIndex, randomly generated integer that grabs the position of any question in the questionPool matrix
currentQuestion, string that uses questionIndex to find the actual question at that index
options, string that uses questionIndex to find the answer options at that index
correctAnswer, string that uses questionIndex to find the correct answer at that index
playerAnswer, variable that uses k and by extension getKeyboardInput to record the player's answer

--- In the GoTowardsPlayer() function ---
horzDistance, horizontal distance between player and ai
vertDistance, vertical distance between player and ai

-- MAIN PROCEDURE --
Load the 'simpleGameEngine' file to access all sprites of characters and backgrounds. Establish the size of the sprites and display window, as well as the references to the sprite numbers and color of the background of the game, the player's avatar, grass, trees, buildings, etc. Use a randi system to procedurally assign trees to the display window, being certain to account for the player's avatar location to cause no further errors upon running the game, as well as that the code cooperates with the latter lines for assigning areas to be "walkable" or not. Hardcode the positions of buildings (it must be this way). Declare variables for switching the scene, the current background, player avatar, and the ghost AI.

-- Main Gameplay Loop --

At any point, if gameActive is set to false. the gameplay loop is terminated. This happens when a question is answered incorrectly or the enemyCode becomes adjacent to the avatarCode.

Call getKeyboardInput to read keyboard interaction from the user into variable 'k'. For the up arrow, down arrow, right arrow, and left arrow respectively, ensure that tile the avatar would move to returns false for isBuilding and true for isWalkable. If these conditions are met, either avatarVert or avatarHorz are incremented or decremented by one, depending on the direction, and GoTowardsPlayer() is called to move the AI in the direction of the player. If it would return true for isBuilding, prompt the user to press 'e'. If it would return false for isWalkable, the user may not move. The background and avatar parameters to the drawScene function are updated every time the loop is run through, so the player may move at any time.

switchScene is active whilst the avatarCode on the avatar matrix is adjacent to a true tile on the isBuilding matrix. While switchScene is active (true), sceneOn is set to either 1, 2, 3, or 4 depending on which building the player is adjacent to. If the player presses 'e' at this point, drawScene is called with currentBackground, which had already been changed to the corresponding background to the sceneOn code. If the player presses 'q' while in a building, currentBackground is changed to default and drawScene is again called with currentBackground.

When a room is entered, askQuestion is called with the myscn object and background parameters. gameActive is returned to give the function control of the game loop. In the function, a random question is selected, getKeyboardInput is called, and if the answer would be correct, the user score is incremented and they are free to walk around the currentBackground, which is why background is a parameter. gameActive is returned as true. If the answer would be incorrect, gameActive is returned as false.

GoTowardsPlayer() is called each time the loop iterates. In the function, the horizontal and vertical distance between the location of the enemyCode and the avatarCode on the avatar matrix is calculated, and the enemyCode makes the most optimal change in order to close the distance between itself and the avatarCode. Within the loop, variables for the old coordinates of the enemyCode are created and wiped right before GoTowardsPlayer() would be called so that there is only one enemyCode in the avatar matrix at any time.
