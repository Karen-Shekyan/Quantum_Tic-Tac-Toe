public class Button {
  private String name;
  private float xPos;
  private float yPos;
  private float Width;
  private float Height;
  private color col;
  
  public Button (float xPos, float yPos, float Width, float Height, String name, color col) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.Width = Width;
    this.Height = Height;
    this.name = name;
    this.col = col;
  }
  
  public void display() {
    fill(col);
    rect(xPos, yPos, Width, Height);
    fill(0);
    textAlign(CENTER, CENTER);
    text(name, xPos/2, yPos/2, xPos + Width, yPos + Height);
  }
  
  public boolean mouseOn() {
    if (mouseX > xPos && mouseX < xPos + Width && mouseY > yPos && mouseY < yPos + Height) {
      fill(red(col) - 20, green(col) - 20, blue(col) - 20);
      rect(xPos, yPos, Width, Height);
      fill(0);
      textAlign(CENTER, CENTER);
      text(name, xPos/2, yPos/2, xPos + Width, yPos + Height);
      return true;
    }
    return false;
  }
}
