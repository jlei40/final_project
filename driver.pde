public class driver{
  public void setup(){
    size(1250,625);
  }  
 
 
  public void walk(){
    player1(player1X,player1Y); 
    player2(player2X,player2Y);
    gravity();
  }
  

  public void draw(){
    background(#E1B387);
    field.fieldmake();
    walking();
  }
}
