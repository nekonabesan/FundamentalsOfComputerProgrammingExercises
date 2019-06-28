// 問題 12.5 データ {3, 2, 0, 5, 8, 3, 4, 1, 3, 2} をマージソートで降順に整列せよ．
private int[] data = {3, 2, 0, 5, 8, 3, 4, 1, 3, 2};
private int[] result;
private margeSort mysort = null;

public void setup(){
  size(400, 200);
  //textFont(createFont("TempusSansITC-16", 24));
  background(255);
  fill(0);

  showData("** Original Data Sequence **", this.data, 20, 20);
  this.mysort = new margeSort(data);
  this.result = this.mysort.sort();
  showData("** Sorted Data Sequence **", this.result, 20, 80);
}

public void showData(String t, int[] d, int x, int y){
  text(t, x, y);
  for(int i = 0; i < d.length; i++)
  text(d[i], 30 * (i + 2), y + 20);
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
