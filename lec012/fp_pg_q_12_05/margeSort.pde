class margeSort {
  private int[] data;
  private int[] result;
  private int len = 0;

  margeSort(int[] data){
    this.data = data;
    this.len = data.length;
    this.result = new int[this.len];
  }

  public int[] sort(){
    int i = len/2;
    int j = len - i;
    this.mSort(i, j, this.data);
    return this.result;
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
    }
  }

  private void marge(int[] a, int[] b){
    int i = 0;
    int j = 0;
    //println(a.length);
    while(true){
      if(a.length <= i || b.length <= j){
        break;
      }
      if(a[i] < b[j]) {
        this.result[i + j] = a[i];
        i++;
      } else {
      	this.result[i + j] = b[j];
      	j++;
      }
    }
  }

  /*private void mSort(int i, int j, int[] d){
    int n = j - i + 1;

    if(n > 1){
      int mid = i + (n - 1) / 2;
      this.mSort(i, mid, d);
      this.mSort(mid + 1, j, d);
      int n1 = mid - i + 1;
      int[] a1 = new int[n1];
      for(int k = i; k <= mid; k++) a1[k - i] = d[k];
      int n2 = j - mid;
      int[] a2 = new int[n2];
      for(int k = mid + 1; k <= j; k++) a2[k - mid - 1] = d[k];
      this.merge(a1, n1, a2, n2, i, d);
    }
  }

  private void merge(int[] a1, int n1, int[] a2, int n2, int i, int[] d){
    int k = 0, l = 0, m = 0;
    while(m <= n1 + n2 - 1){
      if(k >= n1) d[i + m] = a2[l++];
      else if(l >= n2) d[i + m] = a1[k++];
      else if(a1[k] <= a2[l]) d[i + m] = a1[k++];
      else d[i + m] = a2[l++];
      m++;
    }
  }*/
}
