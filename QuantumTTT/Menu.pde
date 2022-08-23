void showMenu() {
  background(227);
  
  //Play button
  stroke(0);
  strokeWeight(2);
  Button play = new Button(412.5, 425, 75, 50, "Play", color(210));
  play.display();
  if (play.mouseOn() && mousePressed) {
    MODE = STANDARD;
    Board = new Grid();
    TURN = 0;
  }
}
