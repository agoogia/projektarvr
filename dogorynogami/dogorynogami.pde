import ketai.camera.*;

//1280x720

KetaiCamera cam;

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayHeight, displayWidth, 36);
}

void draw() {
  imageFlipped(cam, 0,0);
  imageFlipped(cam,640, 0);
  
}

void imageFlipped( KetaiCamera cam, float x, float y ){
  pushMatrix(); 
  scale( 1, -1 );
  image( cam, x, - y - cam.height ); 
  popMatrix(); 
} 

void onCameraPreviewEvent()
{
  cam.read();
}


  
  

// start/stop camera preview by tapping the screen
void mousePressed()
{
  if (cam.isStarted())
  {
    cam.stop();
  }
  else
    cam.start();
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == MENU) {
      if (cam.isFlashEnabled())
        cam.disableFlash();
      else
        cam.enableFlash();
    }
  }
}