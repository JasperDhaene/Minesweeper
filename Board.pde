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
  private static final int BOMB = 11;
  private static final int FLAG = 12;
  private static final int FLAGBOMB = 13;
  
  private static final int FREE = 0;
  private static final int CLICKING = 1;
  private static final int CLICKED = 2;
  
  private int clickingX,clickingY;

  public Board() {
    
    imageArray = new PImage[]{IEmpty,null,null,null,null,null,null,null,null,null,IBlock,null,null,null};
    
    col = 16;
    row = 16;
    board = new int[col][row];
    boardState = new int[col][row];
    
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        board[i][j] = 0;
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
  }
  
  public void render() {
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        switch(boardState[i][j]){
          case FREE: image(IBlock, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case CLICKING: image(IEmpty, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
          case CLICKED: image(imageArray[board[i][j]], startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight); break;  
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
  
}