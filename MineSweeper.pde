PImage Ibackground,Iblock,Iempty,Iflag,Imine,Inumbers,Iquestion,Iquestion_pressed; 
HUD hud;
Board board;

void setup()
{
  size(564, 726);
  Ibackground = loadImage("background.jpg");
  Iblock = loadImage("block.png");
  Iempty = loadImage("empty.png");
  Iflag = loadImage("flag.png");
  Imine = loadImage("mine.png");
  Inumbers = loadImage("numbers.png");
  Iquestion = loadImage("question.png");
  Iquestion_pressed = loadImage("question_pressed.png");
  hud = new HUD();
  board = new Board();
  
}



void draw() 
{
  background(Ibackground);
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