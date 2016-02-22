public class MenuItem {

  private PFont f;
  private int id;
  private String name;
  private Boolean current;

  public MenuItem(int id, String name) {
    this.id = id;
    this.name = name;
    if(id == 1) current = true;
    else current = false;
    f = createFont("Arial", 18, true);
  }

  public void toggleCurrent() {
    if(current) current = false;
    else current = true;
  }

  public void setCurrent(Boolean v) {
    current = v;
  }

  public Boolean isCurrent() {
    return current;
  }

  public String getName() {
    return name;
  }

  public void show() {
    fill(200);
    noStroke();
    rect(width - 320, 20 + 73 * id, 300, 70);
    fill(50);
    textFont(f, 18);
    text(name, width - 260, 62 + 73 * id);
    if(current) {
      fill(#ff6666);
      ellipse(width - 290, 56 + 73 * id, 15, 15);
    }
  }

}
