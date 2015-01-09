class Star {
  PVector loc;
  float sz, fc; 

  Star () {
    loc =  (random (0, width), random (0, height));
    sz = 5;
    fc = 0;
  }

  void display () {
    ellipse (loc.x, loc.y, sz, sz);
  }

  boolean fade () {
    if (frameCount-fc>10) {
      return true;
      fc=frameCount;
    } else {
      return false;
    }
  }
}

