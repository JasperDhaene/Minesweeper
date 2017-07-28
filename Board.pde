public class Board
{
  
  private int col, row;
  private int board [][];
  private float startX,startY;
  private int imgWidth,imgHeight;
  private PImage[] imageArray;
   
  private int gap;
  
  private static final int BLOCK = 10;
  private static final int BOMB = 11;
  private static final int FLAG = 12;
  private static final int FLAGBOMB = 13;

  //String[] list = split(board,';');

  public Board() {
    
    imageArray = new PImage[]{IEmpty,null,null,null,null,null,null,null,null,null,IBlock,null,null,null};
    
    col = 16;
    row = 16;
    board = new int[col][row];
    
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        board[i][j] = BLOCK;
      }
    }
    
    board[0][0] = 0;
    board[0][1] = 0;
    board[1][0] = 0;
    
    startX = 32;
    startY = 194;
    imgWidth = 30;
    imgHeight = 30;
    gap = 2;
  }
  
  public void render() {
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        image(imageArray[board[i][j]], startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight);
      }
    }
  }
  
}