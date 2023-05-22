private boolean animation1 = true;
private boolean animation2 = false; 
private int player1X = 80;
private int player1Y = 85; 
private int player2X = 250;
private int player2Y = 85; 

public void walking(){
  player1(player1X,player1Y); 
  player2(player2X,player2Y);
  gravity();
}


public boolean getAnimation1(){
  return animation1; 
}

public boolean getAnimation2(){
  return animation2; 
}

public void keyPressed(){
  if (keyCode == LEFT) {
    player1X-=5;
    if (animation1){
      animation1 = false;
      animation2 = true;
    } else {
      animation1 = true;
      animation2 = false; 
    }
  } else if (keyCode == RIGHT && player1X < 140) {
    player1X+=5; 
    if (animation1){
      animation1 = false;
      animation2 = true;
    } else {
      animation1 = true;
      animation2 = false; 
    }
  } else if (keyCode == UP && player1Y == 85){
    player1Y -= 30;    
  }
}

public void gravity(){
  if (player1Y < 85) player1Y++; 

}
