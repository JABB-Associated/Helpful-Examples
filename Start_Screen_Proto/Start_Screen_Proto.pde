ArrayList<Star> STAR = new ArrayList<Star>();
int rectX, rectY, W, H;
int sz = 5;

void setup () {
  size (displayWidth, displayHeight);
  textAlign (CENTER);
  textSize (50);
  W = 200;
  H = 75;
  rectX = width/2 - W/2;
  rectY = 2*height/3;
}

void draw () {
  background (0);
  rect (rectX, rectY, W, H);

 STAR.add (newStar ());
  
    if (mouseX > rectX && mouseX < rectX + W && mouseY > rectY && mouseY < rectY + H) {
    fill (0, 255, 0);
  } else {
    fill (255, 0, 0);
  }
  
  rect (rectX, rectY, W, H);
  fill (0);
  text ("START", width/2, 2*height/3 + 2*H/3);
  
}

