
public class cal {
  public static int MAXNUM = 20;
  public static String[][] arr = new String[MAXNUM][MAXNUM]; 
 
  public static void main(String[] args) {
    cal a = new cal();
    for(int i=0; i< MAXNUM; i++) {
      for(int j=0; j< MAXNUM; j++) {
        arr[i][j] = "- ";
      }
    }
    int x1 = 3;
    int x2 = 15;
    int y1 = 9;
    int y2 = 1;
    a.calculate(x1,x2,y1,y2);
    for(int i=0; i< MAXNUM; i++) {
      for(int j=0; j< MAXNUM; j++) {
        System.out.print(arr[i][j]);
      }
      System.out.println();
    }
  }
  void calc(int x1, int x2,int y1, int y2){

  }
  void calculate(int x1, int x2,int y1, int y2){
    double a = (double)(y1-y2)/(x1-x2);
    int j = 0;
    for (int i = x1; i <= x2; i++){
      int b = (int) (y1 + Math.round(a*j));
      arr[b][i] = "* ";
      j++;
    }
  }
}