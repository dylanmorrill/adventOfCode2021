public class Advent2021_day2 extends Advent2021_dayGeneric{
    
    public final List<String> INPUT = [SELECT Body 
                                       FROM StaticResource 
                                       WHERE Name = 'aoc2021_day2'
                                       LIMIT 1][0].Body.toString().split('\n');
    
    public final Integer INPUT_SIZE = INPUT.size();
    
    public override Integer part1(){  
        Integer horizonalPos = 0;
        Integer depthPos = 0;
        
        //For each line, create an "Command" wrapper object, and simple switch
        //on the direction
        for (String commandString : INPUT){
            Command currentCommand = new Command(commandString);
            
            Switch on currentCommand.direction{
                when 'forward'{
                    horizonalPos += currentCommand.moveNumber;
                }when 'down'{
                    depthPos += currentCommand.moveNumber;
                }when 'up'{
                    depthPos -= currentCommand.moveNumber;
                }
            }
        }
        
        return depthPos * horizonalPos;
    }
    
    public override Integer part2(){
        Integer horizonalPos = 0;
        Integer depthPos = 0;
        Integer aim = 0;
        
        //For each line, create an "Command" wrapper object, and simple switch
        //on the direction - incrementing variables as needed.
        for (String commandString : INPUT){
            Command currentCommand = new Command(commandString);
            
            Switch on currentCommand.direction{
                when 'forward'{
                    horizonalPos += currentCommand.moveNumber;
                    depthPos += (aim * currentCommand.moveNumber);
                }when 'down'{
                    aim += currentCommand.moveNumber;
                }when 'up'{
                    aim -= currentCommand.moveNumber;
                }
            }
        }
        
        return depthPos * horizonalPos;
    }
    
    //Command wrapper object
    private class Command{
        String direction;
        Integer moveNumber;
        
        private command(String commandString){
            List<String> commandStringList = commandString.split(' ');
            this.direction = commandStringList[0];
            this.moveNumber = Integer.valueOf(commandStringList[1]);
        }
    }
}