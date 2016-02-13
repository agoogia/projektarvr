import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class interfejs extends PApplet {

PImage img_menu;
Boolean menuVisible = false;
int currentFilter;
MenuItem[] menuList;

public void setup() {
    
    img_menu = loadImage("menu3.png");
    menuVisible = false;
    menuList = new MenuItem[3];
    menuList[0] = new MenuItem(1, "imageRotate");
    menuList[1] = new MenuItem(2, "imageFlipped");
    menuList[2] = new MenuItem(3, "imageColor");
}

public void draw() {
    background(255);
    image(img_menu, width - 100, 20);
    if(menuVisible) {
        for(int i = 0; i < menuList.length; i++) {
            menuList[i].show();
        }
    }
}

public void toggleMenu() {
    if(menuVisible) menuVisible = false;
    else menuVisible = true;
}

public void mousePressed() {
    if( mouseX < width - 20
        && mouseX > width - 100
        && mouseY < 90
        && mouseY > 20 ) {
            toggleMenu();
    }
    // 1
    if( menuVisible
        && mouseX < width - 20
        && mouseX > width - 320
        && mouseY < 166
        && mouseY >= 93 ) {
            for(int i = 0; i < menuList.length; i++)
                menuList[i].setCurrent(false);
            menuList[0].setCurrent(true);
            currentFilter = 1;
            menuVisible = false;
    }
    // 2
    if( menuVisible
        && mouseX < width - 20
        && mouseX > width - 320
        && mouseY < 239
        && mouseY >= 166 ) {
            for(int i = 0; i < menuList.length; i++)
                menuList[i].setCurrent(false);
            menuList[1].setCurrent(true);
            currentFilter = 2;
            menuVisible = false;
    }
    // 3
    if( menuVisible
        && mouseX < width - 20
        && mouseX > width - 320
        && mouseY < 312
        && mouseY >= 239 ) {
            for(int i = 0; i < menuList.length; i++)
                menuList[i].setCurrent(false);
            menuList[2].setCurrent(true);
            currentFilter = 3;
            menuVisible = false;
    }

}
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
			fill(0xffff6666);
			ellipse(width - 290, 56 + 73 * id, 15, 15);
		}
	}

}
  public void settings() {  size(800,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "interfejs" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
