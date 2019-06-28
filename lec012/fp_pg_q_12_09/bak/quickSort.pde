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
