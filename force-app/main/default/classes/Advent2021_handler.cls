public class Advent2021_handler {
    private Integer day;    
    private Integer part;    
    
    public Advent2021_handler(Integer day, Integer part){
        this.day = day;
        this.part = part;
    }
    
    //Main purpose of this method is to dynmically call the correct method for 
    //the day and part, then print out the solution using a debug statement
    public void execute(){
        //Constructing a readable debug statement
        String debugString = debugStartPrint();
        
        //Create the correct class (for the specific day) dynmically using the 
        //Advent2021_dayGeneric virtual class
        Advent2021_dayGeneric currentDayClass = (Advent2021_dayGeneric)
            Type.forName('Advent2021_day' + day)
            .newInstance();
        
        //Run either the part 1 or part 2 method based on user input into the constructor
        //and add the return integer to the debugString that gets printed
        switch on part{
            when 1{
				debugString += currentDayClass.part1();
            }when 2{
               	debugString += currentDayClass.part2();
            }
        }
        
        //Constructing a readable debug statement
        debugString += debugEndPrint();
        
        System.debug(debugString);
    }   
    
    //Overly-complicated looking method that simple constructs the beginning 
    //of a big debug string
    private String debugStartPrint(){
        String debugString = '\n';
        
        for (Integer i=0; i<40; i+=2){
            for (Integer j=0; j<i; j++){
                debugString += '*';
            }
            debugString += '\n';
        }
        
        debugString += '\n' + DEBUG_SPACER_LINE + ' DAY ' + day + ' ' + 
            DEBUG_SPACER_LINE + '\n\n' +        
            DEBUG_SPACER_LINE + ' PART ' + part + ' ' + 
            DEBUG_SPACER_LINE + '\n\n' + DEBUG_SPACER_LINE + ' ANSWER: ';
        
        return debugString;
    }
    
    //Overly-complicated looking method that simple constructs the end 
    //of a big debug string
    private String debugEndPrint(){
        String debugString = DEBUG_SPACER_LINE + '\n\n';
        
        for (Integer i=40; i>0; i-=2){
            for (Integer j=0; j<i; j++){
                debugString += '*';
            }
            debugString += '\n';
        }
            
        return debugString;
    }

    private static final String DEBUG_SPACER_STAR = '*****************************' +
        '*********************************************************';
    private static final String DEBUG_SPACER_LINE  = '-----------------------------' +
        '---------------';
}