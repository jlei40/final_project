Walls wallsInstance;  // Declare an instance of the walls class
Racket racketOne;
Racket racketTwo; 
Birdie birdie;
PVector playerPos = new PVector(100,100);
PVector playerPos2 = new PVector(200,200);
void setup() {
  size(1400, 800);
  wallsInstance = new Walls(width,height); 
  racketOne = new Racket(playerPos);
  birdie = new Birdie(playerPos2);

}

void draw() {
  background(220);
  wallsInstance.makeWalls();
  racketOne.makeRacket();
  birdie.updateBirdie();
  birdie.makeBirdie();
}
void keyPressed() {
  
  birdie.keyPressed();
}
