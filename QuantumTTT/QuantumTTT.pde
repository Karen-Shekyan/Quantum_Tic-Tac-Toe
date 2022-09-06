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
int selecting = -1;
int firstPick;
int secondPick;

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
  if (TURN == PLAYER) {//currently player is always first and plays X
    if (selecting == -1) {
      selecting = 1;
    }
    else if (selecting == 1) {
      firstPick = mouseX/300 + 3*(mouseY/300);
      selecting = 2;
    }
    else if (selecting == 2) {
      secondPick = mouseX/300 + 3*(mouseY/300);
      if (Board.playX(firstPick, secondPick)) {
        selecting = 1;
        TURN = CMP;
      } else {
        selecting = 1;
      }
    }
  }
  
  else if (TURN == CMP) {
    if (selecting == 1) {
      firstPick = mouseX/300 + 3*(mouseY/300);
      selecting = 2;
    }
    else if (selecting == 2) {
      secondPick = mouseX/300 + 3*(mouseY/300);
      if (Board.playO(firstPick, secondPick)) {
        selecting = 1;
        TURN = PLAYER;
      } else {
        selecting = 1;
      }
    }
  }
}

void drawBoard() {
  strokeWeight(3);
  stroke(20);
  line(300, 30, 300, 870);
  line(600, 30, 600, 870);
  line(30, 300, 870, 300);
  line(30, 600, 870, 600);
}
