import guru.ttslib.*;
import processing.sound.*;
PinkNoise noise;
PImage img;
PImage img1;
int x=0;
boolean doorOpening = false;
int choice = -100;
int startTime = 0;
int currentTime = 0;
String message = "";
TTS tts;

//int value = 87;

//*****************************************************************************************
void setup(){
 size(1200,1200);
 frameRate(3000);
 
 img =loadImage("Plate.jpg");
 img1 = loadImage("Power.jpg");
 noise = new PinkNoise(this);
 startTime = millis()/1000;
 tts = new TTS();
 //tts.setPitch(200);
 //tts.setPitchRange(150);
 //tts.setPitchShift( 20.0 );
 
}
//*****************************************************************************************

void draw(){
  background(255);
  fill(0);
  rect(100,80,1000,600);             //Outer layer of microwave
  fill(255);
  rect(150,130,500,500);            //inside layer of the door
  image(img, 300,450,300,150);
  fill(50);
  rect(150+x, 130, 500, 500);       // Main Door
  fill(85,76,76);    
  rect(160+x,230, 30, 300);         // Door Handle
  fill(0);
  
  fill(124,99,99);
  rect(250+x, 150, 300, 60);
  fill(250,221,149);
  textSize(12);
  text( "Warning: Please only use \n microwaveable plastic dishes only, \n do not use steel dishes",400+x,180);
  fill(255);
  rect(270+x, 250, 250, 250);       // transparent window
  fill(87);
  rect(680, 130, 400, 500);         // Switches menue
  rect(700, 140, 200, 30,10);       // Shape for time
  rect(920, 140, 150, 30, 10);      // shape for date
  fill(0);
  rect(730, 180, 300, 30, 10);      // Shape for display
  
  // shape design for numbers
  
  fill(50);
  rect(765, 221, 210, 202, 10);     //numbers boundry
  ellipse(800,250,60,40);
  ellipse(870,250,60,40);
  ellipse(940,250,60,40);
  ellipse(800,300,60,40);
  ellipse(870,300,60,40);
  ellipse(940,300,60,40);
  ellipse(800,350,60,40);
  ellipse(870,350,60,40);
  ellipse(940,350,60,40);
  ellipse(870,400,60,40);
  ellipse(940,400,60,40);
  ellipse(800,400,60,40);
  //ellipse( 730,250,40,40); 
  //Extra keys
  ellipse (760, 455, 100, 50);
  ellipse (880, 455, 100, 50);
  ellipse (1000, 455, 100, 50);
  
  ellipse (760, 530, 100, 50);
  ellipse (880, 530, 100, 50);
  ellipse (1000,530, 100, 50);
  
  ellipse (760, 600, 100, 50); //start button
  ellipse (880, 600, 100, 50); // stop button
  ellipse (1000, 600, 100, 50); // Door button
  
  // Inserting text in the button
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("1", 800, 250);
  text("2", 870, 250);
  text("3", 940, 250);
  text("4", 800, 300);
  text("5", 870, 300);
  text("6", 940, 300);
  text("7", 800, 350);
  text("8", 870, 350);
  text("9", 940, 350);
  text("0", 870, 400);
  text("Popcorn",760, 455);
  text("Potato", 880, 455);
  text("Beverage",1000,455);
  text("Defrost",760, 530);
  text("Timer",880, 530);
  text("Vent Fan",1000, 530);
  text("Start",760, 600);
  text("Stop",880, 600);
  text("Clear",800,400);
  text(message, 880, 190);      
  textSize(12);
  text ("add 30s", 940, 400);

//***************************************************************************************** 
  
  //Power button
  fill(250,3,3);
  ellipse( 730,250,40,40);
  image(img1, 720,240,20,20);
  //if (mousePressed &&(mouseX> 710 && mouseX < 750 && mouseY >230 && mouseY < 270)){
  //  fill(10,203,18);
  // ellipse( 730,250,40,40);
  //}
  
  if (choice == 21){
  fill(10,203,18);
   ellipse( 730,250,40,40);
  }
  
  
  
  
//*****************************************************************************************  
  
//Displaying Time and Date on the screen
  
  fill(70, 252, 10);
  text("Date :"+ day()+"/"+month()+"/"+year(), 800,152);
  text("Time :"+ hour()+":"+minute()+":"+second(),1000,152);
//*****************************************************************************************  

 //If else condition for  door dutton operations 
 if (doorOpening == true){
   text( "Close door", 1000, 600);
   
   
 }
  else if( doorOpening == false){
   text(" Open Door" , 1000,600);
   
 }
 
 // Condition for sliding the door
 if ( doorOpening == true && x <450){
   text("Door opening...", 850,190);
   x++;
   
 }
   
  else if(doorOpening == false && x > 0){
    x--;
    text("Door Closing...", 850,190);
    
}
//***************************************************************************************** 
 // Condition for numbers operation
 if ( choice >= 0 && choice <= 9  ){
     text(":", 860, 190);
    startTimer(60*choice);
    
    
 }
 
//***************************************************************************************** 
 //Settiing 2 minutes for different extra keys
 if(choice >= 11 && choice <=14){
   text(":", 860, 190);
   startTimer(120);
 }
 
 //*****************************************************************************************
 // vent fan
 if(choice == 16 ){
   noise.play();
 }
//*****************************************************************************************

 //Resetting to starttime
 if (choice == 18){
   startTime = millis()/1000;
   noise.stop();
 }
 if(choice == 19){
   fill(0);
  rect(730, 180, 300, 30, 10); 
   }
   
   if (choice == 20){
     startTimer(30);
   }
}
//***************************************************************************************** 

 //Conditions for mouse click in different position
 void mouseClicked(){
   if (mouseX > 950 && mouseX < 1050 && mouseY>550 && mouseY<650){
     choice = 10;
     doorOpening ^= true;
   
      if( doorOpening == true){ 
         tts.speak("door opening");
      } else{
         tts.speak("door closing");
      }
      
   }
    if ((mouseX> 770 && mouseX < 830 && mouseY > 230 && mouseY< 270)){
      tts.speak(" Timer started for 1 minutes");
      choice =1;
   }
   if (mouseX> 840 && mouseX<900 && mouseY > 230 && mouseY< 270){
     tts.speak("Timer started for 2 minutes");
    choice =2;
   }
   if (mouseX>910 && mouseX<970 && mouseY > 230 && mouseY< 270){
    choice =3;
    tts.speak(" Timer started for 3 minutes");
   }
   if (mouseX>770 && mouseX<830 && mouseY > 280 && mouseY< 320){
    choice =4;
    tts.speak("Timer started for 4 minutes");
   }
   if (mouseX>840 && mouseX<900 && mouseY > 280 && mouseY< 320){
    choice =5;
    tts.speak("Timer started for 5 minutes");
   }
   if (mouseX>910 && mouseX<970 && mouseY > 280 && mouseY< 320){
    choice =6;
    tts.speak("Timer started for 6 minutes");
   }
   if (mouseX>770 && mouseX<830 && mouseY > 330 && mouseY< 370){
    choice =7;
    tts.speak("Timer started for 7 minutes");
   }
   if (mouseX>840 && mouseX<900 && mouseY > 330 && mouseY< 370){
    choice =8;
    tts.speak("Timer started for 8 minutes");
   }
   if (mouseX>910 && mouseX<970 && mouseY > 330 && mouseY< 370){
    choice =9;
    tts.speak("Timer started for 9 minutes");
   }
   if (mouseX>840 && mouseX<900 && mouseY > 380 && mouseY< 420){
    choice =0;
    tts.speak("Timer started for 0 minutes");
   }
   if (mouseX>710 && mouseX<810 && mouseY > 430 && mouseY< 480){ //popcorn   //ellipse (760, 455, 100, 50);  
    choice =11;
    tts.speak(" 2 minutes started for popcorn");
   }
   if (mouseX>830 && mouseX<930 && mouseY > 430 && mouseY< 480){  //potato
    choice =12;
    tts.speak("2 minutes started for potato");
   }
   if (mouseX>950 && mouseX<1050 && mouseY > 430 && mouseY< 480){ // beverage
    choice =13;
    tts.speak("2 minutes started for beverage");
   }
   
   if (mouseX>710 && mouseX<810 && mouseY > 505 && mouseY< 555){
    choice =14;
    tts.speak("2 minutes started for defrost");
   }
   if (mouseX>830 && mouseX<930 && mouseY > 505 && mouseY< 555){
    choice =15;
    
   }
   if (mouseX>950 && mouseX<1050 && mouseY > 505 && mouseY< 555){
    choice =16;
    tts.speak("vent fan started");
   }
   if (mouseX>710 && mouseX<810 && mouseY > 550 && mouseY< 650){
    choice =17;
    
   }
   
   if (mouseX>830 && mouseX<930 && mouseY > 550 && mouseY< 650){
    choice =18;
    tts.speak("Operation stopped");
   }
   if (mouseX>770 && mouseX<830 && mouseY > 380 && mouseY< 420){  //clear button
    choice =19;
   }
   
   if (mouseX > 910 && mouseX < 970 && mouseY > 380 && mouseY <420){
     choice =20;
     tts.speak("Timer started for 30 seconds");
     }
     if (mouseX > 710 && mouseX < 750 && mouseY > 230 && mouseY <270){
     choice = 21;
 }
 }
   //if (value == 87){
   //  fill(10,203,18);
   //  ellipse( 730,250,40,40);
   //}else{
   //  value =87;
   //}

 
 //Function for timer 
 void startTimer(int t){
   currentTime = millis()/1000 - startTime;
   if (t- currentTime > 0){
     message = String.valueOf(t-currentTime);
   }
   else{
     message = "START";
 }
 }
