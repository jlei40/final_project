
public class Racket {
  private PVector racketPos;
  private int size = 100;
  private int buffer = 0;
  private boolean leftSide = true;
  private int racketState = 0; // Initial state of the racket
  private int lastStateChangeTime = 0; // Time of the last state change
  private int stateChangeInterval = 100; // Interval between state changes in milliseconds
  private int leftRotation = 40;
  private int rightRotation = 140;
  public Racket(PVector playerPos, boolean left) {
    racketPos = new PVector(0, 0);
    racketPos.x = playerPos.x;
    racketPos.y = playerPos.y;
    leftSide = left;
  }

  public void makeRacket(PVector pos) {
    if (leftSide) {
      pushMatrix();
      translate(pos.x*4-160, pos.y*4-40);
      rotate(radians(leftRotation));
      ellipse(0, 0, size, size/3);
      rect(0, 0, size*1.5, size/10);
      popMatrix();
    } else {
      pushMatrix();
      translate(pos.x*4+160, pos.y*4-40);
      rotate(radians(rightRotation));
      ellipse(0, 0, size, size/3);
      rect(0, -10, size*1.5, size/10);
      popMatrix();
    }
  }
  void keyPressed() {
    if (leftSide) {
      if (key == 's') {
        if (racketState == 3) {
          return;
        }
        
        if (millis() - lastStateChangeTime >= stateChangeInterval ) {
          racketState++;
          
          lastStateChangeTime = millis();
        }
      } else {
        racketState = 0;
      }
    } else {
      if (keyCode == DOWN) {
        if (racketState == 3) {
          return;
        }
        if (millis() - lastStateChangeTime >= stateChangeInterval ) {
          racketState++;
          lastStateChangeTime = millis();
        }
      } else {
        // Reset the racket state to 0 when the key is released
        racketState = 0;
      }
    }
  }
}
