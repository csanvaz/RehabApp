
// Creating instances of different images
PImage thumbFinger, indexFinger, middleFinger, ringFinger;

// Variable to track random finger to show
int randomFSR = -1;

// Variables to track if right FSR was squeezed
Boolean thumbSqueeze, indexSqueeze, middleSqueeze, ringSqueeze = false;
Boolean fingerFSRCompleted = true;


int agencyStartMillis = 0;
int agencyInterval = 3000;


// Variable to keep track of score
int score = 0;
int maxScore = 0;

void muscleAgencySetUp(){
  thumbFinger = loadImage("thumbFinger.png");  // image of thumb finger squeezing FSR 

  
  indexFinger = loadImage("indexFinger.png");  // image of index finger squeezing FSR
  
  
  middleFinger = loadImage("middleFinger.png");  // image of middle finger squeezing FSR
  
  
  ringFinger = loadImage("ringFinger.png");  // image of ring finger squeezing FSR
}

// Prompt the user to squeeze certain fsrs and display picture to also help with prompting
// Display a score of how many times the user has successfully displayed 
void muscleAgencyDraw(){
  background(163, 93, 123);  
  
  if (fingerFSRCompleted){
    // Pick a random FSR that user has to click
    int newFSRNumber = randomFSR;
    while (newFSRNumber == randomFSR) {  // ensure a different zone each time
      newFSRNumber = (int)random(4);
    }
    randomFSR = newFSRNumber;
    
    agencyStartMillis = millis();
    
    fingerFSRCompleted = false;
    
    
    if (maxScore < score){
      maxScore = score;
    }
    
  }
  
  textAlign(CENTER);
  textSize(42);
  
  // Show Random Images
    if(randomFSR == 0){
      text("Squeeze Thumb Finger FSR", 300, 400);
      image(thumbFinger, 400, 200);
      thumbSqueeze = true;
    }
    
    if(randomFSR == 1){
      text("Squeeze Index Finger FSR", 300, 400);
      image(indexFinger, 400, 200);
      indexSqueeze = true;
    }
    
    
    if(randomFSR == 2){
      text("Squeeze Middle Finger FSR", 300, 400);
      image(middleFinger, 400, 200);
      middleSqueeze = true;
    }
     
    
    if(randomFSR == 3){
      text("Squeeze Ring Finger FSR", 300, 400);
      image(ringFinger, 400, 200);
      ringSqueeze = true;
    }
    
    textSize(36);
    
    
    text(nf(((float)(agencyInterval - (millis() - agencyStartMillis))/1000), 0, 1) + " seconds left!", 300, 450);
    text("Score " + score, 300, 520);
    text("Max Score " + maxScore, 300, 590);
  
  
  fill(143, 73, 103);
  noStroke();
  rect(0,0,1100,200);
  fill(0);
  textSize(72);
  textAlign(CENTER);
  text("Muscle Agency Mode", 550,100);
  textSize(36);
  text("Exercise control over the individual muscles in your hand.", 550,150);
  
  
  // If user fails to hit the correct FSR in time
  if (millis() >= agencyStartMillis + agencyInterval) {
    score = 0;
    fingerFSRCompleted = true;
    indexSqueeze = false;
    middleSqueeze = false;
    ringSqueeze = false;
    thumbSqueeze = false;
  }
  
  
  
  // Only get points if you squeeze the right FRS
  if (indexFSR > 150 && indexSqueeze == true){
    score++;
    indexSqueeze = false;
    fingerFSRCompleted = true; // Mark task as completed to show another prompt
  }
  
  // Only get points if you squeeze the right FRS
  if (middleFSR > 150 && middleSqueeze == true){
    score++;
    middleSqueeze = false; 
    fingerFSRCompleted = true; // Mark task as completed to show another prompt
  }
  
  // Only get points if you squeeze the right FRS
   if (ringFSR > 150 && ringSqueeze == true){
    score++;
    ringSqueeze = false;  
    fingerFSRCompleted = true; // Mark task as completed to show another prompt
  }
  
  // Only get points if you squeeze the right FRS
   if (palmFSR > 150 && thumbSqueeze == true){
    score++;
    thumbSqueeze = false;  
    fingerFSRCompleted = true; // Mark task as completed to show another prompt
  }
   
}
