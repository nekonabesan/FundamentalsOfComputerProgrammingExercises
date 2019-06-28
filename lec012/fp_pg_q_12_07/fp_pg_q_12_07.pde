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
