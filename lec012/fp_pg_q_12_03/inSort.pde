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
      if(data[i - 1] > tmp){
        data[i] = data[i - 1];
        data[i - 1] = tmp;
        for (int j = i; 0 < j; j--){
          if(data[j - 1] > tmp){
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
