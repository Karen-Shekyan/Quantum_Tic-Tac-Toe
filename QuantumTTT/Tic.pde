public class Tic {
  private int location; //range: [0,8]
  private int ID;
  private int partnerLocation;
  
  public Tic (int location, int ID, int partnerLocation) {
    this.location = location;
    this.ID = ID;
    this.partnerLocation = partnerLocation;
  }
  
  public void display() {
    int xPos = 300*(location % 3) + 100*(partnerLocation % 3);
    int yPos = 300*(location / 3) + 100*(partnerLocation / 3);
    
    if (ID < 0) {
      drawO(xPos, yPos);
      stroke(66, 135, 245, 100);
    }
    if (ID > 0) {
      drawX(xPos, yPos);
      stroke(237, 64, 64, 100);
    }
    
    int xPosPartner = 300*(partnerLocation % 3) + 100*(location % 3);
    int yPosPartner = 300*(partnerLocation / 3) + 100*(location / 3);
    
    strokeWeight(2);
    
    line(xPos+50, yPos+50, xPosPartner+50, yPosPartner+50);
  }
  
  public int getLoc() {
    return location;
  }
  
  public int getID() {
    return ID;
  }
  
  public int getPartLoc() {
    return partnerLocation;
  }
  
  private void drawX(int xPos, int yPos) {
    strokeWeight(3);
    stroke(237, 64, 64);
    line(xPos+15, yPos+15, xPos+85, yPos+85);
    line(xPos+85, yPos+15, xPos+15, yPos+85);
  }
  
  private void drawO(int xPos, int yPos) {
    strokeWeight(3);
    stroke(66, 135, 245);
    noFill();
    ellipse(xPos+50, yPos+50, 40, 40);
  }
}
