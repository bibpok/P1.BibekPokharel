 Timer timer;
Button btn;


void setup(){
 size(1200,1200);
 frameRate(60);
 timer = new Timer(1);
 
    
  
}


//String t = ""; 
color outerLayer = color(0,0,0);
color door = color(50);
color window = color(124, 99, 99);
color switchMenue = color (87);

//boolean temp = false;
int value = 50;
void draw(){
  fill(outerLayer);
  rect(100,80,1000,600);    //Outer layer of microwave
  fill(door);
  rect(150, 130, 500, 500);     // Door
  fill(window);
  rect(270, 250, 250, 250);     //window
  fill(switchMenue);
  rect(680, 130, 400, 500);      // Switches menue
  rect(700, 140, 200, 30,10);    // Shape for time
  rect(920, 140, 150, 30, 10);   // shape for date
  fill(0);
  rect(730, 180, 300, 30, 10);   // Shape for display
  
  // shape design for numbers
  
  fill(value);
  rect(765, 221, 210, 202, 10); //numbers boundry
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
 
   //Extra keys
  ellipse (760, 455, 100, 50);
  ellipse (880, 455, 100, 50);
  ellipse (1000, 455, 100, 50);
  
  ellipse (760, 530, 100, 50);
  ellipse (880, 530, 100, 50);
  ellipse (1000,530, 100, 50);
  
  
  ellipse (760, 600, 100, 50); //start button
  ellipse (880, 600, 100, 50); // stop button
  ellipse (1000, 600, 100, 50); 
  
  
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
  text("Clock",1000, 530);
  text("Start",760, 600);
  text("Stop",880, 600);
  text("Door",1000, 600);
  
  //Displaying Time and Date on the screen
  
  fill(70, 252, 10);
  text("Date -"+ day()+"/"+month()+"/"+year(), 800,152);
  text("Time -"+ hour()+":"+minute()+":"+second(),1000,152);
  
  //  Function
  // ellipse(800,250,60,40);
  
     Button btn1 = new Button(770, 830,230,270,20);
     //btn1.mouseClicked();
     btn1.function_of_button();
     
    
     
   Button btn2 = new Button(840, 900,230,270,10);
   btn2.mouseClicked();
   btn2.function_of_button();
   btn2.count(10);
     
  }
  
   
  
 
  
 
  
 
 
  
  
   
