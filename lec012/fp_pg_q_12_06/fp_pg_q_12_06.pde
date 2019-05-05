// 問題 12.6 sortComp.pde を参考にして，データ数が 10, 000, 20, 000, · · · ,
// 90, 000 個の時の各整列アルゴリズムの処理時間を表示するプログラムを作成せよ．
// ただし，各アルゴリズムで整列するデータは同じデータを利用すること．
private final int SELECTION = 0;
private final int BUBBLE = 1;
private final int INSERTION = 2;
private final int QUICK = 3;
private final int MERGE = 4;
private int[] result;
private int[] data;
private selectSort selectSort = null;
private babbleSort babbleSort = null;
private inSort inSort = null;
private quickSort quickSort = null;
private margeSort margeSort = null;

public void setup(){
  size(400, 200);
  prontLap(10000);
  prontLap(20000);
  prontLap(30000);
  prontLap(40000);
  prontLap(50000);
  prontLap(60000);
  prontLap(70000);
  prontLap(80000);
  prontLap(90000);
}

private void prontLap(int dataLen){
  this.data = createArray(dataLen);
  println("insertion(" + dataLen + ") : " + nf(this.measureLap(INSERTION, this.data)));
  println("selection(" + dataLen + ") : " + nf(this.measureLap(SELECTION, this.data)));
  println("bubble   (" + dataLen + ") : " + nf(this.measureLap(BUBBLE, this.data)));
  println("quick    (" + dataLen + ") : " + nf(this.measureLap(QUICK, this.data)));
  println("merge    (" + dataLen + ") : " + nf(this.measureLap(MERGE, this.data)));
}

private int measureLap(int s, int[] data){
  int start = 0;
  int end = 0;
  int laps = 0;
  start = millis();
  switch(s){
    case SELECTION:
      this.selectSort = new selectSort(data);
      this.result = this.selectSort.sort();
      break;
    case BUBBLE:
      this.babbleSort = new babbleSort(data);
      this.result = this.babbleSort.sort();
      break;
    case INSERTION:
      this.inSort = new inSort(data);
      this.result = this.inSort.sort();
      break;
    case QUICK:
      this.quickSort = new quickSort(data);
      this.result = this.quickSort.sort();
      break;
    case MERGE:
      this.margeSort = new margeSort(data);
      this.result = this.margeSort.sort();
      break;
  }
  end = millis();
  return end - start;
}

private int[] createArray(int max){
  int result[] = new int[max];
  randomSeed(second());
  for(int i = 0; i < max; i++){
    result[i] = int(random(0, max));
  }
  return result;
}
