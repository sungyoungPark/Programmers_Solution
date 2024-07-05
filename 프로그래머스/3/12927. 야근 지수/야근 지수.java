import java.util.*;
import java.io.*;
class Solution {
         public static long solution(int n, int[] works) {
        long answer = 0;
        PriorityQueue<Integer> queue = new PriorityQueue<>(Collections.reverseOrder());

        for(int i= 0;i<works.length;i++){
            queue.offer(works[i]);
        }

        for(int i=0;i<n;i++){
            int k = queue.poll();
            if(k== 0){
                return 0;
            }
            k--;
            //System.out.print(k+ " ");
            queue.offer(k);
        }

        while (queue.isEmpty() ==false){
            answer = answer + (int)Math.pow(queue.poll(),2);
        }
        return answer;
    }
}