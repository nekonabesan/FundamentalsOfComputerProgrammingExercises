// 問題 12.9 下記に示す scores.txt からデータを読み込み，第 2 項の数値に着目し，昇順に整列して表示せよ．
private int[] data = new int[0];
private int[] result;
private quickSort mysort = null;

public void setup(){
  size(400, 200);
  //textFont(createFont("TempusSansITC-16", 24));
  background(255);
  fill(0);
  this.getData("scores.txt");
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

private void getData(String filename){
  String lines[];
  lines = loadStrings(filename);
  for(String val:lines){
    println(val);
    String line[] = split(val, ",");
    this.data = append(this.data, int(line[1]));
  }
}
