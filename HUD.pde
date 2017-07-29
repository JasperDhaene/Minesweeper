class HUD {
 private int timer;
 private int clock;
 
 private float startXFlagsLeft,startYFlagsLeft,startXState,startYState,startXTimer,startYTimer;
 private int numberWidth,numberHeight,stateWidth,stateHeight;
 private int gap;
 
 private boolean showClock;
 
 HUD() {
   timer = 0;
   clock = 0;
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
   showClock = true;
 }
 
 public void timerIncr(){
   
   if(state == STATE_NORMAL && clock > 999){
       gameOver(); 
     }
   else {
     timer++;
     if(state == STATE_NORMAL && timer > 60){  
       clock++;
       timer = 0;
     }
     if(state == STATE_GAMEOVER && timer > 30){
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
   if(state == STATE_NORMAL) {
     image(IState_BAMF, startXState,startYState,stateWidth,stateHeight);
   }else {
     image(IState_GAMEOVER, startXState,startYState,stateWidth,stateHeight);
   }
   
   
   
   //CLOCK
   if(state == STATE_NORMAL && showClock){
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
 
 public float getStartXState(){
   return startXState;
 }
 public float getStartYState(){
   return startYState;
 }
 public int getStateWidth(){
   return stateWidth;
 }
 public int getStateHeight(){
   return stateHeight;
 }
  
  
}