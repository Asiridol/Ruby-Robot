Ruby - Robot Test
===================

- - - - 

# Rules #

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

There are no other obstructions on the table surface.

The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any   movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

## Valid Commands ##

PLACE X,Y,F - places robot on the table at X, Y position facing F side. F can be NORTH, SOUTH, EAST or WEST

MOVE - moves one step towards the facingn direction. But avoids falling off of the table.
 
LEFT - rotates the robot counter clockwise

RIGHT - rotates the robot clockwise

REPORT - announces current X,Y positions and the facing direction

## Constraints ##

0,0 is the South West corner of the table

Ignores any commands received before a valid MOVE command

## How to use ##

curl [file containing commands] | ruby simulator.rb
