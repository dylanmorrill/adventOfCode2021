public class Advent2021_day1 extends Advent2021_dayGeneric{
    
    public final List<String> INPUT = [SELECT Body 
                                       FROM StaticResource 
                                       WHERE Name = 'aoc2021_day1'
                                       LIMIT 1][0].Body.toString().split('\n');
    
    public final Integer INPUT_SIZE = INPUT.size();
    
    public override Integer part1(){
        Integer numIncreasing = 0;
        
        //Loop through the input (starting at element 1) and increment if current depth
        //is greater than the previous
        for (Integer i=1; i<INPUT.size(); i++){
            Integer currentDepthMeasurement = Integer.valueOf(INPUT[i].trim());
            Integer previousDepthMeasurement = Integer.valueOf(INPUT[i-1].trim());
            
            if (currentDepthMeasurement > previousDepthMeasurement){
                numIncreasing ++;
            }
            
        }
        
        return numIncreasing;
    }

    public override Integer part2(){
        Integer numIncreasing = 0;
        
        //Declare the previousWindow variable starting with the first window
        Integer previousWindow = Integer.valueOf(INPUT[0].trim()) +
            Integer.valueOf(INPUT[1].trim()) +
            Integer.valueOf(INPUT[2].trim());
        
        //Loop through the input (starting at element 1 and stopping at element size-2) 
        //and check each window against the previous window and increment if needed
        for (Integer i=1; i<INPUT.size()-2; i++){
            Integer currentDepthMeasurement = Integer.valueOf(INPUT[i].trim());
            Integer secondDepthMeasurement = Integer.valueOf(INPUT[i+1].trim());
            Integer thirdDepthMeasurement = Integer.valueOf(INPUT[i+2].trim());
            
            Integer currentWindow = + currentDepthMeasurement +
                secondDepthMeasurement +
                thirdDepthMeasurement;
            
            if (currentWindow > previousWindow){
                numIncreasing++;
            }
            
            previousWindow = currentWindow;
        }
        
        return numIncreasing;
    }    
}