// 問題 12.1 データ {5, 8, 1, 10, 3} を選択整列で降順に整列せよ．
private int[] data = {5, 8, 1, 10, 3};
private int[] result;
private selectSort mysort = null;

public void setup(){
  size(400, 120);
  textFont(createFont("TempusSansITC-16", 24));
  background(255);
  fill(0);

  showData("** Original Data Sequence **", this.data, 20, 20);
  this.mysort = new selectSort(data);
  this.result = this.mysort.sort();
  showData("** Sorted Data Sequence **", this.result, 20, 80);
}

public void showData(String t, int[] d, int x, int y){
  text(t, x, y);
  for(int i = 0; i < d.length; i++)
  text(d[i], 30 * (i + 2), y + 20);
}

class selectSort{
  private int[] data;
  private int len = 0;

  selectSort(int[] data){
    this.data = data;
    this.len = this.data.length;
  }

  public int[] sort(){
    int min = 0;
    int cnt = 0;
    for(int i = 0; i < this.data.length; i++){
      cnt = i;
      min = this.data[i];
      for(int j = i; j < this.data.length; j++){
        if(this.data[j] > min){
          min = this.data[j];
          cnt = j;
        }
      }
      if(cnt != i){
        this.data[cnt] = this.data[i];
        this.data[i] = min;
      }
    }
    return this.data;
  }
}
