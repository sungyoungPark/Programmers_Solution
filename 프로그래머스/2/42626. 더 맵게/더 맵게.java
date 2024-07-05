import java.util.*;
import java.io.*;

class Solution {
        public static int solution(int[] scoville, int K) {
        int answer = 0;
        PriorityQueue<Integer> queue = new PriorityQueue<>();

        for(int i=0;i<scoville.length;i++)
            queue.offer(scoville[i]);


        while (true){
            if(queue.size() <=1 ){
                break;
            }
            int k = queue.poll();
            int i = queue.poll();
            
            if(k >= K){
                return answer;
            }

            queue.offer(k+(2*i));
            answer++;
        }
        if(queue.poll() >= K){
            return answer;
        }

            return -1;

    }
}