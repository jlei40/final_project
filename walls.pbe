
public class Walls {
  private PVector lwall;
  private PVector rwall;
  private PVector net;
  private PVector floor;
  public Walls(float sketchWidth, float sketchHeight) {
    lwall = new PVector(0, 0);
    rwall = new PVector(sketchWidth, 0);
    net = new PVector(sketchWidth/2, sketchHeight-300);
    floor = new PVector(0, sketchHeight-20);
  }
  
  public void makeWalls(){
    fill(#000000);
    rect(lwall.x, lwall.y, 20, height);  
    rect(rwall.x - 20, rwall.y, 20, height); 
    rect(net.x - 5, net.y, 10, height);  
    rect(floor.x , floor.y, width, 20);  
  
  }
}
