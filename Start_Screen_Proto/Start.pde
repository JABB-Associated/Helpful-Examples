class Start {
  PVector loc;
  float sz, fc;
  int rectX, rectY, W, H;
  PImage title;

  Start () {
    loc =  new PVector(random (0, width), random (0, height));
    sz = 5;
    fc = 0;
    W = 200;
    H = 75;
    rectX = width/2 - W/2;
    rectY = 2*height/3;
    title = loadImage ("TITLE.png");
  }

  void display () {
    fill (255);
    ellipse (loc.x, loc.y, sz, sz);
  }

  void button () {
    textAlign (CENTER, CENTER);
    textSize (50);
    if (mouseX > rectX && mouseX < rectX + W && mouseY > rectY && mouseY < rectY + H) {
      fill (0, 255, 0);
    } else {
      fill (255, 0, 0);
    }

    rect (rectX, rectY, W, H);
    fill (0);
    text ("START", width/2, 2*H/5 + rectY);
  }
  
  void title () {
    imageMode(CENTER);
    image (title, width/2, height/3);
  } 
}

