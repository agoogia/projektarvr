import ketai.camera.*;

//1280x720

KetaiCamera cam;
String effect;
PImage img_menu;
Boolean menuVisible;
MenuItem[] menuList;

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayHeight, displayWidth, 36);
  effect = "imageRotate";
  img_menu = loadImage("menu3.png");
  menuVisible = false;
  menuList = new MenuItem[3];
  menuList[0] = new MenuItem(1, "imageRotate");
  menuList[1] = new MenuItem(2, "imageFlipped");
  menuList[2] = new MenuItem(3, "imageColor");
}

void draw() {
  if( effect == "imageRotate" ) {
    imageRotate(cam, 0, 0);
    imageRotate(cam, 640, 0);
  } else if( effect == "imageFlipped" ) {
    imageFlipped(cam, 0, 0);
    imageFlipped(cam, 640, 0);
  } else if( effect == "imageColor" ) {
    loadPixels();
    imageColor(cam, 0, 0);
    updatePixels();
    imageColor(cam, 640, 0);
  }
  image(img_menu, width - 100, 20);
  if(menuVisible) {
    for(int i = 0; i < menuList.length; i++) {
      menuList[i].show();
    }
  }
}

void imageRotate( KetaiCamera cam, float x, float y ){
  pushMatrix(); 
  scale (-1,1);
  image( cam, -x - cam.width , y); 
  popMatrix(); 
} 

void imageFlipped( KetaiCamera cam, float x, float y ){
  pushMatrix(); 
  scale( 1, -1 );
  image( cam, x, - y - cam.height ); 
  popMatrix(); 
} 

void imageColor( KetaiCamera cam, float x, float y ) {
  for (int a = 0; a < (cam.height); a ++ ) {
    for (int b = 0; b < cam.width; b ++ ) {
      int i = a + b*(cam.height);
      float cze = red(cam.pixels[i]);
      float zie = green(cam.pixels[i]);
      float nie = blue(cam.pixels[i]);
      color c = color(zie, zie, nie);
      pixels[i] = c;
    }
  }
  pushMatrix();
  image(cam, x, y);
  popMatrix();  
}

void toggleMenu() {
    if(menuVisible) menuVisible = false;
    else menuVisible = true;
}

void onCameraPreviewEvent() {
  cam.read();
}

void mousePressed() {
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
      effect = menuList[0].getName();
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
      effect = menuList[1].getName();
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
      effect = menuList[2].getName();
      menuVisible = false;
  }
}

void keyPressed() {
  if( key == CODED ) {
    if( keyCode == MENU ) {
      if( cam.isFlashEnabled() )
        cam.disableFlash();
      else {
        cam.enableFlash();
      }
    }
  }
}