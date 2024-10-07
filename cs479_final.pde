import processing.serial.*;
import org.gicentre.utils.stat.*;
import java.util.Scanner;

Serial myPort;  // Create object from Serial class
int dataIndex = 0; // Index to keep track of collected data


// Variables to store and display fsr data
int indexFSR = 0;
int middleFSR = 0;
int ringFSR = 0; 
int palmFSR = 0;
int pressureState = 0;

// Variable for calculating average for strength mode
int avgFSR = 0;


// Variable for accelerometer
int xRot = 0;
int yRot = 0;
int zRot = 0;

int mode = 0;


void setup() {
  size(1100, 1000);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);  // Match the baud rate with the Arduino code

 
  background(255);
  strengthImageSetup();
  accuracyImageSetup();
  muscleAgencySetUp();
  menuBarSetup();
  menuSetup();
  delay(10);  
}


void draw() {
 

  pushStyle();
  fill(255); // Set background color
  textSize(28); // Set font size
  rect(0, 0, width, 150);  // Box to put chart in
 
  fill(0);
  text("Average FSR: " + avgFSR, 50, 40);
  // Display data information ( will probably change )
  //text("Toe FSR: " + Integer.toString(toeFSR), 50,40);
  //text("Right FSR: " + Integer.toString(rightFSR), 300,40);
  //text("Left FSR: " + Integer.toString(leftFSR), 600,40);
  //text("Heel FSR: " + Integer.toString(heelFSR), 800,40);
  
  //if(spm == -1){
  //  text("Calculating Cadence...", 300, 80);
  //}else{
  //   text("Cadence: " + Integer.toString(spm), 300, 80);
  //}
  //text("Step Count: " + Integer.toString(stepCount), 800,80);
 
 
  // Keyboard controls for mode switching
  if (keyPressed) {
    if (key == '0') {
      mode = 0;  // menu
    } else if (key == '1') {
      mode = 1;  // strength mode
    } else if (key == '2') {
      mode = 2;  // accuracy mode
    } else if (key == '3') {
      mode = 3;
    } else if (key == '4') {
      mode = 4;
    }
  }
  
  
  if (mode == 0) {
    menuDraw();
  } else if (mode == 1) {
    strengthModeDraw();
  } else if (mode == 2) {
    accuracyModeDraw();
  } else if (mode == 3) {
    muscleAgencyDraw();
  } else if (mode == 4) {
    gestureModeDraw();
  }
  
  menuBarDraw();
  
  
  popStyle();
 
}

int equalCounter = 2;  // for skipping initial gyro calibration, was causing null errors before

void serialEvent(Serial myPort) {
  String value = myPort.readStringUntil('\n');

  //println(value); // debugging
  if ((value != null) && (value.indexOf("========================================") >= 0)){
    equalCounter--;
    return;
  }
  
  println(value);
  
  
  if ((value != null) && (equalCounter <= 0)) {
   
    println("not null", value);
    
    // Splitting in order heart rate, confidence, and then oxygen level
    int[] data = int(split(value, ','));
   
   
     
     if (data[0] >= 0) {
       
       
        // Update FSR readings
        indexFSR = data[0];
        middleFSR = data[1];
        ringFSR = data[2];
        palmFSR = data[3];
  
        // Accumulate FSR readings for averaging
        avgFSR = (indexFSR + middleFSR + ringFSR + palmFSR)/4;
        
        
        // Collecting Acceleration data
        xRot = data[4];
        yRot = data[5];
        zRot = data[6];
        
        //println(xRot + " " + yRot + " " + zRot);
     
   }
       
  }

}
