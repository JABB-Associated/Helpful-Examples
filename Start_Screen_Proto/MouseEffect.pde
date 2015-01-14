class MouseEffect {
  PVector loc, vel, acc;
  float sz;
  float timecapture;

  MouseEffect() {
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(random(-1, 1), random(-1, 1));
    sz = 4;
    timecapture = frameCount;
  }

  void display() {
    fill(255,199,103);
    ellipse(loc.x, loc.y, sz, sz);
    }

    void move() {
      loc.add(vel);
    }

  boolean disappear() {
    if ((frameCount-timecapture)>10) {
      return true;
    } else {
      return false;
    }
  }
}

