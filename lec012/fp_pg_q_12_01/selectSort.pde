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
        if(this.data[j] < min){
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
