import ketai.camera.*;

//1280x720

KetaiCamera cam;

void setup() {
  orientation(LANDSCAPE);
  cam = new KetaiCamera(this, displayHeight, displayWidth, 24); //jak duze jest pole wyswietlania
  cam.loadPixels();
}


void draw() {
  loadPixels();
   imageColor(cam, 0, 0);
   updatePixels();
   imageColor(cam, 640, 0);
}


void imageColor(KetaiCamera cam, float x, float y){
  
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
      image (cam, x,y);
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
  } else
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