

int zoneNumber = 0;  // current zone number, 0-4
boolean inZone = false;  // tracks if user is in zone
boolean zoneTimerStarted = false;  // flag to make sure timer only starts once
boolean zoneCompleted = true;  // tracks if zone time has elapsed without user leaving zone
int accuracyInterval = 3000;  // time in ms that user must remain in zone to complete it

int zoneImageY = 0;
int zoneThresh = 0;  // lower threshold of zone, upper will be calculated as each zone is the same height

int accStartMillis = 0;

// Creating instances of images
PImage accuracyMeter, accuracyZone;


// Creating instances of different images
PImage zone0, zone1, zone2, zone3, zone4;




// Setting up different images for strength mode
void accuracyImageSetup(){
  accuracyMeter = loadImage("accuracy_meter.png");  // image of accuracy meter
  accuracyZone = loadImage("accuracy_zone.png");  // image of accuracy zone bar
  zone0 = loadImage("zone0.png");
  zone1 = loadImage("zone1.png");
  zone2 = loadImage("zone2.png");
  zone3 = loadImage("zone3.png");
  zone4 = loadImage("zone4.png");
  
}


void accuracyModeDraw() {
  background(129,191,176);
  
  // Success, get new zone for the user to hit
  if (zoneCompleted) {
    int newZoneNumber = zoneNumber;
    while (newZoneNumber == zoneNumber) {  // ensure a different zone each time
      newZoneNumber = (int)random(5);
    }
    zoneNumber = newZoneNumber;
    zoneCompleted = false;
    inZone = false;
    zoneTimerStarted = false;
  }
  
  
  
  
  // Creating rectangle that will fill in strength meter based on grip
  fill(180, 0, 0);
  rect(100, 899, 200, -map(avgFSR, 0, 900, 0, 680));
  
  
  
  // Target hand images
  
  if (zoneNumber == 0) {
    zoneImageY = 727;
    zoneThresh = 80;
    image(zone0,400, 200);
  } else if (zoneNumber == 1) {
    zoneImageY = 608;
    zoneThresh = 230;
    image(zone1,400, 200);
  } else if (zoneNumber == 2) {
    zoneImageY = 489;
    zoneThresh = 380;
    image(zone2,400, 200);
  } else if (zoneNumber == 3) {
    zoneImageY = 370;
    zoneThresh = 530;
    image(zone3,400, 200);
  } else if (zoneNumber == 4) {
    zoneImageY = 251;
    zoneThresh = 690;
    image(zone4,400, 200);
  }
  
  image(accuracyZone, 104, zoneImageY);
  image(accuracyMeter, 0, 200);
  
  // Header
  fill(109,171,156);
  noStroke();
  rect(0,0,1100,200);
  fill(0);
  textSize(72);
  textAlign(CENTER);
  text("Accuracy Mode", 550,100);
  textSize(36);
  text("Train your grip to locate precise thresholds.", 550,150);
  
  
  
  // Check if FSR is in the zone
  if (zoneThresh < avgFSR && avgFSR < zoneThresh + 160) {
    inZone = true;
    if (zoneTimerStarted == false) {  // start timer if it wasn't already on
      zoneTimerStarted = true;
      accStartMillis = millis();
    }
    
    if (millis() - accStartMillis >= accuracyInterval) {  // if user has remained in the zone for long enough, complete zone
      zoneCompleted = true;
    }
    
  } else {  // FSR left zone, reset zone timer
    inZone = false;
    if (zoneTimerStarted == true) {
      zoneTimerStarted = false;
    }
  }
  
  
  if((float(accuracyInterval - (millis() - accStartMillis))/1000) > 0 && inZone == true){
      textAlign(LEFT);
      text("Hold for 3 seconds!", 310, 320);
      text("Remaining: " + nf(float(accuracyInterval - (millis() - accStartMillis))/1000, 0, 1), 310, 370);
   }
  
  
  
  
  
}
