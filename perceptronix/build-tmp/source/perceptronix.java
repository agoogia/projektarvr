import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ketai.camera.*; 

import ketai.camera.*; 
import ketai.cv.facedetector.*; 
import ketai.data.*; 
import ketai.net.*; 
import ketai.net.bluetooth.*; 
import ketai.net.nfc.*; 
import ketai.net.nfc.record.*; 
import ketai.net.wifidirect.*; 
import ketai.sensors.*; 
import ketai.ui.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class perceptronix extends PApplet {



//1280x720

KetaiCamera cam;
String effect;

public void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayHeight, displayWidth, 36);
  effect = "imageRotate";
}

public void draw() {
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
}

public void imageRotate( KetaiCamera cam, float x, float y ){
  pushMatrix(); 
  scale (-1,1);
  image( cam, -x - cam.width , y); 
  popMatrix(); 
} 

public void imageFlipped( KetaiCamera cam, float x, float y ){
  pushMatrix(); 
  scale( 1, -1 );
  image( cam, x, - y - cam.height ); 
  popMatrix(); 
} 

public void imageColor( KetaiCamera cam, float x, float y ) {
  for (int a = 0; a < (cam.height); a ++ ) {
    for (int b = 0; b < cam.width; b ++ ) {
      int i = a + b*(cam.height);
      float cze = red(cam.pixels[i]);
      float zie = green(cam.pixels[i]);
      float nie = blue(cam.pixels[i]);
      int c = color(zie, zie, nie);
      pixels[i] = c;
    }
  }
  pushMatrix();
  image(cam, x, y);
  popMatrix();  
}

public void onCameraPreviewEvent() {
  cam.read();
}

// start/stop camera preview by tapping the screen
public void mousePressed() {
  if( cam.isStarted() ) {
    cam.stop();
  }
  else {
    cam.start();
  }
}

public void keyPressed() {
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "perceptronix" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
