

// 0 - arm front, elbow not bent, palm down
// 1 - arm front, elbow not bent, palm up
// 2 - arm front, elbow bent, palm inward
// 3 - arm left, elbow not bent, palm down
// 4 - arm left, elbow bent, palm inward

int gestureNumber = 0;


boolean inGesture = false;  // tracks if user is in gesture
boolean gestureCompleted = true;  // tracks if gesture hold time has elapsed without user leaving zone



void gestureModeDraw() {
  background(196, 154, 177);
  
  if (gestureCompleted == true) {
    int newGestureNumber = gestureNumber;
    while (newGestureNumber == gestureNumber) {  // ensure a different zone each time
      newGestureNumber = (int)random(5);
    }
    gestureNumber = newGestureNumber;
    gestureCompleted = false;
    inGesture = false;
    
  }
  
  textAlign(CENTER);
  
  textSize(36);
  text("Current Gesture:", 550, 410);
  
  if ((-35 < xRot && xRot < 35) && (-35 < yRot && yRot < 35) && (-35 < zRot && zRot < 35)) {
      
      fill(0,0,0);
      text("Arm front, elbow not bent, palm down", 550, 450);
      
      if (gestureNumber == 0) {
        gestureCompleted = true;
      }
   }
   
   if ((-35 < xRot && xRot < 35) && (-35 < yRot && yRot < 35) && (145 < zRot && zRot < 215)) {
      
      fill(0,0,0);
      text("Arm front, elbow not bent, palm up", 550, 450);
      
      if (gestureNumber == 1) {
        gestureCompleted = true;
      }
   }
   
   if ((-35 < xRot && xRot < 35) && (55 < yRot && yRot < 125) && (145 < zRot && zRot < 215)) {
      
      fill(0,0,0);
      text("Arm front, elbow bent, palm inward", 550, 450);
      
      if (gestureNumber == 2) {
        gestureCompleted = true;
      }
   }
   
   if ((55 < xRot && xRot < 125) && (-35 < yRot && yRot < 35) && (145 < zRot && zRot < 215)) {      

      fill(0,0,0);
      text("Arm left, elbow not bent, palm down", 550, 450);
      
      if (gestureNumber == 3) {
        gestureCompleted = true;
      }
   }
   
   if ((55 < xRot && xRot < 125) && (55 < yRot && yRot < 125) && (145 < zRot && zRot < 215)) {
      
      fill(0,0,0);
      text("Arm left, elbow bent, palm inward", 550, 450);
      
      if (gestureNumber == 4) {
        gestureCompleted = true;
      }
   }
   
   
   text("Target Gesture:", 550, 530);
   if (gestureNumber == 0) {
     text("Arm front, elbow not bent, palm down", 550, 570);
   } else if (gestureNumber == 1) {
     text("Arm front, elbow not bent, palm up", 550, 570);
   } else if (gestureNumber == 2) {
     text("Arm front, elbow bent, palm inward", 550, 570);
   } else if (gestureNumber == 3) {
     text("Arm left, elbow not bent, palm down", 550, 570);
   } else if (gestureNumber == 4) {
     text("Arm left, elbow bent, palm inward", 550, 570);
   }
   
  // Draw header
  fill(176, 134, 157);
  noStroke();
  rect(0,0,1100,200);
  fill(0);
  textSize(72);
  textAlign(CENTER);
  text("Gesture Mode", 550,100);
  textSize(36);
  text("Practice full-arm control with a variety of common gestures.", 550,150);
  
  
  
  
  
  
}
