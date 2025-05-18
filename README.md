# AsteroidField Game

A 2D space game built in Processing where players navigate through an asteroid field while collecting power-ups. The player stays centred on the screen while obstacles move around them.

## Game Overview

Asteroid Field is a dynamic arcade-style game in which the player pilots a spaceship through an increasingly challenging asteroid field. It was developed as part of the 6G4Z0020 Programming module at Manchester Metropolitan University.

## Features

- Player-centred gameplay (player stays in the middle while the world moves around them)
- Multiple asteroid types with different behaviours and difficulties
- Power-up collection system for temporary abilities
- High score system with persistent storage
- Collision animations and visual feedback
- Responsive controls with arrow key navigation

## Controls

- **Arrow keys**: Control movement (UP, DOWN, LEFT, RIGHT)
- **R key**: Restart when game over

## Setup and Running

1. Install Processing from [processing.org](https://processing.org/download)
2. Clone this repository or download the files
3. Open AsteroidField.pde in Processing IDE
4. Click the Run button or press Ctrl+R (Cmd+R on Mac)

## Project Structure

- **AsteroidField.pde**: Main game file containing setup and draw loops
- **GameObject.pde**: Base class for all game objects
- **Player.pde**: Player spaceship class with controls and collision handling
- **Asteroid.pde**: Base obstacle class
- **FastAsteroid.pde**: Specialised asteroid with increased speed
- **PowerUp.pde**: Collectable items that provide temporary benefits
- **Explosion.pde**: Visual effect when collisions occur
- **Star.pde**: Background elements for visual depth
- **Interfaces.pde**: Interfaces used for object behaviours

## Development Process

This game was built using object-oriented principles, including:
- Inheritance hierarchies for game objects
- Polymorphism for handling different types of obstacles
- Interface implementation for consistent behaviour patterns
- Collision detection algorithms
- File I/O for score persistence

## Academic Information

- **Course**: 6G4Z0020 Programming
- **University**: Manchester Metropolitan University
- **Year**: 2025
- **Assessment**: "Don't Crash!!" Game (50% coursework)
- **Learning Outcomes**:
  - Applied computational thinking and fundamental programming concepts to solve problems
  - Designed and implemented well-structured solutions using object-oriented techniques
  - Adopted a reasoned approach to identify and rectify software defects

## Implementation Details

This game demonstrates several key programming concepts:
- **Object-Oriented Design**: Multiple classes with inheritance relationships
- **Polymorphism**: Different asteroid types handled through a common interface
- **Collision Detection**: Boolean methods to determine object interactions
- **File I/O**: Persistence of high scores between game sessions
- **Animation**: Sprite sequencing for visual effects


## Future Improvements

- Additional asteroid types with unique behaviours
- Weapon systems and combat mechanics
- Progressive difficulty levels
- Sound effects and background music
- Multiplayer capabilities
