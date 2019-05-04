class quickSort{
  private int[] data;
  private int len = 0;

  quickSort(int[] data){
    this.data = data;
    this.len = data.length;
  }

  public int[] sort(){
    return this.qsort(this.data, 0, this.len);
  }

  private int[] qsort(int[] a, int left, int right){
    if (left < right) {
      int i = left;
      int j = right;
      int pivot = mod(a[i], a[i + (j - i) / 2], a[j]); /* (i+j)/2 ではオーバーフローしてしまう */
      //int pivot = this.len/2;
      int tmp;
      while (true) { /* a[] を pivot 以上と以下の集まりに分割する */
        while (a[i] < pivot) {
          i++; /* a[i] >= pivot となる位置を検索 */
        }
        while (pivot < a[j]) {
          j--; /* a[j] <= pivot となる位置を検索 */
        }
        if (i >= j) {
          break;
        }
        tmp = a[i];
        a[i] = a[j];
        a[j] = tmp; /* a[i], a[j] を交換 */
        i++;
        j--;
      }
      this.qsort(a, left, i - 1);  /* 分割した左を再帰的にソート */
      this.qsort(a, j + 1, right); /* 分割した右を再帰的にソート */
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
