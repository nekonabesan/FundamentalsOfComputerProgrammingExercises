// 問題 12.7 データ数が 50, 000 個の時，各整列アルゴリズムを 20 回実行した平均処理時間を表示するプログラムを作成せよ．
// ただし，各アルゴリズムで整列するデータは同じデータを利用し，試行毎に新しくデータを作成すること．
private final int SELECTION = 0;
private final int BUBBLE = 1;
private final int INSERTION = 2;
private final int QUICK = 3;
private final int MERGE = 4;
private int[] result;
private int[] data;
private int[] selection = new int[20];
private int[] babble = new int[20];
private int[] insertion = new int[20];
private int[] quick = new int[20];
private int[] merge = new int[20];
private selectSort selectSort = null;
private babbleSort babbleSort = null;
private inSort inSort = null;
private quickSort quickSort = null;
private margeSort margeSort = null;

public void setup(){
  int isort = 0;
  int ssort = 0;
  int bsort = 0;
  int qsort = 0;
  int msort = 0;
  size(400, 200);
  for (int i = 0; i < 20; i++) {
    this.data = createArray(50000);
    this.insertion[i] = this.measureLap(INSERTION, this.data);
    this.selection[i] = this.measureLap(SELECTION, this.data);
    this.babble[i] = this.measureLap(BUBBLE, this.data);
    this.quick[i] = this.measureLap(QUICK, this.data);
    this.merge[i] = this.measureLap(MERGE, this.data);
  }
  for(int i = 0; i < 20; i++){
    isort += this.insertion[i];
    ssort += this.selection[i];
    bsort += this.babble[i];
    qsort += this.quick[i];
    msort += this.merge[i];
  }
  println("insertion : " + nf(isort/20));
  println("selection : " + nf(ssort/20));
  println("bubble    : " + nf(bsort/20));
  println("quick     : " + nf(qsort/20));
  println("merge     : " + nf(msort/20));
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
