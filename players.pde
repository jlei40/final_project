
public void setup(){
  player1(50);
}

public void player1(int x){
  circle(x,10,10); // head
  line(x,15,x, 40); // body
  line(x,25,x+15, 12); // arm1
  line(x,25,x-10, 47); // arm2
  walk1(x);
  walk2(x);
}

public void walk1(int x){
  line(x, 40, x+10, 65);
  line(x, 40, x-10, 65);
}

public void walk2(int x){
  line(x, 40, x+5, 45);
  line(x+5, 45, x+3, 65);
  line(x,40, x+1, 50);
  line(x+1,50, x-5,65);
}
