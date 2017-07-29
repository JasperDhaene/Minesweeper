class HUD {
 private int timer;
 private int clock;
 
 private float startXFlagsLeft,startYFlagsLeft,startXState,startYState,startXTimer,startYTimer;
 private int numberWidth,numberHeight,stateWidth,stateHeight;
 private int gap;
 
 private boolean gameOver,showClock;
 
 HUD() {
   timer = 0;
   clock = 997;
   startXFlagsLeft = 32;
   startYFlagsLeft = 112;
   startXState = 260;
   startYState = 112;
   startXTimer = 448;
   startYTimer = 112;
   numberWidth = 26;
   numberHeight = 45;
   stateWidth = 50;
   stateHeight = 50;
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
   //FLAGS LEFT
   String stringNum  = nf(board.getFlagsLeft(),3);
   for(int i = 0;i < 3; i++){
         int num = int(stringNum.charAt(i)-48);
         image(INumbers, startXFlagsLeft+(i*numberWidth),startYFlagsLeft,numberWidth,numberHeight,num *(numberWidth+gap),0,num *(numberWidth+gap)+numberWidth,numberHeight);
   }
   
   //STATE
   image(IState_BAMF, startXState,startYState,stateWidth,stateHeight);
   
   
   
   //CLOCK
   if(!gameOver && showClock){
     stringNum  = nf(clock,3);
     for(int i = 0;i < 3; i++){
       int num = int(stringNum.charAt(i)-48);
       image(INumbers, startXTimer+(i*numberWidth),startYTimer,numberWidth,numberHeight,num *(numberWidth+gap),0,num *(numberWidth+gap)+numberWidth,numberHeight);
     }
   }else{
     if(showClock) {
       for(int i = 0;i < 3; i++){
         int num = 9;
         image(INumbers, startXTimer+(i*numberWidth),startYTimer,numberWidth,numberHeight,num *(numberWidth+gap),0,num *(numberWidth+gap)+numberWidth,numberHeight);
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