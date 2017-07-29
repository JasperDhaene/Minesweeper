public class Board
{
  
  private int col, row;
  private int board [][];
  private int boardState [][];
  private float startX,startY;
  private int imgWidth,imgHeight;
  private PImage[] imageArray;
   
  private int gap;
  
  private static final int BLOCK = 10;
  private static final int MINE = 11;
  private static final int FLAG = 12;
  private static final int FLAGGEDMINE = 13;
  
  private static final int FREE = 0;
  private static final int CLICKING = 1;
  private static final int CLICKED = 2;
  private static final int FLAGGING = 3;
  private static final int FLAGGED = 4;
  
  private int clickingX,clickingY;
  
  private int flagsLeft;

  public Board() {
    
    imageArray = new PImage[]{IEmpty,null,null,null,null,null,null,null,null,null,IBlock,IMine,IFlag,null};
    
    col = 16;
    row = 16;
    board = new int[col][row];
    boardState = new int[col][row];
    
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        board[i][j] = MINE;
        boardState[i][j] = FREE;
      }
    }
    
    board[0][0] = 0;
    board[0][1] = 0;
    board[1][0] = 0;
    
    startX = 30;
    startY = 194;
    imgWidth = 30;
    imgHeight = 30;
    gap = 2;
    clickingX = -1;
    clickingY = -1;
    flagsLeft = 10;
  }
  
  public void render() {
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        switch(boardState[i][j]){
          case FREE: image(IBlock, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case CLICKING: image(IEmpty, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case CLICKED: image(imageArray[board[i][j]], startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case FLAGGING: image(IFlag, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case FLAGGED: image(IFlag, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
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
    boardState[clickingX][clickingY] = CLICKED;
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
  
}