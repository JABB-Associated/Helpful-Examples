import ddf.minim.*;

AudioPlayer DuelofFates;
Minim minim;//audio context

void setup() {
  size(600, 600);
  frameRate(20);

  minim = new Minim(this);
  DuelofFates = minim.loadFile("Duel of Fates.mp3", 5048);
}

void draw() {
  DuelofFates.play();
}

