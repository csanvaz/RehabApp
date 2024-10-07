import processing.serial.*;
import org.gicentre.utils.stat.*;
import java.util.Scanner;

// Creating instances of different images
PImage closedHand, semiClosedHand, openHand, strengthMeter;

// Variable for time count
Boolean displayTime, strTimerStarted = false; 
int strStartMillis = 0;
int strengthInterval = 3000;


// Setting up different images for strength mode
void strengthImageSetup(){
  closedHand = loadImage("zone4.png");  // image of closed hand

  
  semiClosedHand = loadImage("zone2.png");  // image of semi - closed hand
  
  
  openHand = loadImage("zone0.png");  // image of open hand
  
  
  strengthMeter = loadImage("strength_meter.png");  // image of strength meter

}

// Drawing images on screen based on required avgFSR
void strengthModeDraw(){
  background(163,154,177); // Strength mode screen background
  
  // Creating rectangle that will fill in strength meter based on grip
  fill(0, 180, 0);
  rect(100, 899, 200, -map(avgFSR, 0, 900, 0, 680));
  
  // Drawing strenght meter
  image(strengthMeter, 0, 200);
  
  // Creating line to show user where strength grip is at
  fill(120, 0, 0);
  rect(100, 370, 199, 4);
  
  // Show open hand if fsravg is 100 and less
  if (avgFSR <= 100){
    image(openHand, 400, 200);
    displayTime = false; // Stop displaying time
    strTimerStarted = false;
    
  }else if (avgFSR < 700){
    image(semiClosedHand,400, 200); // Show semi - open hand if fsravg is 100 - 700
    displayTime = false; // Stop displaying time
    strTimerStarted = false;
    
  }else{
    image(closedHand, 400, 200); // Show closed hand if fsravg is 700 and up
    displayTime = true;
  }
  
  fill(143,134,157);
  noStroke();
  rect(0,0,1100,200);
  fill(0);
  textSize(72);
  textAlign(CENTER);
  text("Strength Mode", 550,100);
  textSize(36);
  text("Train your grip strength by reaching the zone and staying within it.", 550,150);
  
  // Display time count down
  if (displayTime){
    if(strTimerStarted == false){
      strStartMillis = millis(); // Starting time
      strTimerStarted = true;
    }
    
    // Display prompting event and time elapsed
    if((float(strengthInterval - (millis() - strStartMillis))/1000) > 0){
      textAlign(LEFT);
      text("Keep Squeezing Ball for 3 seconds", 310, 320);
      text("Remaining: " + nf(float(strengthInterval - (millis() - strStartMillis))/1000, 0, 1), 310, 370);
    }else{
      textAlign(LEFT);
      text("Release Grip", 310, 320);
    }
    
  }
  

}


  
