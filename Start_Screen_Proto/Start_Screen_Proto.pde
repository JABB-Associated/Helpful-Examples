PImage stars;
int rectX, rectY, W, H;

void setup () {
  stars = loadImage ("Star Background.png");
  size (displayWidth, displayHeight);
  W = 400;
  H = 100;
  rectX = width/2 - W/2;
  rectY = 2*height/3;
}

void draw () {
  background (stars);
  rect (rectX, rectY, W, H);
}

