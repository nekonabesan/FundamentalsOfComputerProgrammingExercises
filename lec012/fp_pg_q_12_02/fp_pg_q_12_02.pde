// 問題 12.2 データ {5, 8, 1, 10, 3} をバブルソートで降順に整列せよ．
private int[] data = {5, 8, 1, 10, 3};
private int[] result;
private babbleSort mysort = null;

public void setup(){
  size(400, 120);
  textFont(createFont("TempusSansITC-16", 24));
  background(255);
  fill(0);

  showData("** Original Data Sequence **", this.data, 20, 20);
  this.mysort = new babbleSort(data);
  this.result = this.mysort.sort();
  showData("** Sorted Data Sequence **", this.result, 20, 80);
}

public void showData(String t, int[] d, int x, int y){
  text(t, x, y);
  for(int i = 0; i < d.length; i++)
  text(d[i], 30 * (i + 2), y + 20);
}

class babbleSort{
  private int[] data;
  private int len = 0;

  babbleSort(int[] data){
    this.data = data;
    this.len = this.data.length;
  }

  public int[] sort(){
    int tmp = 0;
    int cnt = 0;
    for(int i = 0; i < this.len; i++){
      for(int j = 1; j < this.len; j++){
        if(this.data[j] > this.data[j - 1]){
          tmp = this.data[j];
          this.data[j] = this.data[j - 1];
          this.data[j - 1] = tmp;
        }
      }
    }
    return this.data;
  }
}
