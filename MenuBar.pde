



// Creating instance of image
PImage smalllogo;

void menuBarSetup() {
 smalllogo = loadImage("logo.png");  // image of logo
}



// Define button sizes
float menubuttonx = 15;
float menubuttony = 912;
float menubuttonw = 202;
float menubuttonh = 80;

float strbuttonx = 232;
float strbuttony = 912;
float strbuttonw = 202;
float strbuttonh = 80;

float accbuttonx = 449;
float accbuttony = 912;
float accbuttonw = 202;
float accbuttonh = 80;

float agebuttonx = 666;
float agebuttony = 912;
float agebuttonw = 202;
float agebuttonh = 80;

float gesbuttonx = 883;
float gesbuttony = 912;
float gesbuttonw = 202;
float gesbuttonh = 80;




void menuBarDraw() {
  

  // Draw menu bar
  noStroke();
  
  fill(179,235,226);
  rect(0,899,1100,5);
  
  fill(179,235,226);
  circle(550,900,154);
  
  
  fill(149,211,196);
  circle(550,900,142);
  
  fill(149,211,196);
  rect(0,904,1100,200);
  
  
  // Draw logo
  smalllogo.resize(140,140);
  image(smalllogo, 480,798);
  
  
  // Draw buttons
  stroke(99,161,146);
  strokeWeight(2);
  fill(179,241,226);
  
  rect(menubuttonx,menubuttony,menubuttonw,menubuttonh);
  
  rect(strbuttonx,strbuttony,strbuttonw,strbuttonh);
  
  rect(accbuttonx,accbuttony,accbuttonw,accbuttonh);
  
  rect(agebuttonx,agebuttony,agebuttonw,agebuttonh);
  
  rect(gesbuttonx,gesbuttony,gesbuttonw,gesbuttonh);
  
  

  // Draw labels
  strokeWeight(1);
  noStroke();
  
  fill(0,0,0);
  textSize(36);
  
  textAlign(CENTER);
  text("Main Menu", 116, 964);
  
  text("Strength", 333, 964);
  
  text("Accuracy", 550, 964);
  
  text("Agency", 767, 964);
  
  text("Gesture", 984, 964);
  
  
  
  // Handle button clicks
  if(mousePressed){
    if(mouseX>menubuttonx && mouseX <menubuttonx+menubuttonw && mouseY>menubuttony && mouseY <menubuttony+menubuttonh){
      mode = 0;
    }
    if(mouseX>strbuttonx && mouseX <strbuttonx+strbuttonw && mouseY>strbuttony && mouseY <strbuttony+strbuttonh){
      mode = 1;
    }
    if(mouseX>accbuttonx && mouseX <accbuttonx+accbuttonw && mouseY>accbuttony && mouseY <accbuttony+accbuttonh){
      mode = 2;
    }
    if(mouseX>agebuttonx && mouseX <agebuttonx+agebuttonw && mouseY>agebuttony && mouseY <agebuttony+agebuttonh){
      mode = 3;
    }
    if(mouseX>gesbuttonx && mouseX <gesbuttonx+gesbuttonw && mouseY>gesbuttony && mouseY <gesbuttony+gesbuttonh){
      mode = 4;
    }
  } 
  
  
  
}
