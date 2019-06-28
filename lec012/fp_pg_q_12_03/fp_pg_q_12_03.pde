// 問題 12.3 データ {5, 8, 1, 10, 3} を挿入整列で降順に整列せよ．
private int[] data = {5, 8, 1, 10, 3};
//private int[] data =  {3, 2, 0, 5, 8, 3, 4, 1, 3, 2};
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

class inSort{
  private int[] data;
  private int len = 0;

  inSort(int[] data){
    this.data = data;
    this.len = this.data.length;
  }

  public int[] sort(){
    int tmp = 0;
    int cnt = 0;
    for(int i = 1; i < this.len; i++){
      tmp = data[i];
      if(data[i - 1] < tmp){
        data[i] = data[i - 1];
        data[i - 1] = tmp;
        for (int j = i; 0 < j; j--){
          if(data[j - 1] < tmp){
            data[j] = tmp;
            data[j] = data[j - 1];
            data[j - 1] = tmp;
          }
        }
      }
    }
    return this.data;
  }
}
