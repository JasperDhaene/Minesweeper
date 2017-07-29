PImage IBackground,IBlock,IEmpty,IFlag,IMine,INumbers,IMineNumbers,IQuestion,IQuestion_pressed,IState_BAMF,IState_GAMEOVER; 
HUD hud;
Board board;
int state;

public static final int STATE_NORMAL = 0;
public static final int STATE_GAMEOVER = 1;

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
  IState_GAMEOVER = loadImage("state_dead.png");
  IMineNumbers = loadImage("mineNumbers.png");
  hud = new HUD();
  board = new Board();
  state = STATE_NORMAL;
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

void gameOver() {
  state = STATE_GAMEOVER;
}