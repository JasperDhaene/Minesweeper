PImage IBackground,IBlock,IEmpty,IFlag,IMine,INumbers,IQuestion,IQuestion_pressed; 
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
    if(indexX >= 0 && indexX <= board.getCol() && indexY >=0 && indexY <= board.getRow()){
      board.clicking(indexX,indexY);  
    }
  }
}

void mouseReleased(){
  board.clicked();
}