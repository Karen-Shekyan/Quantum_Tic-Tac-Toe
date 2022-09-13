public class Grid {
  private ArrayList<ArrayList<Tic>> Tiles = new ArrayList<ArrayList<Tic>>();
  private ArrayList<Tic> Cycle = new ArrayList<Tic>();
  
  public Grid() {
    for (int i = 0; i < 9; i++) {
      Tiles.add(new ArrayList<Tic>());
    }
  }
  
  public boolean playX (int firstP, int secondP) {
    if (!entangled(firstP, secondP, 'x') && (firstP != secondP)) {
      Tic first = new Tic(firstP, Xcounter, secondP);
      Tic second = new Tic(secondP, Xcounter, firstP);
      first.setPartner(second);
      second.setPartner(first);
      
      Tiles.get(firstP).add(first);
      Tiles.get(secondP).add(second);
      
      Xcounter++;
      return true;
    } else {
      return false;
    }
  }
  
  public boolean playO (int firstP, int secondP) {
    if (!entangled(firstP, secondP, 'o') && (firstP != secondP)) {
      Tic first = new Tic(firstP, Ocounter, secondP);
      Tic second = new Tic(secondP, Ocounter, firstP);
      first.setPartner(second);
      second.setPartner(first);
      
      Tiles.get(firstP).add(first);
      Tiles.get(secondP).add(second);
      
      Ocounter--;
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
  
  public void display() {
    for (int i = 0; i < Tiles.size(); i++) {
      for (int j = 0; j < Tiles.get(i).size(); j++) {
        Tiles.get(i).get(j).display();
      }
    }
  }
  
  public boolean detectCycle() {
    for (int i = 0; i < 9; i++) {
      Cycle = findCycle(new Tic(i, 0, i) , new ArrayList<Integer>(), new ArrayList<Tic>());
      if (Cycle.size() != 0) {
        return true;
      }
    }
    return false;
  }
  
  private ArrayList<Tic> findCycle(Tic currentTic, ArrayList<Integer> explored, ArrayList<Tic> edges) {
    int whereAt = currentTic.getLoc(); //<>//
    if (explored.contains(whereAt)) {
      return edges;
    }
    
    explored.add(whereAt); //<>//
    ArrayList<Tic> bucket = Tiles.get(whereAt);
    for (int i = 0; i < bucket.size(); i++) {
      Tic edge = bucket.get(i);
      if (edge.getID() != currentTic.getID()) {
        edges.add(edge);
        ArrayList<Tic> cycle = findCycle(edge.getPartner(), explored, edges);
        if (cycle.size() > 0) {
          return cycle;
        }
        edges.remove(edge);
      }
    }
    
    return new ArrayList<Tic>();
  }
  
  public ArrayList<Tic> getCycle() {
    return Cycle;
  }
  
  public ArrayList<Tic> getTics() {
    ArrayList<Tic> allTics = new ArrayList<Tic>();
    for (int i = 0; i < Tiles.size(); i++) {
      for (int j = 0; j < Tiles.get(i).size(); j++) {
        allTics.add(Tiles.get(i).get(j));
      }
    }
    return allTics;
  }
}
