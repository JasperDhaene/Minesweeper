PImage IBackground,IBlock,IEmpty,IFlag,IMine,INumbers,IQuestion,IQuestion_pressed,IState_BAMF; 
HUD hud;
Board board;

void setup()
{
  size(564, 726);
  IBackground = loadImage("background.jpg");
  IBlock = loadImage("block.png");
  IEmpty = loadImage("empty.png");
  IFlag = loadImage("flag.png");
  IMine = loadImage("mine.png");
  INumbers = loadImage("numbers.png");
  IQuestion = loadImage("question.png");
  IQuestion_pressed = loadImage("question_pressed.png");
  IState_BAMF = loadImage("state_BAMF.png");
  hud = new HUD();
  board = new Board();
  
}



void draw() 
{
  background(IBackground);
  update();
  render();
  
}

void update() {
 hud.timerIncr(); 
}

void render() {
 hud.render(); 
 board.render();
}

void mousePressed(){
  if (mouseButton == LEFT) {
    int indexX = floor((mouseX-board.getStartX()) / 32);
    int indexY = floor((mouseY-board.getStartY()) / 32);
    //println("mouseX: " + mouseX + ", mouseY: " + mouseY);
    //println("x: " + indexX + ", y: " + indexY);
    if(board.isValidClick(indexX,indexY)){
      board.clicking(indexX,indexY);  
    }
  }
  if (mouseButton == RIGHT) {
    int indexX = floor((mouseX-board.getStartX()) / 32);
    int indexY = floor((mouseY-board.getStartY()) / 32);
    //println("mouseX: " + mouseX + ", mouseY: " + mouseY);
    //println("x: " + indexX + ", y: " + indexY);
    if(board.isValidClick(indexX,indexY)){
      board.flagging(indexX,indexY); 
    }
  }
}

void mouseReleased(){
  if(mouseButton == LEFT){
    board.clicked(); 
  }
  if(mouseButton == RIGHT && board.getFlagsLeft() > 0){
    board.flagged();
  }
  if(mouseButton == RIGHT && board.getFlagsLeft() == 0){
   board.unflag(); 
  }
  
}