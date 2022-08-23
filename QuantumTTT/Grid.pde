public class Grid {
  private ArrayList<ArrayList<Tic>> Tiles = new ArrayList<ArrayList<Tic>>(9);
  
  public Grid() {
    
  }
  
  public boolean playX (int firstP, int secondP) {
    if (!entangled(firstP, secondP, 'x')) {
      Tiles.get(firstP).add(new Tic(firstP, Xcounter, secondP));
      Tiles.get(secondP).add(new Tic(secondP, Xcounter, firstP));
      Xcounter++;
      return true;
    } else {
      return false;
    }
  }
  
  private boolean entangled (int firstP, int secondP, char mode) {
    ArrayList<Tic> firstTile = Tiles.get(firstP);
    ArrayList<Tic> secondTile = Tiles.get(secondP);
    if (mode == 'x') {
      for (int i = 0; i < firstTile.size(); i++) {
        for (int j = 0; j < secondTile.size(); j++) {
          if (firstTile.get(i).getID() == secondTile.get(j).getID() && firstTile.get(i).getID() > 0) {
            return true;
          }
        }
      }
      return false;
    } else if (mode == 'o') {
      for (int i = 0; i < firstTile.size(); i++) {
        for (int j = 0; j < secondTile.size(); j++) {
          if (firstTile.get(i).getID() == secondTile.get(j).getID() && firstTile.get(i).getID() < 0) {
            return true;
          }
        }
      }
      return false;
    } else {
      return true;
    }
  }
  
  private void display() {
    for (int i = 0; i < Tiles.size(); i++) {
      for (int j = 0; j < Tiles.get(i).size(); j++) {
        Tiles.get(i).get(j).display();
      }
    }
  }
}
