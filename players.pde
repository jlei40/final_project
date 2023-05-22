
public void player1(int x, int y){
  scale(4);
  circle(x,y+10,10); // head
  line(x,y+15,x, y+40); // body
  line(x,y+25,x+15, y+12); // arm1
  line(x,y+25,x-10, y+47); // arm2
  if (getAnimation1())
  walk11(x,y);
  else walk12(x,y);
}

public void player2(int x, int y){
  scale(4);
  circle(x,y+10,10); // head
  line(x,y+15,x, y+40); // body
  line(x,y+25,x-15, y+12); // arm1
  line(x,y+25,x+10, y+47); // arm2
  if (getAnimation1())
  walk21(x,y);
  else walk22(x,y);
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
