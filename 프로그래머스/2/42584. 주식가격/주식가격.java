class Solution {
    public int[] solution(int[] prices) {
       	int[] output = new int[prices.length];
		 	for(int i=0 ; i<prices.length ; i++) {
		 		for(int j=i+1 ; j<prices.length; j++) {
		 			if(prices[i]>prices[j])
		 			{
		 				output[i] = j - i;
		 				break;
		 			}
		 			if(j == prices.length-1) {
		 				output[i]= j-i;
		 			}
		 		}

		 	}
		 	
	        return output;
    }
}