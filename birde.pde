
public class Birdie {
  private PVector birdiePos;
  private int size = 35;
  private float birdieRotation;
  private PVector birdieVelocity;
  private boolean hit;
  private int leftScore;
  private int rightScore;
  private boolean startRound;
  public Birdie(PVector playerPos) {
    birdiePos = new PVector(playerPos.x * 4, playerPos.y * 4);
    birdieRotation = PI;
    birdieVelocity = new PVector(0, 0);
    hit = true;
    leftScore = 0;
    rightScore = 0;
    startRound = true;
  }
  public boolean hitbox(Racket racket) {
    if (rectRect(birdiePos.x, birdiePos.y, size, size, racket.racketPos.x, racket.racketPos.y, racket.size, racket.size)) {
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

  public void makeBirdie() {

    pushMatrix();
    translate(birdiePos.x, birdiePos.y);
    rotate(birdieRotation);
    ellipse(0, 0, size-15, size/3);
    float featherSize = size * 0.5;
    float featherOffset = featherSize * 0.2;
    triangle(featherOffset, 0, featherSize + featherOffset, -featherSize, featherSize + featherOffset, featherSize);
    popMatrix();
  }

  public void updateBirdie() {
    if(!startRound){
    PVector gravity = new PVector(0, 0.1);
    birdieVelocity.add(gravity);
    if (birdieVelocity.x > 0 ) {
      birdieRotation += 0.01;
    } else {
      birdieRotation -= 0.01;
    }


    // Update position
    birdiePos.add(birdieVelocity);

    // Check boundaries
    if (birdiePos.y > height) {
      // Reverse velocity upon hitting the ground
      birdieVelocity.y *= -0.9;  // Adjust the bounce factor as needed
      birdiePos.y = height;
      delay(1);
      score();
    }
    }else {
    return;
    }
  }
  void score() {
    System.out.println(leftScore);
    if (birdiePos.x > width/2) {
      leftScore++;
      startRound = true;
      birdiePos = racketLeft.racketPos;
    } else {
      rightScore++;
      startRound = true;
      birdiePos = racketRight.racketPos;
    }
    if (rightScore > 6) {
      textAlign(CENTER, CENTER);
      textSize(60);
      fill(0, 255, 0);
      text("PLayer2 win!", width/2, height/2);
      noLoop();
    } else if (leftScore > 6){
      textAlign(CENTER, CENTER);
      textSize(32);
      fill(0, 255, 0);
      text("PLayer1 win!", width/2, height/2);
      noLoop();
    }
  }
  void keyPressed() {
    PVector leftHit1 = new PVector(10, -7);
    PVector leftHit2 = new PVector(12, -5);
    PVector leftHit3 = new PVector(14, -4);
    PVector leftHit4 = new PVector(20, 10);
    PVector rightHit1 = new PVector(-10, -7);
    PVector rightHit2 = new PVector(-12, -5);
    PVector rightHit3 = new PVector(-14, -4);
    PVector rightHit4 = new PVector(-20, 10);
    if (key == 's' && hit == true) {
      startRound = false;

      birdieVelocity.x = 0;
      birdieVelocity.y = 0;
      if (racketLeft.racketState == 0) {
        birdieRotation = PI-0.5;
        birdieVelocity.add(leftHit1);
      }

      if (racketLeft.racketState == 1) {
        birdieRotation = PI-0.5;
        birdieVelocity.add(leftHit2);
      }
      if (racketLeft.racketState == 2) {
        birdieRotation = PI-0.5;
        birdieVelocity.add(leftHit3);
      }
      if (racketLeft.racketState == 3) {
        birdieRotation = PI-0.5;
        birdieVelocity.add(leftHit4);
      }
    }

    if (keyCode == DOWN && hit == true) {
      birdieVelocity.x = 0;
      birdieVelocity.y = 0;
            startRound = false;
      if (racketRight.racketState == 0) {
        birdieRotation = 0.4;
        birdieVelocity.add(rightHit1);
      }
      if (racketRight.racketState == 1) {
        birdieRotation = 0.4;
        birdieVelocity.add(rightHit2);
      }
      if (racketRight.racketState == 2) {
        birdieRotation = 0.4;
        birdieVelocity.add(rightHit3);
      }
      if (racketRight.racketState == 3) {
        birdieRotation = 0.4;
        birdieVelocity.add(rightHit4);
      }
    }
  }
}
