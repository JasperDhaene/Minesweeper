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