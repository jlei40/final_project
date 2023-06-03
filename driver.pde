private PVector player1Pos = new PVector(80, 85);
private PVector swing1Pos = new PVector(15, 12);
private boolean animation1 = true;
private boolean animation2 = false;

private PVector swing2Pos = new PVector(15, 12);
private boolean animation3 = true;
private boolean animation4 = false;
private PVector player2Pos = new PVector(250, 85);
  
  private boolean left1 = false;
  private boolean right1 = false;
  private boolean left2 = false;
  private boolean right2 = false; 
  
  private boolean swing1 = false;
  private boolean swing2 = false; 
  private PVector player1Velocity = new PVector(0,0);
  private PVector player2Velocity= new PVector(0,0);
  private PVector jumpV= new PVector(0,-7);
  private int time = 0; 
  
  Racket racketLeft;
  Racket racketRight; 
  Birdie birdie;
PVector playerPos = new PVector(player2Pos.x - swing2Pos.x, player2Pos.y + swing2Pos.y);
PVector playerPos2 = new PVector(player1Pos.x + swing1Pos.x, player1Pos.y + swing1Pos.y);
  
  public void setup(){
    size(1400,900);
    racketLeft = new Racket(playerPos,true);
    racketRight = new Racket(playerPos2,false);
    birdie = new Birdie(playerPos2);
  }  
  void reset(){
  background(220);
    racketLeft = new Racket(playerPos,true);
    racketRight = new Racket(playerPos2,false);
  birdie = new Birdie(playerPos2);
  loop();
}
  public void fieldmake(){
    fill(#E1B200);
    rect(0, 800, 1400, 900);
    fill(#FFFFFF);
    rect(width/2,500,10,300);
  }

  public void draw(){
    background(#E1B387);
    fieldmake();
    gravity();
    walkanimations(); 
    
   
    birdie.updateBirdie();
    birdie.makeBirdie();
    
    player1make(player1Pos); 
    player2make(player2Pos); 
    
  racketLeft.makeRacket(player1Pos);
  racketRight.makeRacket(player2Pos);
  if (birdie.birdiePos.x > width/2){
    birdie.hit = birdie.hitbox(racketRight);
  } else {
    birdie.hit = birdie.hitbox(racketLeft);
  }
    
  }
  
  public void walkanimations(){
    if (time == 20){
      if (animation3){
        animation3 = false;
        animation4 = true;
      } else if (animation4){
        animation4 = false;
        animation3 = true; 
      }
      if (animation1){
        animation1 = false;
        animation2 = true;
      } else if (animation2){
        animation1 = true;
        animation2 = false; 
      }
      time = 0;
    }
    if (player1Pos.x % 2 == 0) time++; 
    

  }
  
  
public void player1make(PVector pos) {
pushMatrix(); // Save the current transformation matrix
  scale(4); // Apply the scale locally
  circle(pos.x, pos.y + 10, 10); // head
  line(pos.x, pos.y + 15, pos.x, pos.y + 40); // body
  line(pos.x, pos.y + 25, pos.x - swing2Pos.x, pos.y + swing2Pos.y); // arm1
  line(pos.x, pos.y + 25, pos.x + 10, pos.y + 47); // arm2
  if (animation1) walk11(pos);
  else if (animation2) walk12(pos);
  popMatrix(); // Restore the previous transformation matrix
}
public void player2make(PVector pos) {
  pushMatrix();
  scale(4);
  circle(pos.x, pos.y + 10, 10); // head
  line(pos.x, pos.y + 15, pos.x, pos.y + 40); // body
  line(pos.x, pos.y + 25, pos.x + swing1Pos.x, pos.y + swing1Pos.y); // arm1
  line(pos.x, pos.y + 25, pos.x - 10, pos.y + 47); // arm2
  if (animation3) walk21(pos);
  else if (animation4) walk22(pos);
  popMatrix();
}
public void walk21(PVector pos) {
  line(pos.x, 40 + pos.y, pos.x + 10, 65 + pos.y);
  line(pos.x, 40 + pos.y, pos.x - 10, 65 + pos.y);
}

public void walk22(PVector pos) {
  line(pos.x, 40 + pos.y, pos.x - 5, 45 + pos.y);
  line(pos.x - 5, 45 + pos.y, pos.x - 3, 65 + pos.y);
  line(pos.x, 40 + pos.y, pos.x - 1, 50 + pos.y);
  line(pos.x - 1, 50 + pos.y, pos.x + 5, 65 + pos.y);
}
  
  
public void walk11(PVector pos) {
  line(pos.x, 40 + pos.y, pos.x + 10, 65 + pos.y);
  line(pos.x, 40 + pos.y, pos.x - 10, 65 + pos.y);
}
  
public void walk12(PVector pos) {
  line(pos.x, 40 + pos.y, pos.x + 5, 45 + pos.y);
  line(pos.x + 5, 45 + pos.y, pos.x + 3, 65 + pos.y);
  line(pos.x, 40 + pos.y, pos.x + 1, 50 + pos.y);
  line(pos.x + 1, 50 + pos.y, pos.x - 5, 65 + pos.y);
}
  
public void gravity() {
  System.out.println(player1Velocity.y);
    PVector gravity = new PVector(0, 0.1);
    if (player1Pos.y < 133 || player1Velocity.y < 0){
    player1Velocity.add(gravity);
    player1Pos.add(player1Velocity);
    } else {player1Velocity.y = 3;}
    if (player2Pos.y < 133 || player2Velocity.y < 0){
    player2Velocity.add(gravity);
    player2Pos.add(player2Velocity);
    }else {player2Velocity.y = 3;}
  if (left1 && player1Pos.x > 0) player1Pos.x--;
  if (right1 && player1Pos.x < 145) player1Pos.x++;
  if (right2 && player2Pos.x < 312) player2Pos.x++;
  if (left2 && player2Pos.x > 168) player2Pos.x--;

  if (swing2 && swing2Pos.x > -15) swing2Pos.x -= 2;
  if (swing2 && swing2Pos.y > 2) swing2Pos.y -= 2;
  if (swing2Pos.x == -15) swing2 = false;
  if (!swing2 && swing2Pos.x < 15) swing2Pos.x += 2;
  if (!swing2 && swing2Pos.y < 12) swing2Pos.y += 2;

  if (swing1 && swing1Pos.x > -15) swing1Pos.x -= 2;
  if (swing1 && swing1Pos.y > 2) swing1Pos.y -= 2;
  if (swing1Pos.x == -15) swing1 = false;
  if (!swing1 && swing1Pos.x < 15) swing1Pos.x += 2;
  if (!swing1 && swing1Pos.y < 12) swing1Pos.y += 2;
}
  

  
public void keyPressed() {
  
  if (keyCode == 65) left1 = true; 
  if (keyCode == 68) right1 = true;
  if (keyCode == 87 && player1Pos.y > 134) player1Velocity.add(jumpV);
  if (keyCode == 83 && swing2Pos.x == 15 && swing2Pos.y == 12) swing2 = true; 
  if (keyCode == DOWN && swing1Pos.x == 15 && swing1Pos.y == 12) swing1 = true;  
  if (keyCode == LEFT) left2 = true;
  if (keyCode == RIGHT) right2 = true; 
  if (keyCode == UP && player2Pos.y > 134) player2Velocity.add(jumpV);
  racketLeft.keyPressed();
  racketRight.keyPressed();
  birdie.keyPressed();
  if(key == 'p') reset();
}

    
    public void keyReleased(){
      if (keyCode == 65) left1 = false; 
      if (keyCode == 68) right1 = false;
      if (keyCode == LEFT) left2 = false;
      if (keyCode == RIGHT) right2 = false; 


    }
  
  
  
