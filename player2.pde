public class player2{
  private int swing2X = 15;
  private int swing2Y = 12;
  private boolean animation3 = true;
  private boolean animation4 = false; 
  private int player2X = 250;
  private int player2Y = 85; 
  

  public void player2make(int x, int y){
    circle(x,y+10,10); // head
    line(x,y+15,x, y+40); // body
    line(x,y+25,x-swing2X, y+swing2Y); // arm1
    line(x,y+25,x+10, y+47); // arm2
    if (animation3) walk21(x,y);
    else if (animation4) walk22(x,y);
  }
  public void walk21(int x,int y){
    line(x, 40+y, x+10, 65+y);
    line(x, 40+y, x-10, 65+y);
  }

  public void walk22(int x,int y){
    line(x, 40 + y, x-5, 45 +y);
    line(x-5, 45+y, x-3, 65+y);
    line(x,40+y, x-1, 50+y);
    line(x-1,50+y, x+5,65+y);
  }
  
    public void keyPressed(){
    if (keyCode == LEFT && player2X > 170) {
       player2X-=5;
      if (animation3){
        animation3 = false;
        animation4 = true;
      } else if (animation4){
        animation4 = true;
        animation3 = false; 
      }
    } else if (keyCode == RIGHT){
       player2X+=5; 
      if (animation3){
        animation3 = false;
        animation4 = true;
      } else if (animation4){
        animation4 = true;
        animation3 = false; 
      }
    }  else if (keyCode == UP && player2Y == 85){
        player2Y -= 30; 
    } else if (keyCode == DOWN && swing2X == 15 && swing2Y == 12){
        swing2X += 10;
        swing2Y += 10; 
    }
  }
  
  public void gravity(){
    if (player1Y < 85) player1Y++; 
    if (player2Y < 85) player2Y++;
    if (swing1X < 15) swing1X++; 
    if (swing1Y < 12) swing1Y++;
    if (swing2X > 15) swing2X--;
    if (swing2Y > 12) swing2Y--; 
  }
  
  
}
