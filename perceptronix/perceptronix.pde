import ketai.camera.*;

// rozdzielczosc 1280x720

KetaiCamera cam;

void setup() {
  orientation(PORTRAIT);
  cam = new KetaiCamera(this, displayWidth, displayHeight, 36);
} //kamerka, szerokosc wyswietlania, wysokosc wyswietlania, fps

void draw() {
  imageFlipped(cam, 0,0);
  imageFlipped(cam, 0, displayHeight/2);//tu sa koordynaty od czego sie zaczyna wysw
}

void onCameraPreviewEvent()
{
  cam.read();
}

void imageFlipped( KetaiCamera cam, float x, float y ){
  pushMatrix(); 
  scale( 1, -1 );
  image( cam, x, - y - cam.height ); 
  popMatrix(); 
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