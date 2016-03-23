#!/usr/bin/ruby
# table.rb
require_relative 'Table'  

# represents Robot
class Robot
    # define properties 
    attr_reader :posX, :posY, :facing
    
    @@sides = {
    "NORTH" => 0,
    "EAST" => 1,
    "SOUTH" => 2,
    "WEST" => 3
  }
    
    # constructor
    def initialize(posX,posY,facing)
        @posX=posX
        @posY=posY
        @facing=facing
	end

    # get properties
	def about
        "#{@posX},#{@posY} facing #{@facing}"
	end
    
    # moves one step towards the facing direction
	def move()
        case @facing
             #not to fall off the table
			when "NORTH"
            if @posY<Table.Width-1
					@posY+=1
				end
			when "SOUTH"
				if @posY>0
					@posY-=1
				end
			when "EAST"
            if @posX<Table.Length-1
					@posX+=1
				end
			when "WEST"
				if @posX>0
					@posX-=1
				end
		end
	end

    # rotate robot, if value is - then counter clockwise, if + then clockwise
    def rotate(value)
        current=@@sides[@facing]
        current+=value
        if(current==4)
            current=0
        elsif(current==-1)
            current=3
        end
        @facing=@@sides.keys[current]
	end
end