void setup () {
 size (displayWidth, displayHeight);
textSize (40); 
fill (255, 255, 0);
textAlign (CENTER, CENTER);
}

void draw () {
  background (0);
  textSize(24);
  text ("Destroy all enemies in a wave to advance to the boss. \nDefeat the boss to advance to the next level.\n Enemies will fire at you, lowering your blue health bar at the top left. \nThe top right represents the number of missiles available.\n \nMove in 3-D with 'WASD' and 'ZX' \nPress 'O' to fire lasers \nPress 'I' to fire missiles \nPress 'K' to scope in \nPress 'P' to scope out \nPress 'L' to go back to default scope. \n \nClick anywhere to continue.", width/2, height/2);
}
