/*
This is the Barrel Distortion algorithm, suitable for Oculus Rift
or (maybe) Google Cardboard.

The default distortion coefficients are set for the Oculus Rift.
You can change them with the setBarrelDistortionCoefficients
method.
*/
import camera3D.Camera3D;
import camera3D.generators.*;
import ketai.camera.*;
Camera3D camera3D;



void setup() {
  size(displayHeight, displayWidth, 36, P3D);
  camera3D = new Camera3D(this);
  cam = new KetaiCamera(this, displayHeight, displayWidth, 36);
  BarrelDistortionGenerator generator = camera3D.renderBarrelDistortion().setDivergence(1);
  // Change these numbers to learn how this works. Set them to 0, 0 for no distortion.
  // generator.setBarrelDistortionCoefficients(0.22, 0.24);

  camera3D.setBackgroundColor(255);
  camera3D.enableSaveFrame('s', "debug");
}

void preDraw() {
  rot += 1;
  rotX = rot * 0.5f;
  rotY = rot * 0.1f;
  rotZ = rot * 0.3f;
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