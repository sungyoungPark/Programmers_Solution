//우선순위 큐 문제

import java.util.*;
import java.io.*;

public class Main {

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
            //System.out.println(k+" / "+i);
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


    public static void main(String args[]) throws IOException {
        //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // String[] str = br.readLine().split(" ");
        int arr[] = {1, 2};
        System.out.println(solution(arr,2));

    }


}
