#!/usr/bin/ruby
# robot.rb
# table.rb
require_relative 'Table'  
require_relative 'robot'  

# Simulator class
class Simulator
    # define property
    attr_reader :robot
    
    # default constructor
    def initialize()
    end
    
    def process(input)
        output=""
        chomps=input.split(/\n/)
        chomps.each { |line| 
            
            line=line.upcase

            # get the command and execute
            if(line.include? "PLACE")
                createRobot(line)
            elsif(line.include? "REPORT")
                if(@robot!=nil)
                    output+=@robot.about
                end
            elsif(line.include? "MOVE")
                if(@robot!=nil)
                    @robot.move
                end
            elsif(line.include? "LEFT")
                if(@robot!=nil)
                    @robot.rotate(-1)
                end
            elsif(line.include? "RIGHT")
                if(@robot!=nil)
                    @robot.rotate(1)
                end
            end
        }
        
        output
    end
    
    # creates Robot object
    def createRobot(line)
        # check arguments passed with the command
        line=line.split(" ").last
        args=line.split(",")
        if(args.size==3)
            if(args[0].to_i>=0 && args[0].to_i<Table.Length && args[1].to_i>=0 && args[1].to_i<Table.Width)
                if(args[2]=="NORTH" || args[2]=="SOUTH" || args[2]=="EAST" || args[2]=="WEST")
                    @robot=Robot.new(args[0].to_i,args[1].to_i,args[2])
                end
            end
        end
    end
end
    
# starts the simulator
sim=Simulator.new
inp = $stdin.read
$stdout.puts(sim.process(inp))