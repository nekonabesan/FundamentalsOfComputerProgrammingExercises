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
        if(a[i] < b[j]){
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
