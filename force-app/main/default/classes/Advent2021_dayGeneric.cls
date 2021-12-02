//Generic virtual class that is extended by a new class for each days' puzzles
//We use this to dynmically call the solve method for each day instead of 
//explicitly creating an object of the correct class
public virtual class Advent2021_dayGeneric {
    public virtual Integer part1(){return null;}
    public virtual Integer part2(){return null;}
}