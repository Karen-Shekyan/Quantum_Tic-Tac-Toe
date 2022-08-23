import java.util.*;
//Turn variables
int TURN;
int PLAYER = 0;
int CMP = 1;
//Screen variables
int MODE;
int MENU = 0;
int RULES = 1;
int STANDARD = 2;
//Play variables
Grid Board;
int Xcounter = 1;
int Ocounter = -1;

void setup() {
  size(900, 900);
  MODE = MENU;
}

void draw() {
  if (MODE == MENU) {
    showMenu();
  }
  if (MODE == STANDARD) {
    clear();
    background(255);
    drawBoard();
    
    Board.display();
  }
}

void mouseClicked() {
  if (TURN == 0) {//currently player is always first and plays X
    
  }
}

void drawBoard() {
  strokeWeight(3);
  fill(20);
  line(300, 30, 300, 870);
  line(600, 30, 600, 870);
  line(30, 300, 870, 300);
  line(30, 600, 870, 600);
}
