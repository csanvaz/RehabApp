#include <MPU6050_tockn.h>
#include <Wire.h>

int fsrIndex = 0;
int fsrMiddle = 1;
int fsrPalm = 2;
int fsrRing = 3;

int indexReading = 0;
int middleReading = 0;
int palmReading = 0;
int ringReading = 0;


MPU6050 sensor(Wire);



void setup() {
   // initialize the serial communication:
  Serial.begin(9600);


  Wire.begin();
  sensor.begin();
  sensor.calcGyroOffsets(true);

}

void loop() {
  // Pressure Sensor Readings
  indexReading = analogRead(fsrIndex); 
  middleReading = analogRead(fsrMiddle); 
  palmReading = analogRead(fsrPalm); 
  ringReading = analogRead(fsrRing); 



  sensor.update();
  int xRot = sensor.getAccAngleX();
  int yRot = sensor.getAccAngleY();
  
  // Sending Data to Proceessing
  String concatData = String(indexReading) + "," + String(middleReading) + "," + String(ringReading) + "," + String(palmReading) + "," + String(xRot) + "," + String(yRot) + ",";
  delay (500);
  Serial.println(concatData);


}
