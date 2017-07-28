class HUD {
 private int timer;
 private int clock;
 
 private float startX,startY;
 private int numberWidth,numberHeight;
 private int gap;
 
 private boolean gameOver,showClock;
 
 HUD() {
   timer = 0;
   clock = 997;
   startX = 32;
   startY = 112;
   numberWidth = 26;
   numberHeight = 45;
   gap = 2;
   gameOver = false;
   showClock = true;
 }
 
 public void timerIncr(){
   
   if(!gameOver && clock > 999){
       hud.gameOver(); 
     }
   else {
     timer++;
     if(!gameOver && timer > 60){
       
       clock++;
       timer = 0;
     }
     if(gameOver && timer > 30){
      showClock = showClock ? false: true; 
      timer = 0;
     }
   }
 }
 
 public void render(){
   if(!gameOver && showClock){
     String stringNum  = nf(clock,3);
     for(int i = 0;i < 3; i++){
       int num = int(stringNum.charAt(i)-48);
       image(Inumbers, startX+(i*numberWidth),startY,numberWidth,numberHeight,num *(numberWidth+gap),0,num *(numberWidth+gap)+numberWidth,numberHeight);
     }
   }else{
     if(showClock) {
       for(int i = 0;i < 3; i++){
         int num = 9;
         image(Inumbers, startX+(i*numberWidth),startY,numberWidth,numberHeight,num *(numberWidth+gap),0,num *(numberWidth+gap)+numberWidth,numberHeight);
       }
     }
   }

 }
 
 public int getClock() {
   return clock;
 }
 
 public void gameOver(){
   gameOver = true;
 }
  
  
}