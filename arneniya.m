% Arneniya: the OFFICIAL source code
% Adam Khadre
% Developed 11/23


% clear variables and console
clear all; 

clc; 

close all; 
% question pool for trivia questions to ask the player
questionPool = {
    'Easy Question: What is the capital of France?', 'a: Madrid', 'b: Rome', 'c: Paris', 'c';
    'Intermediate Question: Who wrote "Romeo and Juliet"?', 'a: Charles Dickens', 'b: William Shakespeare', 'c: Jane Austen', 'b';
    'Hard Question: What is the boiling point of water in Celsius?', 'a: 100°C', 'b: 0°C', 'c: 50°C', 'a';

    'Easy Question: Which element has the chemical symbol "O"?', 'a: Oxygen', 'b: Gold', 'c: Iron', 'a';
    'Intermediate Question: In which year did the Titanic sink?', 'a: 1912', 'b: 1905', 'c: 1920', 'a';
    'Hard Question: Who was the first woman to win a Nobel Prize?', 'a: Marie Curie', 'b: Amelia Earhart', 'c: Jane Goodall', 'a';

    'Easy Question: What is the largest desert in the world?', 'a: Sahara Desert', 'b: Gobi Desert', 'c: Antarctic Desert', 'c';
    'Intermediate Question: Who is known as the "Father of Computer Science"?', 'a: Bill Gates', 'b: Alan Turing', 'c: Steve Jobs', 'b';
    'Hard Question: What is the speed of sound in dry air at sea level?', 'a: 343 meters per second', 'b: 500 meters per second', 'c: 250 meters per second', 'a';

    'Easy Question: Which planet is known as the "Morning Star" or "Evening Star"?', 'a: Mars', 'b: Venus', 'c: Jupiter', 'b';
    'Intermediate Question: Who painted the "Starry Night"?', 'a: Pablo Picasso', 'b: Vincent van Gogh', 'c: Claude Monet', 'b';
    'Hard Question: What is the largest organ in the human body?', 'a: Liver', 'b: Heart', 'c: Skin', 'c';

    'Easy Question: What is the currency of Japan?', 'a: Yuan', 'b: Yen', 'c: Won', 'b';
    'Intermediate Question: In which year did the Berlin Wall fall?', 'a: 1989', 'b: 1975', 'c: 1995', 'a';
    'Hard Question: What is the chemical symbol for silver?', 'a: Si', 'b: Ag', 'c: Au', 'b';

    'Easy Question: Who wrote "Hamlet"?', 'a: Jane Austen', 'b: William Shakespeare', 'c: Charles Dickens', 'b';
    'Intermediate Question: What is the largest moon of Saturn?', 'a: Titan', 'b: Europa', 'c: Ganymede', 'a';
    'Hard Question: What is the smallest prime number?', 'a: 1', 'b: 2', 'c: 3', 'b';

    'Easy Question: Which ocean is the largest?', 'a: Indian Ocean', 'b: Atlantic Ocean', 'c: Pacific Ocean', 'c';
    'Intermediate Question: Who discovered penicillin?', 'a: Alexander Fleming', 'b: Marie Curie', 'c: Louis Pasteur', 'a';
    'Hard Question: What is the capital of Australia?', 'a: Sydney', 'b: Melbourne', 'c: Canberra', 'c';

    'Easy Question: What is the main ingredient in guacamole?', 'a: Tomatoes', 'b: Avocado', 'c: Onions', 'b';
    'Intermediate Question: How many continents are there on Earth?', 'a: 5', 'b: 7', 'c: 10', 'b';
    'Hard Question: What is the powerhouse of the cell?', 'a: Nucleus', 'b: Mitochondria', 'c: Ribosome', 'b';

    'Easy Question: What is the currency of the United Kingdom?', 'a: Euro', 'b: Pound Sterling', 'c: Dollar', 'b';
    'Intermediate Question: What is the largest desert in Africa?', 'a: Sahara Desert', 'b: Kalahari Desert', 'c: Namib Desert', 'a';
    'Hard Question: What is the capital of Canada?', 'a: Toronto', 'b: Ottawa', 'c: Vancouver', 'b';

    'Easy Question: Who is the author of "Harry Potter and the Philosopher''s Stone"?', 'a: J.R.R. Tolkien', 'b: J.K. Rowling', 'c: George R.R. Martin', 'b';
    'Intermediate Question: What is the square root of 121?', 'a: 11', 'b: 12', 'c: 13', 'a';
    'Hard Question: Who developed the theory of general relativity?', 'a: Isaac Newton', 'b: Albert Einstein', 'c: Stephen Hawking', 'b';

    'Easy Question: What is the largest planet in our solar system?', 'a: Earth', 'b: Jupiter', 'c: Mars', 'b';
    'Intermediate Question: In which year did the first manned moon landing occur?', 'a: 1969', 'b: 1975', 'c: 1985', 'a';
    'Hard Question: What is the chemical symbol for gold?', 'a: Au', 'b: Ag', 'c: Fe', 'a';
    
    'Easy Question: Which animal is known as the "King of the Jungle"?', 'a: Elephant', 'b: Lion', 'c: Giraffe', 'b';
    'Intermediate Question: Who wrote "The Great Gatsby"?', 'a: F. Scott Fitzgerald', 'b: Ernest Hemingway', 'c: Jane Austen', 'a';
    'Hard Question: What is the speed of light in a vacuum?', 'a: 300,000 kilometers per second', 'b: 500,000 kilometers per second', 'c: 700,000 kilometers per second', 'a';

    'Easy Question: What is the largest mammal on Earth?', 'a: Elephant', 'b: Blue Whale', 'c: Giraffe', 'b';
    'Intermediate Question: Who painted the Mona Lisa?', 'a: Pablo Picasso', 'b: Leonardo da Vinci', 'c: Vincent van Gogh', 'b';
    'Hard Question: What is the chemical symbol for lead?', 'a: Ld', 'b: Pb', 'c: Le', 'b';

    'Easy Question: Which country is known as the "Land of the Rising Sun"?', 'a: China', 'b: Japan', 'c: South Korea', 'b';
    'Intermediate Question: What is the largest organ in the human brain?', 'a: Cerebellum', 'b: Frontal Lobe', 'c: Cerebrum', 'c';
    'Hard Question: What is the square root of 144?', 'a: 10', 'b: 12', 'c: 14', 'b';

    'Easy Question: What is the currency of China?', 'a: Yuan', 'b: Yen', 'c: Won', 'a';
    'Intermediate Question: In which year did World War II end?', 'a: 1943', 'b: 1945', 'c: 1950', 'b';
    'Hard Question: Who developed the theory of evolution by natural selection?', 'a: Charles Darwin', 'b: Gregor Mendel', 'c: Thomas Edison', 'a';

    'Easy Question: What is the main ingredient in hummus?', 'a: Chickpeas', 'b: Lentils', 'c: Quinoa', 'a';
    'Intermediate Question: Which planet is known as the "Red Planet"?', 'a: Mars', 'b: Venus', 'c: Jupiter', 'a';
    'Hard Question: What is the chemical symbol for nitrogen?', 'a: Ni', 'b: Nt', 'c: N', 'c';

    'Easy Question: Who is the current president of the United States?', 'a: Joe Biden', 'b: Donald Trump', 'c: Barack Obama', 'a';
    'Intermediate Question: What is the largest bone in the human body?', 'a: Femur', 'b: Tibia', 'c: Humerus', 'a';
    'Hard Question: What is the capital of South Africa?', 'a: Johannesburg', 'b: Cape Town', 'c: Pretoria', 'c';

    'Easy Question: Which planet is closest to the sun?', 'a: Earth', 'b: Venus', 'c: Mercury', 'c';
    'Intermediate Question: Who wrote "To Kill a Mockingbird"?', 'a: J.K. Rowling', 'b: Harper Lee', 'c: George Orwell', 'b';
    'Hard Question: What is the boiling point of nitrogen in Celsius?', 'a: -196°C', 'b: -50°C', 'c: 0°C', 'a';

    'Easy Question: What is the currency of Brazil?', 'a: Peso', 'b: Real', 'c: Sol', 'b';
    'Intermediate Question: In which year did the American Civil War begin?', 'a: 1850', 'b: 1861', 'c: 1875', 'b';
    'Hard Question: Who discovered the structure of DNA?', 'a: James Watson', 'b: Rosalind Franklin', 'c: Francis Crick', 'c';

    'Easy Question: What is the largest bird in the world?', 'a: Penguin', 'b: Ostrich', 'c: Eagle', 'b';
    'Intermediate Question: Who composed the "Moonlight Sonata"?', 'a: Ludwig van Beethoven', 'b: Wolfgang Amadeus Mozart', 'c: Johann Sebastian Bach', 'a';
    'Hard Question: What is the chemical symbol for potassium?', 'a: Pt', 'b: K', 'c: Po', 'b';

    'Easy Question: What is the capital of Mexico?', 'a: Madrid', 'b: Rome', 'c: Mexico City', 'c';
    'Intermediate Question: What is the largest continent by land area?', 'a: Europe', 'b: Asia', 'c: North America', 'b';
    'Hard Question: What is the freezing point of ethanol in Celsius?', 'a: -114°C', 'b: -70°C', 'c: 0°C', 'a';

    'Easy Question: Who wrote "Pride and Prejudice"?', 'a: Charles Dickens', 'b: Jane Austen', 'c: Emily Brontë', 'b';
    'Intermediate Question: What is the smallest prime number greater than 10?', 'a: 11', 'b: 13', 'c: 15', 'a';
    'Hard Question: What is the capital of Argentina?', 'a: Buenos Aires', 'b: Rio de Janeiro', 'c: Santiago', 'a';

    'Easy Question: What is the main ingredient in sushi?', 'a: Rice', 'b: Noodles', 'c: Quinoa', 'a';
    'Intermediate Question: Who discovered electricity?', 'a: Benjamin Franklin', 'b: Thomas Edison', 'c: Nikola Tesla', 'a';
    'Hard Question: What is the chemical symbol for neon?', 'a: Ne', 'b: No', 'c: Na', 'a';

    'Easy Question: What is the currency of India?', 'a: Rupee', 'b: Ringgit', 'c: Baht', 'a';
    'Intermediate Question: What is the largest desert in North America?', 'a: Mojave Desert', 'b: Sonoran Desert', 'c: Great Basin Desert', 'c';
    'Hard Question: Who discovered radioactivity?', 'a: Ernest Rutherford', 'b: Marie Curie', 'c: Niels Bohr', 'b';

    'Easy Question: Who is the author of "The Catcher in the Rye"?', 'a: J.D. Salinger', 'b: F. Scott Fitzgerald', 'c: Ernest Hemingway', 'a';
    'Intermediate Question: What is the largest moon of Jupiter?', 'a: Callisto', 'b: Europa', 'c: Ganymede', 'c';
    'Hard Question: What is the chemical symbol for uranium?', 'a: Ua', 'b: Ur', 'c: U', 'c';

    'Easy Question: What is the capital of Russia?', 'a: Moscow', 'b: St. Petersburg', 'c: Kiev', 'a';
    'Intermediate Question: In which year did the Spanish Civil War end?', 'a: 1936', 'b: 1939', 'c: 1945', 'b';
    'Hard Question: What is the molecular formula of glucose?', 'a: C6H10O4', 'b: C6H12O6', 'c: C6H14O2', 'b';

    'Easy Question: What is the largest island in the world?', 'a: Greenland', 'b: Australia', 'c: Borneo', 'a';
    'Intermediate Question: Who discovered the law of gravitation?', 'a: Galileo Galilei', 'b: Isaac Newton', 'c: Johannes Kepler', 'b';
    'Hard Question: What is the capital of South Korea?', 'a: Seoul', 'b: Tokyo', 'c: Beijing', 'a';

    'Easy Question: What is the main ingredient in paella?', 'a: Rice', 'b: Pasta', 'c: Quinoa', 'a';
    'Intermediate Question: Which planet is known as the "Blue Planet"?', 'a: Earth', 'b: Neptune', 'c: Uranus', 'a';
    'Hard Question: What is the chemical symbol for mercury?', 'a: Hg', 'b: Me', 'c: Ma', 'a';

    'Easy Question: Who wrote "The Hobbit"?', 'a: J.K. Rowling', 'b: J.R.R. Tolkien', 'c: C.S. Lewis', 'b';
    'Intermediate Question: What is the largest river in the world by discharge?', 'a: Nile', 'b: Amazon', 'c: Mississippi', 'b';
    'Hard Question: What is the capital of Thailand?', 'a: Jakarta', 'b: Bangkok', 'c: Manila', 'b';

    'Easy Question: What is the currency of Australia?', 'a: Dollar', 'b: Pound Sterling', 'c: Euro', 'a';
    'Intermediate Question: What is the smallest bone in the human body?', 'a: Stapes', 'b: Femur', 'c: Tibia', 'a';
    'Hard Question: Who developed the first successful polio vaccine?', 'a: Jonas Salk', 'b: Albert Sabin', 'c: Edward Jenner', 'a';

    'Easy Question: What is the main ingredient in pesto sauce?', 'a: Basil', 'b: Spinach', 'c: Kale', 'a';
    'Intermediate Question: What is the largest planet in our galaxy?', 'a: Jupiter', 'b: Saturn', 'c: Neptune', 'a';
    'Hard Question: What is the chemical symbol for tin?', 'a: Tn', 'b: Ti', 'c: Sn', 'c';

    'Easy Question: What is the capital of Spain?', 'a: Barcelona', 'b: Madrid', 'c: Valencia', 'b';
    'Intermediate Question: What is the smallest prime number greater than 20?', 'a: 21', 'b: 23', 'c: 27', 'b';
    'Hard Question: Who discovered penicillin?', 'a: Alexander Fleming', 'b: Louis Pasteur', 'c: Joseph Lister', 'a';

    'Easy Question: What is the main ingredient in guacamole?', 'a: Tomatoes', 'b: Avocado', 'c: Onions', 'b';
    'Intermediate Question: How many bones are there in the adult human body?', 'a: 206', 'b: 216', 'c: 226', 'a';
    'Hard Question: What is the capital of Nigeria?', 'a: Lagos', 'b: Abuja', 'c: Accra', 'b';

    'Easy Question: Who is the author of "1984"?', 'a: George Orwell', 'b: Aldous Huxley', 'c: Ray Bradbury', 'a';
    'Intermediate Question: What is the largest desert in Asia?', 'a: Gobi Desert', 'b: Arabian Desert', 'c: Thar Desert', 'a';
    'Hard Question: What is the chemical symbol for phosphorus?', 'a: Ph', 'b: Ps', 'c: P', 'c';

    'Easy Question: What is the currency of South Africa?', 'a: Rand', 'b: Peso', 'c: Won', 'a';
    'Intermediate Question: Who discovered the structure of benzene?', 'a: Dmitri Mendeleev', 'b: Robert Boyle', 'c: Friedrich August Kekulé', 'c';
    'Hard Question: What is the capital of Indonesia?', 'a: Bangkok', 'b: Jakarta', 'c: Kuala Lumpur', 'b';

    'Easy Question: What is the main ingredient in risotto?', 'a: Rice', 'b: Pasta', 'c: Barley', 'a';
    'Intermediate Question: What is the largest moon of Neptune?', 'a: Triton', 'b: Titan', 'c: Europa', 'a';
    'Hard Question: What is the molecular formula of methane?', 'a: CH3', 'b: C2H4', 'c: CO2', 'a';

    'Easy Question: What is the capital of Canada?', 'a: Toronto', 'b: Ottawa', 'c: Vancouver', 'b';
    'Intermediate Question: What is the smallest prime number greater than 30?', 'a: 31', 'b: 33', 'c: 37', 'a';
    'Hard Question: Who developed the theory of relativity?', 'a: Isaac Newton', 'b: Albert Einstein', 'c: Niels Bohr', 'b';
    
    'Easy Question: What is the currency of South Korea?', 'a: Yen', 'b: Won', 'c: Yuan', 'b';
    'Intermediate Question: What is the largest desert in Europe?', 'a: Sahara Desert', 'b: Gobi Desert', 'c: Arctic Desert', 'c';
    'Hard Question: What is the chemical symbol for chlorine?', 'a: Cl', 'b: Ch', 'c: Cn', 'a';

    'Easy Question: Who is known as the "Queen of Pop"?', 'a: Madonna', 'b: Beyoncé', 'c: Lady Gaga', 'a';
    'Intermediate Question: What is the largest lake in Africa?', 'a: Lake Victoria', 'b: Lake Tanganyika', 'c: Lake Malawi', 'a';
    'Hard Question: What is the capital of Saudi Arabia?', 'a: Riyadh', 'b: Jeddah', 'c: Mecca', 'a';
};


% set up environment for the game engine 

sSize = 16; % sprite size, based on actual size on sprite sheet 

zFactor = 10; % zoom factor, based on how big you want displayed images to be 

BGC = [22, 138, 22]; % background color, an RGB value, this being green

% call simpleGameEngine() to create a myscn object
myscn = simpleGameEngine("retro_pack.png", sSize, sSize,zFactor, BGC); 

% boolean that the game loop runs on ( as long as this is true, game is
% active)
gameActive = true; 

gridLength = 15; % length of the grid

grass = 8; % sprite code of grass

trees = [34:38, 71, 72]; % tree sprite codes are 34-38, 71, 72

treeCount = 25; % amount of trees to be displayed

avatarCode = 25; % sprite code of the avatar

% sprite codes of houses
house = 647; 

house2 = 646; 

house3 = 643; 

% set the whole background to grass
background(1:gridLength,1:gridLength) = grass;  

isWalkable = true(gridLength, gridLength); % matrix of spaces that the player is allowed to walk over
isBuilding = false(gridLength, gridLength); % matrix of spaces that the player is allowed to walk over
avatar = ones(gridLength, gridLength); % matrix of empty spaces to layer over background sprites
avatarVert = 7; % vertical position of avatar
avatarHorz = 7; % horizontal position of avatar 
score = 0; % score of player, increments when they get a question right
aiVert = randi([1, gridLength]); % vertical position of ai
aiHorz = randi([1, gridLength]); % horizontal position of ai
avatar(avatarVert, avatarHorz) = avatarCode; % create avatar matrix to layer over background
enemyCode = 220; % ai ghost sprite code
avatar(aiVert, aiHorz) = enemyCode; % add ghost to avatar matrix


% loop to generate trees in random positions
for i = 1:treeCount
    treeX = randi([1 gridLength],1);
    treeY = randi([1 gridLength],1);
    if treeX ~= avatarHorz && treeY ~= avatarVert
        background(treeX, treeY) = trees(randi([1 5],1));
        isWalkable(treeX, treeY) = false; % tiles where trees are generated are made unwalkable
    end
end 

% create houses on SPECIFIC tiles, these are only hardcoded because they
% are specific
background(13) = house;
isBuilding(13) = true; % isBuilding makes it so that a tile is unWalkable and approaching it prompts the user

background(14) = house;
isBuilding(14) = true;

background(15) = house;
isBuilding(15) = true;

background(28) = house;
isBuilding(28) = true;

background(29) = house;
isBuilding(29) = true;

background(30) = house;
isBuilding(30) = true;

background(43) = house;
isBuilding(43) = true;

background(44) = house;
isBuilding(44) = true;

background(45) = house;
isBuilding(45) = true;

background(193) = house2;
isBuilding(193) = true;

background(194) = house2;
isBuilding(194) = true;

background(195) = house2;
isBuilding(195) = true;

background(208) = house2;
isBuilding(208) = true;

background(209) = house2;
isBuilding(209) = true;

background(210) = house2;
isBuilding(210) = true;

background(223) = house2;
isBuilding(223) = true;

background(224) = house2;
isBuilding(224) = true;

background(225) = house2;
isBuilding(225) = true;

background(181) = house3;
isBuilding(181) = true;

background(182) = house3;
isBuilding(182) = true;

background(183) = house3;
isBuilding(183) = true;

background(196) = house3;
isBuilding(196) = true;

background(197) = house3;
isBuilding(197) = true;

background(198) = house3;
isBuilding(198) = true;

background(211) = house3;
isBuilding(211) = true;

background(212) = house3;
isBuilding(212) = true;

background(213) = house3;
isBuilding(213) = true;

% continue to draw buildings, not hardcoded
for i = 1:3 

    background(i*gridLength-14) = 18+i;
    isBuilding(i*gridLength-14) = true;

end 

for i = 1:3 

    background(i*gridLength-13) = 18+32+i;
    isBuilding(i*gridLength-13) = true;

end 

for i = 1:3 

    background(i*gridLength-12) = 18+32+32+i;
    isBuilding(i*gridLength-12) = true;

end 

% create an initial scene of trees, buildings, grass, the avatar, and the
% ghost
drawScene(myscn, background, avatar); 

% create a title and score displayer
title('Arneniya: Use Arrow Keys to Move to Buildings and Find Quests');
xlabel(['Score:  ', num2str(score)]);

% declare some more variables (these had to be declared after the first
% scene is drawn)
switchScene = false; % handles the user switching to another room
currentBackground = background; % sets the current background, used later to ensure the user stays in the current room after answering questions
isWalkableMain = isWalkable; % makes the distinction between the matrix of walkable tiles for the default scene and any other scene
isBuildingMain = isBuilding; % see above
currentWalkable = isWalkableMain; % matrix of tiles that are currently walkable for the given scene
currentBuilding = isBuildingMain; % see above

 while gameActive % infinite loop that continuously repeats until the game ends and gameActive is changed
    k = getKeyboardInput(myscn); % read keyboard input
    % check if the ghost ai reached the avatar WITHOUT going out of bounds
    % of the 15x15 foreground matrix
   if avatarVert > 1 && ismember(avatar(aiVert, aiHorz), avatar(avatarVert - 1, avatarHorz)) || ...
   avatarVert < gridLength && ismember(avatar(aiVert, aiHorz), avatar(avatarVert + 1, avatarHorz)) || ...
   avatarHorz > 1 && ismember(avatar(aiVert, aiHorz), avatar(avatarVert, avatarHorz - 1)) || ...
   avatarHorz < gridLength && ismember(avatar(aiVert, aiHorz), avatar(avatarVert, avatarHorz + 1))
        ghosted = true; % checked later, displays title message
        gameActive = false; % ends game
    end
    % IMPORTANT ---- TO AVOID CLUTTER ONLY THE UPARROW CONDITIONAL IS
    % COMMENTED - ALL OF THE ARROW KEY CONDITIONAL STATEMENT BODIES ARE
    % VIRTUALLY IDENTICAL, COMMENTING THEM ALL IS REDUNDANT

    % checks if the up arrow is pressed and the above tile is valid
    if k == "uparrow" && avatarVert ~= 1 && currentWalkable(avatarVert - 1, avatarHorz) && ~currentBuilding(avatarVert - 1, avatarHorz) % second condition checks if avatar is within bounds
        % clear the old position of the ai and call GoTowardsPlayer
        oldAiVert = aiVert; % set old positions 
        oldAiHorz = aiHorz;
        [aiVert, aiHorz] = GoTowardsPlayer(aiVert, aiHorz, avatarVert, avatarHorz); % call AI function
        avatar(oldAiVert,oldAiHorz) = 1; % clear old position (1 is blank sprite)
        avatar(avatarVert, avatarHorz) = 1; % remove foreground on tile where avatar used to be
        avatarVert = avatarVert - 1; % change vertical coordinate of avatar
        title('Arneniya: Use Arrow Keys to Move to Buildings and Find Quests (q to exit area)'); % update title
    elseif avatarVert ~= 1 && currentBuilding(avatarVert - 1, avatarHorz) % triggers if the above tile is an interactable building
        title('Arneniya: Press E to Enter Village'); % update title
        % check which building the avatar would interact with
        % sceneOn is simply used for later conditionals to decide which
        % interior room to load
        if(avatarVert < 5 && avatarHorz < 5)
            sceneOn = 1; % top left
        elseif(avatarVert < 5 && avatarHorz > 5)
            sceneOn = 2; % top right
        elseif(avatarVert > 5 && avatarHorz < 5)
            sceneOn = 3; % bottom left
        elseif(avatarVert > 5 && avatarHorz  > 5)
            sceneOn = 4; % bottom right
        end
        switchScene = true; % triggers a conditional that causes pressing 'e' to enter a room
    end
    if k == "downarrow" && avatarVert ~= gridLength && currentWalkable(avatarVert + 1, avatarHorz) && ~currentBuilding(avatarVert + 1, avatarHorz) % move down
        oldAiVert = aiVert;
        oldAiHorz = aiHorz;
        [aiVert, aiHorz] = GoTowardsPlayer(aiVert, aiHorz, avatarVert, avatarHorz);
        avatar(oldAiVert,oldAiHorz) = 1;
        avatar(avatarVert, avatarHorz) = 1;
        avatarVert = avatarVert + 1;
        title('Arneniya: Use Arrow Keys to Move to Buildings and Find Quests (q to exit area)');
    elseif avatarVert ~= gridLength && currentBuilding(avatarVert + 1, avatarHorz)
        title('Arneniya: Press E to Enter Village');
        switchScene = true;
        if(avatarVert < 5 && avatarHorz < 5)
            sceneOn = 1;
        elseif(avatarVert < 5 && avatarHorz > 5)
            sceneOn = 2;
        elseif(avatarVert > 5 && avatarHorz < 5)
            sceneOn = 3;
        elseif(avatarVert > 5 && avatarHorz  > 5)
            sceneOn = 4;
        end
    end
    if k == "rightarrow" && avatarHorz ~= gridLength && currentWalkable(avatarVert, avatarHorz + 1) && ~currentBuilding(avatarVert, avatarHorz + 1) % move right
         oldAiVert = aiVert;
        oldAiHorz = aiHorz;
        [aiVert, aiHorz] = GoTowardsPlayer(aiVert, aiHorz, avatarVert, avatarHorz);
        avatar(oldAiVert,oldAiHorz) = 1;
        avatar(avatarVert, avatarHorz) = 1;
        avatarHorz = avatarHorz + 1;
        title('Arneniya: Use Arrow Keys to Move to Buildings and Find Quests (q to exit area)');
    elseif avatarHorz ~= gridLength && currentBuilding(avatarVert, avatarHorz + 1)
        title('Arneniya: Press E to Enter Village');
        if(avatarVert < 5 && avatarHorz < 5)
            sceneOn = 1;
        elseif(avatarVert < 5 && avatarHorz > 5)
            sceneOn = 2;
        elseif(avatarVert > 5 && avatarHorz < 5)
            sceneOn = 3;
        elseif(avatarVert > 5 && avatarHorz  > 5)
            sceneOn = 4;
        end
        switchScene = true;
    end
    if k == "leftarrow" && avatarHorz ~= 1  && currentWalkable(avatarVert, avatarHorz - 1) && ~currentBuilding(avatarVert, avatarHorz - 1) % move left
        oldAiVert = aiVert;
        oldAiHorz = aiHorz;
        [aiVert, aiHorz] = GoTowardsPlayer(aiVert, aiHorz, avatarVert, avatarHorz);
        avatar(oldAiVert,oldAiHorz) = 1;
        avatar(avatarVert, avatarHorz) = 1;
       avatarHorz = avatarHorz - 1;
       title('Arneniya: Use Arrow Keys to Move to Buildings and Find Quests (q to exit area)');
    elseif avatarHorz ~= 1 && currentBuilding(avatarVert, avatarHorz - 1)
        title('Arneniya: Press E to Enter Village');
        if(avatarVert < 5 && avatarHorz < 5)
            sceneOn = 1;
        elseif(avatarVert < 5 && avatarHorz > 5)
            sceneOn = 2;
        elseif(avatarVert > 5 && avatarHorz < 5)
            sceneOn = 3;
        elseif(avatarVert > 5 && avatarHorz  > 5)
            sceneOn = 4;
        end
        switchScene = true;
    end
      if k == "q" % q is the key to return to default area
        title('You Exited the Building') % update title
        drawScene(myscn, background); % redraw default area
        currentBackground = background; % set currentBackground to default
        currentWalkable = isWalkableMain; % set currentWalkable to default
        currentBuilding = isBuildingMain; % set currentBuilding to default
      end

    if switchScene == true % if user is next to a building
        if k == "e" % if they press e
            % currentWalkable and currentBuilding are wiped clean so the
            % user is free to walk where they wish
            currentWalkable(1:gridLength,1:gridLength) = true;
            currentBuilding(1:gridLength,1:gridLength) = false;
            if sceneOn == 1 % the first room
                % decorate the room with background1 as opposed to default
                % background
                floorCode = 526; % sprite code for floor
                background1 = ones(15, 15);
                background1(7:8,1:15) = floorCode; % draw cross floor pattern
                background1(1:15,7:8) = floorCode;
                background1(6) = 30;
                background1(9) = 30;
                background1(6, 15) = 30;
                background1(9, 15) = 30;
                background1(16) = 1;
                background1(1, 1:6) = 228;
                background1(10:14, 10:14) = 406;
                background1(1, 15) = 195;
                background1(15, 1) = 196;

                drawScene(myscn, background1, avatar); % draw the scene with background1
                % call askQuestion() to initiate question part of the game
                gameActive = askQuestion(myscn, questionPool);
                currentBackground = background1; % set currentBackground to background1
                if gameActive % increment score if game has not been lost
                score = score + 1;
                end
            elseif sceneOn == 2 % second room
                floorCode = 555; % sprite code for floor
                background2 = ones(gridLength, gridLength); % initialize background2

                for i = 1:gridLength % loop to draw a diagonal line
                    background2(i,i) = floorCode; 
                    i=i+1;
                end

                for i = 1:gridLength % mirrored diagonal line
                    j = 16-i;
                    background2(j,i) = floorCode; 
                    i=i+1;
                end

                % draw brick floors around the perimeter
                background2(1:15,15) = floorCode;
                background2(1,1:15) = floorCode;
                background2(15,1:15) = floorCode;
                background2(1:15,1) = floorCode;

                % draw knights
                background2(8, 2) = 30;
                background2(8, 14) = 30;
                background2(2, 8) = 30;
                background2(14, 8) = 30; 

                drawScene(myscn, background2); % draw background 2 scene
                % initiate trivia game
                gameActive = askQuestion(myscn, questionPool);
                currentBackground = background2; % set currentBackground to background2
                if gameActive % increment score if game has not been lost
                score = score + 1;
                end
            elseif sceneOn == 3 % third room
                floorCode = 18; % floor sprite code
                background3 = ones(gridLength, gridLength); % initialize background 3

                % loop to fraw a circle pattern
                for i = 1:gridLength
                    for j = 1:gridLength
                        center = 8; % center from edges
                        distance = sqrt((i-center)^2 + (j-center)^2); % distance between circles
                        circleWidth = 2; % width of any circle (can change)
                        % check if the number of times the circle fits into
                        % the distance is an even integer
                        if mod(floor(distance / circleWidth), 2) == 0
                            background3(j, i, :) = floorCode;
                        end
                    end
                end

                % draw candles
                background3(5:11,15) = 485;
                background3(15,5:11) = 485;
                background3(1,5:11) = 485;
                background3(5:11,1) = 485;

                drawScene(myscn, background3); % draw background 3 scene
                % initiate trivia game
                gameActive = askQuestion(myscn, questionPool);
                currentBackground = background3; % set currentBackground to background3
                if gameActive % increment score if game has not been lost
                    score = score + 1;
                end
            elseif sceneOn == 4 % fourth room

                floorCode = 526; % sprite code for floor
                background4 = ones(15, 15); % initialize background 4

                for i = 1:gridLength % loop to create a checkerboard
                    for j = 1:gridLength
                        if mod(i, 2) == 0 && mod(j, 2) == 0 % check if i and j are even
                            background4(j, i, :) = floorCode;
                        elseif mod(i, 2) ~= 0 && mod(j, 2) ~= 0 % check if i and j are false
                            background4(j, i, :) = floorCode;
                        end
                    end
                end
                
                % background decor
                background4(6:9,1:15) = 1;
                background4(1:15,6:9) = 1;
                background4(6:9,6:9) = 406;

                drawScene(myscn, background4); % draw background 4 scene
                % initiate trivia game
                gameActive = askQuestion(myscn, questionPool);
                currentBackground = background4; % set currentBackground to background4
                if gameActive % increment score if game has not been lost
                    score = score + 1;
                end
            end
        end
    end 
   avatar(avatarVert, avatarHorz) = avatarCode; % replace avatar on foreground given new position
   avatar(aiVert, aiHorz) = enemyCode; % replace ghost on foreground given new position
   drawScene(myscn, currentBackground, avatar);  % recreate the updated figure with new foreground
   xlabel(['Score:  ', num2str(score)]); % update score
 end % end game loop

 if ghosted % display funny title if caught by ghost
     title('Adam the Ghost got you- Game OVER!');
 end

 % askQuestion() function to compelete the trivia game process
 % myscn is a simplegameengine object, questionPool is a pool of questions
 % defined at the beginning of the program. the function returns gameActive
 % in order to have direct control of whether or not the game is lost if a
 % user gets a question wrong
 function gameActive = askQuestion(myscn, questionPool)
    questionIndex = randi(size(questionPool, 1)); % select a random question from the pool using an integer
    currentQuestion = questionPool{questionIndex, 1}; % determine said question
    options = questionPool(questionIndex, 2:4); % determine the options of the question
    correctAnswer = questionPool{questionIndex, 5}; % determine the correct answer of the question

    % display question and options
    title([currentQuestion, ' (', options{1}, ' ', options{2}, ' ', options{3}, ')']);

    % get user's answer
    k = getKeyboardInput(myscn);

    % check the answer (there are only 3 choices for any question)
    if k == "a" || k == "b" || k == "c"
        playerAnswer = k; 
        if playerAnswer == correctAnswer % if the answer is correct
            title('Question Answered Correctly'); % update title
            gameActive = true; % return to main procedure
            % if the input is wrong and the player isnt just moving
        elseif k ~= "uparrow" && k ~= "downarrow" && k~= "leftarrow"&& k~= "rightarrow" 
                     k ~= "uparrow" && k ~= "downarrow" && k~= "leftarrow" && k~= "rightarrow"
                    title('Question Answered Incorrectly, Game Over!') % update title
                    gameActive = false; % end game loop
                    
        else
            gameActive = true; % always return to main procedure in order to allow player to move
        end

    end
 end

% GoTowardsPlayer() function that provides the logic behind the AI's smart
% follow movement
% aiVert and aiHorz parameters give the position of the ai at any time,
% where they are updated by GoTowardsPlayer() and returned
% avatarVert and avatarHorz give the position of the avatar at any time
 function [aiVert, aiHorz] = GoTowardsPlayer(aiVert, aiHorz, avatarVert, avatarHorz)
    % calculate the horizontal and vertical distances between the ai and
    % avatar
    horzDistance = avatarHorz - aiHorz;
    vertDistance = avatarVert - aiVert;

    % check whether ai should move horizontally or vertically
    if abs(horzDistance) > abs(vertDistance)
        % move horizontally towards the avatar
        aiHorz = aiHorz + sign(horzDistance);
    else
        % move vertically towards the avatar
        aiVert = aiVert + sign(vertDistance);
    end
end
