Walls wallsInstance;  // Declare an instance of the walls class
Racket racketLeft;
Racket racketRight; 
Birdie birdie;
PVector playerPos = new PVector(100,100);
PVector playerPos2 = new PVector(1300,100);
void setup() {
  size(1400,900);
  wallsInstance = new Walls(width,height); 
  racketLeft = new Racket(playerPos);
  racketRight = new Racket(playerPos2);
  birdie = new Birdie(playerPos2);

}

void draw() {
  background(220);
  wallsInstance.makeWalls();
  racketLeft.makeRacket();
  racketRight.makeRacket();
  birdie.updateBirdie();
  birdie.makeBirdie();
}
void keyPressed() {
  racketLeft.keyPressed();
  racketRight.keyPressed();
  birdie.keyPressed();
  
}
