//
//private int[] data = {3, 2, 0, 5, 8, 3, 4, 1, 3, 2};
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
    int line[] = int(split(val, " "));
    for(int i = 0; i < line.length; i++){
      this.data = append(this.data, line[i]);
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
