void setup () {
 size (displayWidth, displayHeight);
textSize (40); 
fill (255, 255, 0);
textAlign (CENTER, CENTER);
}

void draw () {
  background (0);
  text ("Destory all enemies in a wave to advance to the boss. \nDefeat the boss to advance to the next level.\n Enemies will fire at you, lowering your blue health bar at the top left. \nThe top right represents the number of missles available.\n \nMove with 'WASD' \nPress 'I' to fire lasers \nPress 'O' to fire missles \nPress 'K' to scope in \nPress 'P' to scope out \nPress 'L' to go back to default scope", width/2, height/2);
}
