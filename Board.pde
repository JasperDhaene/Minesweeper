public class Board
{
  
  private int col, row;
  private int board [][];
  private float startX,startY;
  private int imgWidth,imgHeight;
   
  private int gap;

  //String[] list = split(board,';');

  public Board() {
    col = 16;
    row = 16;
    board = new int[col][row];
    startX = 32;
    startY = 194;
    imgWidth = 30;
    imgHeight = 30;
    gap = 2;
  }
  
  public void render() {
    for( int i = 0; i< col; i++) {
      for( int j = 0; j< row; j++) {
        image(Iblock, startX + i * (imgWidth + gap),startY + j * (imgHeight + gap),imgWidth,imgHeight);
      }
    }
  }
  
}