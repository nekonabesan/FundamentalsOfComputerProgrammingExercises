// 問題 12.3 データ {5, 8, 1, 10, 3} を挿入整列で降順に整列せよ．
private int[] data = {5, 8, 1, 10, 3};
private int[] result;
private inSort mysort = null;

public void setup(){
  size(400, 200);
  textFont(createFont("TempusSansITC-16", 24));
  background(255);
  fill(0);

  showData("** Original Data Sequence **", this.data, 20, 20);
  this.mysort = new inSort(data);
  this.result = this.mysort.sort();
  showData("** Sorted Data Sequence **", this.result, 20, 80);
}

public void showData(String t, int[] d, int x, int y){
  text(t, x, y);
  for(int i = 0; i < d.length; i++)
  text(d[i], 30 * (i + 2), y + 20);
}
