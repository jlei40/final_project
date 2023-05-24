  private int player1X = 80;
  private int player1Y = 85;
  private int swing1X = 15;
  private int swing1Y = 12;
  private boolean animation1 = true;
  private boolean animation2 = false; 
  
  private int swing2X = 15;
  private int swing2Y = 12;
  private boolean animation3 = true;
  private boolean animation4 = false; 
  private int player2X = 250;
  private int player2Y = 85; 
  
  
  public void setup(){
    size(1250,625);
  }  
  
  public void fieldmake(){
    fill(#E1B200);
    rect(-10, 600, 1270, 625);
    fill(#FFFFFF);
    rect(620,300,10,300);
  }

  public void draw(){
    background(#E1B387);
    fieldmake();
    player1make(player1X, player1Y); 
    player2make(player2X, player2Y); 
    gravity(); 
  }
  
  
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
  
   public void gravity(){
    if (player1Y < 85) player1Y++; 
    if (swing1X < 15) swing1X++; 
    if (swing1Y < 12) swing1Y++;
    
    if (player2Y < 85) player2Y++;
    if (swing2X < 15) swing2X++;
    if (swing2Y < 12) swing2Y++; 
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
    } 
    if (keyCode == 68 && player1X < 140) {
      player1X+=5; 
      if (animation1){
        animation1 = false;
        animation2 = true;
      } else if (animation2){
        animation1 = true;
        animation2 = false; 
      }
    } 
    if (keyCode == 87 && player1Y == 85){
      player1Y -= 30;    
    } 
    if (keyCode == 83 && swing1X == 15 && swing1Y == 12){
      swing1X -= 10;
      swing1Y -= 10; 
    } 
    if (keyCode == LEFT && player2X > 170) {
       player2X-=5;
      if (animation3){
        animation3 = false;
        animation4 = true;
      } else if (animation4){
        animation4 = true;
        animation3 = false; 
      }
    } 
    if (keyCode == RIGHT){
       player2X+=5; 
      if (animation3){
        animation3 = false;
        animation4 = true;
      } else if (animation4){
        animation4 = true;
        animation3 = false; 
      }
    } 
    if (keyCode == UP && player2Y == 85){
        player2Y -= 30; 
    } 
    if (keyCode == DOWN && swing2X == 15 && swing2Y == 12){
        swing2X -= 10;
        swing2Y -= 10; 
    }
  }
  
  
