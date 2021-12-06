public class Advent2021_day3 extends Advent2021_dayGeneric{
    
    public final List<String> INPUT = [SELECT Body 
                                       FROM StaticResource 
                                       WHERE Name = 'aoc2021_day3'
                                       LIMIT 1][0].Body.toString().split('\n');
    
    public final Integer INPUT_SIZE = INPUT.size();
    
    public override Integer part1(){
        Map<Integer,BitCounter> posToBitCountMap = new Map<Integer, BitCounter>();
        
        Integer binaryNumSize;
        
        for (Integer i=0; i<INPUT_SIZE; i++){
            String binaryNum = INPUT[i].trim();
            
            List<String> bitsAsList = binaryNum.split('');
            
            if (binaryNumSize == null){
                binaryNumSize = binaryNum.length();
            }
            
            for (Integer j=0; j<binaryNumSize; j++){
                Integer thisBit = Integer.valueOf(bitsAsList[j]);
                
                if (!posToBitCountMap.containsKey(j)){
                    posToBitCountMap.put(j, new BitCounter());
                }
                
                switch on thisBit{
                    when 0{
                        posToBitCountMap.get(j).zeroCount++;
                    }when 1{
                        posToBitCountMap.get(j).oneCount++;
                    }
                }
            }
            
            
        }
        
        Integer gammaRate = 0;
        Integer epsilonRate = 0;
        Integer binaryAdder = 1;
        
        for (Integer i=binaryNumSize-1; i>=0; i--){
            
            BitCounter currentBitCounter = posToBitCountMap.get(i);

            if (currentBitCounter.oneCount > currentBitCounter.zeroCount){
                gammaRate += binaryAdder;
            }else{
                epsilonRate += binaryAdder;
            }
            
            binaryAdder *= 2;
        }
        return gammaRate * epsilonRate;
    }
    
    public static Integer convertBinaryToInt(String binaryNum){
        Integer binaryAdder = 1;
        Integer toReturn = 0;
        List<String> binaryAsString = binaryNum.split('');
        
        for (Integer i=binaryAsString.size()-1; i>=0; i--){
            String bit = binaryAsString[i];
            


            if (bit == '1'){
                toReturn += binaryAdder;
            }
            
            binaryAdder *=2;
        }
        
        return toReturn;
    }
    
    public override Integer part2(){
        
        List<String> oxyGenRate = INPUT;
        List<String> co2GenRate = INPUT;

        Integer binarySize = INPUT[0].length();
        
        for (Integer i=0; i<binarySize; i++){

            if (oxyGenRate.size() == 1 && co2GenRate.size() == 1){
                break;
            }
            
            Set<String> oxyZeroStrings = new Set<String>();
            Set<String> oxyOneStrings = new Set<String>();
            
            Set<String> co2ZeroStrings = new Set<String>();
            Set<String> co2OneStrings = new Set<String>();
            
            if (oxyGenRate.size() > 1){
                for (Integer j=0; j<oxyGenRate.size(); j++){
                    String currentBinary = oxyGenRate[j].trim();
                    String currentBit = currentBinary.split('')[i];

                    if (currentBit == '0'){
                        oxyZeroStrings.add(currentBinary);
                    }else{
                        oxyOneStrings.add(currentBinary);
                    }
                    
                }
                
                if (oxyZeroStrings.size() > oxyOneStrings.size()){
                    oxyGenRate = new List<String>(oxyZeroStrings);
                }else{
                    oxyGenRate = new List<String>(oxyOneStrings);
                }
            }
            
            if (co2GenRate.size() > 1){
                for (Integer j=0; j<co2GenRate.size(); j++){ 
                    String currentBinary = co2GenRate[j].trim();
                    String currentBit = currentBinary.split('')[i];
                    
                    
                    if (currentBit == '0'){
                        co2ZeroStrings.add(currentBinary);
                    }else{
                        co2OneStrings.add(currentBinary);
                    }
                    
                }
    
                
                if (co2ZeroStrings.size() > co2OneStrings.size()){
                    co2GenRate = new List<String>(co2OneStrings);
                }else{
                    co2GenRate = new List<String>(co2ZeroStrings);
                }
            } 
        }

        return convertBinaryToInt(oxyGenRate[0]) * convertBinaryToInt(co2GenRate[0]);
    }
    
    private class BitCounter{
        private Integer zeroCount = 0;
        private Integer oneCount = 0;
    }
}






/*
 * 
Advent2021_handler h = new Advent2021_handler(3,1);
h.execute();
*
*/