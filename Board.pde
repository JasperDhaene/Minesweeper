public class Board
{
  
  private int col, row;
  private int board [][];
  private int boardState [][];
  private float startX,startY;
  private int imgWidth,imgHeight;
  private PImage[] imageArray;
   
  private int gap,mineNumberGap;
  
  private static final int EMPTY = 0;
  private static final int BLOCK = 9;
  private static final int MINE = 10;
  private static final int FLAG = 11;
  private static final int FLAGGEDMINE = 12;
  
  private static final int FREE = 0;
  private static final int CLICKING = 1;
  private static final int CLICKED = 2;
  private static final int FLAGGING = 3;
  private static final int FLAGGED = 4;
  
  private int clickingX,clickingY;
  
  private int flagsLeft;
  private int amountOfMines;

  public Board() {
    
    imageArray = new PImage[]{IEmpty,null,null,null,null,null,null,null,null,IBlock,IMine,IFlag,null};
    
    col = 16;
    row = 16;
    board = new int[col][row];
    boardState = new int[col][row];
    
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        boardState[i][j] = FREE;
      }
    }

    startX = 30;
    startY = 194;
    imgWidth = 30;
    imgHeight = 30;
    gap = 2;
    mineNumberGap = 4;
    clickingX = -1;
    clickingY = -1;
    flagsLeft = 5;
    amountOfMines = 20;
    
    generateBoard();
  }
  
  public void render() {
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        switch(boardState[i][j]){
          case FREE: image(IBlock, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case CLICKING: image(IEmpty, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case CLICKED: 
            if(board[i][j] > 0 && board[i][j] < 9) {
              int number = board[i][j] - 1;
              image(IMineNumbers, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight, number * (imgWidth + mineNumberGap),0, (number * (imgWidth+mineNumberGap)) + imgWidth , imgHeight ); 
            } else {
              println(board[i][j]);
              image(imageArray[board[i][j]], startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight);
            } break;  
          case FLAGGING: image(IFlag, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case FLAGGED: image(IFlag, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
        }
      }
    }
  }
  
  public void generateBoard() {
    int minesLeft = amountOfMines;
    
    //init empty board
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        board[i][j] = EMPTY;
      }
    }
    
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        if( random(0, 10) > 8 && minesLeft > 0){
         minesLeft --; 
         board[i][j] = MINE;
         //println(i + " " + j);
         
         for( int k = -1; k<2;k++){
          for(int l = -1;l<2;l++){
           try {
             if(board[i+k][j+l] != MINE){
               board[i+k][j+l]++;
             }
           }catch (ArrayIndexOutOfBoundsException ex){}
          }
         }
        }
      }
    }
    
  }
  
  public void clicking(int x,int y){
    boardState[x][y] = CLICKING;
    clickingX = x;
    clickingY = y;
  }
  
  public void clicked(){
    if(isValidClick(clickingX,clickingY)){
      boardState[clickingX][clickingY] = CLICKED;
    }
  }
  
  public void flagging(int x,int y){
    boardState[x][y] = FLAGGING;
    clickingX = x;
    clickingY = y;
  }
  
  public void flagged(){
    boardState[clickingX][clickingY] = FLAGGED;
    flagsLeft--;
  }
  
  public void unflag(){
   boardState[clickingX][clickingY] = FREE; 
  }
  
  public int getCol(){
    return col;
  }
  
  public int getRow() {
    return row;
  }
  
  public float getStartX(){
    return startX;
  }
  
  public float getStartY() {
   return startY; 
  }
  
  public int getFlagsLeft() {
   return flagsLeft; 
  }
  
  public boolean isValidClick(int x,int y){
    return x >= 0 && x < col && y >=0 && y < row; 
  }
  
  /*
  private int checkForMines(int x,int y) {
    int mineCount = 0;
    //RIGHT
    if(x >= 0 && x < col-1){
      mineCount += board[x+1][y] == MINE ? 1 : 0;
    }
    //LEFT
    if(x > 0 && x < col){
      mineCount += board[x-1][y] == MINE ? 1 : 0;
    }
    
    //DOWN
    if(y >= 0 && y < row-1){
      mineCount += board[x][y+1] == MINE ? 1 : 0;
    }
    //UP
    if(x > 0 && y < row-1){
      mineCount += board[x][y-1] == MINE ? 1 : 0;
    }
    
    //UPPERLEFT
    if(x > 0 && y > 0 && x < col && y < row){
      mineCount += board[x-1][y-1] == MINE ? 1 : 0;
    }
    //UPPERRIGHT
    if(x >= 0 && y > 0 && x < col-1 && y < row-1){
      mineCount += board[x-1][y-1] == MINE ? 1 : 0;
    }
    
    return mineCount;
  }
*/  
}