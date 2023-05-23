
public class Racket {
  private PVector racketPos;
  private int size = 100;
  public Racket(PVector playerPos) {
    racketPos = new PVector(0,0);
    racketPos.x = playerPos.x+30;
    racketPos.y = playerPos.y+10;

  }
  
  public void makeRacket(){
   
  pushMatrix(); 
  translate(racketPos.x, racketPos.y);  
  rotate(radians(30));
  ellipse(0, 0, size, size/3);  
  popMatrix(); 

  }
  
  
  
}
