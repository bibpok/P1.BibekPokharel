//Bibek Pokharel
//Human Computer Interaction Project1
// Microwave Interface Design


import guru.ttslib.*;
import processing.sound.*;
PinkNoise noise;
TTS tts;
PImage img;
PImage img1;
boolean doorOpening = false;
boolean open = false;
boolean stop = false;
String message = "";
int s;
int k= 0;
int timer =0;
int x=0;
int choice = -100;
int temp ;
int resume ;
boolean cont = false;

//*****************************************************************************************
void setup(){
 size(1200,1200);
 frameRate(100);
 img =loadImage("Plate.jpg");
 img1 = loadImage("Power.jpg");
 noise = new PinkNoise(this);
 tts = new TTS();
}
//*****************************************************************************************

void draw(){
  s = second();
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
  fill(75,70,64);
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
  text("Pizza",880, 530);
  text("Vent Fan",1000, 530);
  text("Resume",760, 600);
  text("Stop",880, 600);
  text("Clear",800,400);
  text(message, 880, 190);      
  textSize(12);
  text ("add 30s", 940, 400);

//***************************************************************************************** 
  
  //Power button
if (open == true){
   //message ="ON";
   fill(10,203,18);
  }
  else{
    //message = "OFF";
     fill(247,2,2);
     }
  ellipse(730,250,40,40);
  image(img1, 720,240,20,20);
  
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
   message = "Door opening ...";
   x++;
   
 }
   
  else if(doorOpening == false && x > 0){
    x--;
    message = ("Door Closing...");
    
}
//***************************************************************************************** 
 // Condition for numbers operation
 if ( choice >= 0 && choice <= 9){
     timer= 60*choice;
       cont = true;
    // temp = choice;
     
     
 }
 if (choice == 17){
 //timer = resume;
  timer = startTimer(resume);
  message= ":"+ String.valueOf(timer);
   //timer =  60* temp;
 }
 
 
//************************ 
//different extra keys

 if(choice >= 11 && choice <=15){
   cont = true;
   timer = 120;
    
 }
 //*****************************************************************************************
 // vent fan
 if(choice == 16 ){
   noise.play();
 }
//*****************************************************************************************
// stop button
 //Resetting to starttime 
 if (choice == 18){
   stop = true;
   noise.stop();
   cont = false;
 }
 // clear button
 if(choice == 19){
   message = "Ready";
   timer =0 ; 
 
 } 
   if (choice == 20){
     timer=30;
   } 
   if(stop == false || cont == true){
     if(timer > 0){
        timer = startTimer(timer);
       message= ":"+ String.valueOf(timer);
       choice = -100;
     }
    println(timer);
  }
  else {    // if stop = true , resume stored the value of current time
   
    resume = timer;
    
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
   
   if (mouseX>710 && mouseX<810 && mouseY > 505 && mouseY< 555){        //defrost
    choice =14;
    tts.speak("2 minutes started for defrost");
   }
   if (mouseX>830 && mouseX<930 && mouseY > 505 && mouseY< 555){    //pizza
    choice =15;
    tts.speak("2 minutes started for Pizza");
    }
   if (mouseX>950 && mouseX<1050 && mouseY > 505 && mouseY< 555){   //vent fan
    choice =16;
    tts.speak("vent fan started");
   }
   if (mouseX>710 && mouseX<810 && mouseY > 575 && mouseY< 625){
    choice =17;
    tts.speak("Operation Resumed");
   
   }
   
   if (mouseX>830 && mouseX<930 && mouseY > 550 && mouseY< 650){     //stop button
    choice =18;
    tts.speak("Operation stopped");
   }
   if (mouseX>770 && mouseX<830 && mouseY > 380 && mouseY< 420){        //clear button
    choice =19;
   }
   
   if (mouseX > 910 && mouseX < 970 && mouseY > 380 && mouseY <420){
     choice =20;
     tts.speak("Timer started for 30 seconds");
     }
     if (mouseX > 710 && mouseX < 750 && mouseY > 230 && mouseY <270){
     choice = 21;
     open ^= true;
     
     if( open == true){ 
         tts.speak("Power on");
      } else{
         tts.speak("power off");
      }
     
 }
 }
   
 //Function for timer 
 int startTimer(int t){
   if ( s > k){
     t= t-1;
   }
   else{
     
     message = "START";
 }
 k=s;
 return t;
 }
 
 
