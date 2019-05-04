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
        if(this.data[j] < this.data[j - 1]){
          tmp = this.data[j];
          this.data[j] = this.data[j - 1];
          this.data[j - 1] = tmp;
        }
      }
    }
    return this.data;
  }
}
