//우선순의 큐 쓰는 것이 중요, PriorityQueue 사용법이 중요함
import java.util.*;
import java.io.*;

public class Main {

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


    public static void main(String args[]) throws IOException {
        //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // String[] str = br.readLine().split(" ");
        int[] arr = {4,3,3};
        int[] arr2 = {2, 1, 2};
        int[] arr3 = {1, 1};
        System.out.println(solution(4,arr));
        System.out.println(solution(1,arr2));
        System.out.println(solution(3,arr3));
    }


}
