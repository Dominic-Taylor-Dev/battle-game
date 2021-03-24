Battle App
===========

![Charmander sprite](assets/sprites/charmander-battle-front.gif)
![Squirtle sprite](assets/sprites/squirtle-battle-front.gif)
![Bulbasaur sprite](assets/sprites/bulbasaur-battle-front.gif)
![Pikachu sprite](assets/sprites/pikachu-battle-front.gif)


User stories
--------
```
As two Players,
So we can play a personalised game of Battle,
We want to Start a fight by entering our Names and seeing them

As Player 1,
So I can see how close I am to winning
I want to see Player 2's Hit Points

As Player 1,
So I can win a game of Battle,
I want to attack Player 2, and I want to get a confirmation

As Player 1,
So I can start to win a game of Battle,
I want my attack to reduce Player 2's HP by 10

As two Players,
So we can continue our game of Battle,
We want to switch turns

As Player 1,
So I can see how close I am to losing,
I want to see my own hit points

As Player 1,
So I can lose a game of Battle,
I want Player 2 to attack me, and I want to get a confirmation

As Player 1,
So I can start to lose a game of Battle,
I want Player 2's attack to reduce my HP by 10

As a Player,
So I can Lose a game of Battle,
I want to see a 'Lose' message if I reach 0HP first
```
Domain object model
----------

The concept for the structure to respond to the original user stories was as follows (the diagram itself is a sort of domain object model, but adapted to bring out the MVC structure):

![MVC Overview](assets/mvc_overview.jpg)

Adding more graphics to the interface
---------

One of the interesting things for me about the project was that it was my first foray into using Ruby/Sinatra to interact with logic via browser input/output as opposed to the earlier Ruby command line apps I'd made at Makers Academy. 

For this reason, I continued developing that app past the point where the initial user stories (above) were complete - specifically in a graphical direction. I followed Makers Academy stretch-goal suggestions (not in order) implementing the following:

```
As a Player,
So I can enjoy a game of Battle with more variety,
I want to choose from a range of attacks I could make

As a Player,
To introduce a degree of tactical judgment,
I want to attack options to vary in strength (both possible range and average)

As a Player,
So I can enjoy my game of Battle,
I want a sexy user interface
```

This last element - the interface - was based on a provided mock-up of how the app might look (provided by Makers):

![Interface mock-up](assets/battle_final_mockup.png)

I did originally follow this specification (broadly...!) but in the end, I was keen to include some genuine Pokemon game sprites, (sourced <a href='https://pokemondb.net/sprites'>here</a>) and they were facing laft/right in accordance with the original Pokemon games. I guess it would have been possible to use CSS transformations to flip them, but since this was just for fun, I decided to go with something closer to the original Pokemon layout:

![Screenshot](assets/screenshot.jpg)

Note: The player avatars are chosen at random from a possible list of Charmander, Bulbasaur, Squirtle and Pikachu. If I wanted to make this project more complex, I'd add the possibility to select desired Pokemon to act as avatar from a dropdown on the index screen.