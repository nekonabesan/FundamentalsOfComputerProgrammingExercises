// 問題 12.4 データ {3, 2, 0, 5, 8, 3, 4, 1, 3, 2} をクイックソートで降順に整列せよ．
private int[] data = {3, 2, 0, 5, 8, 3, 4, 1, 3, 2};
private int[] result;
private quickSort mysort = null;

public void setup(){
  size(400, 200);
  //textFont(createFont("TempusSansITC-16", 24));
  background(255);
  fill(0);

  showData("** Original Data Sequence **", this.data, 20, 20);
  this.mysort = new quickSort(data);
  this.result = this.mysort.sort();
  showData("** Sorted Data Sequence **", this.result, 20, 80);
}

public void showData(String t, int[] d, int x, int y){
  text(t, x, y);
  for(int i = 0; i < d.length; i++)
  text(d[i], 30 * (i + 2), y + 20);
}
