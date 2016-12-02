/**
 * <p>Ketai Sensor Library for Android: http://ketai.org</p>
 *
 * <p>KetaiSensor Features:
 * <ul>
 * <li>handles incoming Sensor Events</li>
 * <li>Includes Accelerometer, Magnetometer, Gyroscope, GPS, Light, Proximity</li>
 * <li>Use KetaiNFC for Near Field Communication</li>
 * </ul>
 * <p>Updated: 2012-03-10 Daniel Sauter/j.duran</p>
 */

import ketai.sensors.*;

KetaiSensor sensor;
float rotationX, rotationY, rotationZ;
int posicao = 640;

PImage img1;
PImage img2;
PImage tit;

void setup()
{
  size(displayWidth, displayHeight);
  img1 = loadImage("UNIFOR.jpg");
  img2 = loadImage("UNIFOR.jpg");
  tit = loadImage("tit_p.png");
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  textSize(36);
}

void draw()
{
  background(78, 93, 75);
  image(img1, posicao , 0, 8152, 1080);
  image(img2, posicao - 8152 , 0, 8152, 1080);
  image(tit, 30 , 30);
  text("Campus Unifor\nBairro Edson Queiroz", width * 0.8, height * 0.8, width, height);
}

void onGyroscopeEvent(float x, float y, float z)
{
  rotationX = x;
  posicao = posicao + round(x*100);
  if(posicao>6872){
    posicao = -1280;
  }
  if(posicao<-6232) {
    posicao = 1780; 
  }
  rotationY = y;
  rotationZ = z;
}