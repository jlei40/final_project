
public class Birdie {
  private PVector direction;
  private PVector birdiePos;
  private int size = 35;
  private float birdieRotation;
  private PVector birdieVelocity;
  private boolean hit;
  public Birdie(PVector playerPos) {
    birdiePos = new PVector(playerPos.x+30, playerPos.y);
    if (playerPos.x < width/2 ){
      direction = new PVector(1,1);
    } else {
      direction = new PVector(-1,1);
    }
    birdieRotation = PI;
    birdieVelocity = new PVector(0, 0);
    hit = false;
  }
  public boolean hitbox(Racket racket){
    if(rectRect(birdiePos.x, birdiePos.y, size, size, racket.racketPos.x, racket.racketPos.y, racket.size, racket.size)){
           return true;
    } else return false;

  }
  boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {

  if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
      r1x <= r2x + r2w &&    // r1 left edge past r2 right
      r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
      r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
}

  public void makeBirdie(){
   
    pushMatrix();  
    translate(birdiePos.x, birdiePos.y); 
    rotate(birdieRotation);
    ellipse(0, 0, size-15, size/3);
    float featherSize = size * 0.5;  
    float featherOffset = featherSize * 0.2;  
    triangle(featherOffset, 0, featherSize + featherOffset, -featherSize, featherSize + featherOffset, featherSize);
    popMatrix(); 
  
  }
  
  public void updateBirdie(){
    PVector gravity = new PVector(0, 0.1);
    birdieVelocity.add(gravity);
    birdieRotation += 0.01;
    // Update position
    birdiePos.add(birdieVelocity);
    
    // Check boundaries
    if (birdiePos.y > height) {
      // Reverse velocity upon hitting the ground
      birdieVelocity.y *= -0.9;  // Adjust the bounce factor as needed
      birdiePos.y = height;
    }
  
  
  }
  
void keyPressed() {
    PVector leftHit = new PVector(0.8, -1);
    PVector rightHit = new PVector(-0.8, -1);
    int i  = 0;
    if (key == 's' && hit == true){
      birdieRotation = PI-0.5;
      while ( i < 10){
       birdieVelocity.add(leftHit);
       i++;
      }
    }
    
    if (keyCode == DOWN && hit == true){
      birdieRotation = 0.4;
      while ( i < 10){
       birdieVelocity.add(rightHit);
       i++;
      }
    }
    
    
  }

  
}
