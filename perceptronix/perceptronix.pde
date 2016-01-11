import ketai.camera.*;

//1280x720

KetaiCamera cam;
String effect;

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayHeight, displayWidth, 36);
  effect = "imageRotate";
}

void draw() {
  if( effect == "imageRotate" ) {
    imageRotate(cam, 0, 0);
    imageRotate(cam, 640, 0);
  } else if( effect == "imageFlipped" ) {
    imageFlipped(cam, 0, 0);
    imageFlipped(cam, 640, 0);
  } else if( effect == "changedColors" ) {
    changedColor();
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

void changedColors() {
  cam.loadPixels();
  image(cam, 0, 0);
  image(cam, 640, 0);

  for (int a = 0; a < cam.height/2; a ++ ) {
    for (int b = 0; b < cam.width; b ++ ) {
      int i = a + b*cam.width;
      float cze = red(cam.pixels[i]);
      float zie = green(cam.pixels[i]);
      float nie = blue(cam.pixels[i]);
      color c = color(zie, zie, nie);
      pixels[i] = c;
      updatePixels();
    }
  }
}

void onCameraPreviewEvent() {
  cam.read();
}

// start/stop camera preview by tapping the screen
void mousePressed() {
  if( cam.isStarted() ) {
    cam.stop();
  }
  else {
    cam.start();
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