public class player1{
  private int player1X = 80;
  private int player1Y = 85;
  private int swing1X = 15;
  private int swing1Y = 12;
  private boolean animation1 = true;
  private boolean animation2 = false; 
  public void player1make(int x, int y){
    scale(4);
    circle(x,y+10,10); // head
    line(x,y+15,x, y+40); // body
    line(x,y+25,x+swing1X, y+swing1Y); // arm1
    line(x,y+25,x-10, y+47); // arm2
    if (animation1) walk11(x,y);
    else if (animation2) walk12(x,y);
  }
  
  
  
  public void walk11(int x,int y){
    line(x, 40+y, x+10, 65+y);
    line(x, 40+y, x-10, 65+y);
  }
  
  public void walk12(int x,int y){
    line(x, 40 + y, x+5, 45 +y);
    line(x+5, 45+y, x+3, 65+y);
    line(x,40+y, x+1, 50+y);
    line(x+1,50+y, x-5,65+y);
  }
  
   public void keyPressed(){
    if (keyCode == 65) {
      player1X-=5;
      if (animation1){
        animation1 = false;
        animation2 = true;
      } else if (animation2) {
        animation1 = true;
        animation2 = false; 
      }
    } else if (keyCode == 68 && player1X < 140) {
      player1X+=5; 
      if (animation1){
        animation1 = false;
        animation2 = true;
      } else if (animation2){
        animation1 = true;
        animation2 = false; 
      }
    } else if (keyCode == 87 && player1Y == 85){
      player1Y -= 30;    
    } else if (keyCode == 83 && swing1X == 15 && swing1Y == 12){
      swing1X -= 10;
      swing1Y -= 10; 
    }
  }
}
