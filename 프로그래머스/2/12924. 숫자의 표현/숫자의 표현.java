class Solution {
  public int solution(int n) {
      int answer = 0;
      int temp = 0;
      int count = 0;
      for(int i = 1; i<= n/2 ;i++){
          temp = i;
          for(int j = i+1; j <= n/2 +1 ; j++){
              temp = temp + j;
              if (temp ==n){
                  count ++;
                  break;
              }
              else if(temp > n){
                 break;
              }
          }
      }
      return count+1;
  }
}