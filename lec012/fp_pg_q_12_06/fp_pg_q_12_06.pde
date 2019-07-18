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
private String[] name = {"SELECTION", "BUBBLE", "INSERTION", "QUICK", "MERGE"};
private String resultScore;
private int totalScore = 0;

public void setup(){
  noLoop();
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

void draw(){
  this.write();
}

private void prontLap(int dataLen){
  int score = 0;
  this.data = createArray(dataLen);
  // INSERTION
  score = this.measureLap(INSERTION, this.data);
  println("insertion(" + dataLen + ") : " + nf(score));
  resultScore += this.name[INSERTION] + "\t(" + dataLen + ")" + "\t" + str(score) + " ms\n";
  this.totalScore += score;
  // SELECTION
  score = this.measureLap(SELECTION, this.data);
  println("selection(" + dataLen + ") : " + nf(score));
  resultScore += this.name[SELECTION] + "\t(" + dataLen + ")" + "\t" + str(score) + " ms\n";
  this.totalScore += score;
  // BUBBLE
  score = this.measureLap(BUBBLE, this.data);
  println("bubble   (" + dataLen + ") : " + nf(score));
  resultScore += this.name[BUBBLE] + "\t(" + dataLen + ")" + "\t" + str(score) + " ms\n";
  this.totalScore += score;
  // QUICK
  score = this.measureLap(QUICK, this.data);
  println("quick    (" + dataLen + ") : " + nf(score));
  resultScore += this.name[QUICK] + "\t(" + dataLen + ")" + "\t" + str(score) + " ms\n";
  this.totalScore += score;
  // MERGE
  score = this.measureLap(MERGE, this.data);
  println("merge    (" + dataLen + ") : " + nf(score));
  resultScore += this.name[MERGE] + "\t(" + dataLen + ")" + "\t" + str(score) + " ms \n";
  this.totalScore += score;
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

private void write(){
  resultScore += "total lap :" + this.totalScore + "ms\n";
  PrintWriter output = createWriter("sort_" + str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second()) + ".txt");
  output.println(this.resultScore);
  output.flush();
  output.close();
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

class margeSort {
  private int[] data;

  margeSort(int[] data){
    this.data = data;
  }

  public int[] sort(){
    this.mSort(this.data);
    return this.data;
  }

  private void mSort(int[] array){
    int i = array.length / 2;
    int j = array.length - i;
    int[] a = new int[i];
    int[] b = new int[j];
    if(1 < array.length){
      for(int k = 0; k < i; k++){
        a[k] = array[k];
      }
      for(int k = 0; k < j; k++){
        b[k] = array[i + k];
      }
      this.mSort(a);
      this.mSort(b);
      this.merge(a, b, array);
    }
  }

  private void merge(int[] a, int[] b, int[] array){
    int i = 0;
    int j = 0;
    while(true){
      if(a.length <= i && b.length <= j){
        break;
      }
      if(b.length <= j){
        array[i + j] = a[i];
      	i++;
      } else if(i < a.length) {
        if(a[i] > b[j]){
          array[i + j] = a[i];
        	i++;
        } else {
          array[i + j] = b[j];
        	j++;
        }
      } else {
        array[i + j] = b[j];
        j++;
      }
    }
  }
}

class quickSort{
  private int[] data;
  private int len = 0;

  quickSort(int[] data){
    this.data = data;
    this.len = data.length;
  }

  public int[] sort(){
    return this.qsort(this.data, 0, (this.len - 1));
  }

  private int[] qsort(int[] a, int left, int right){
    if (left < right) {
      int i = left;
      int j = right;
      int c = int(random(1, (this.len - 1)));
      int pivot = mod(a[i], a[c], a[j]);
      int tmp;
      while (true) {
        while (a[i] < pivot) {
          i++;
        }
        while (pivot < a[j]) {
          j--;
        }
        if (i >= j) {
          break;
        }
        tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
        i++;
        j--;
      }
      this.qsort(a, left, i - 1);
      this.qsort(a, j + 1, right);
    }
    return a;
  }

  private int mod(int x, int y, int z){
    int result = 0;
    if (x < y) {
      if (y < z) {
        result =  y;
      } else if (z < x) {
        result = x;
      } else {
        result = z;
      }
    } else {
      if (z < y) {
        result = y;
      } else if (x < z) {
        result = x;
      } else {
        result = z;
      }
    }
    return result;
  }

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
