import java.util.*;
import java.io.*;

public class Main {

    public static int solution(int n, int[][] costs) {

        int[][] graph = new int[n][n];
        boolean visit[] = new boolean[n];

        for(int[] cost : costs){
            graph[cost[0]][cost[1]] = cost[2];
            graph[cost[1]][cost[0]] = cost[2];
        }

        ArrayList<Integer> ls = new ArrayList<>();
        ls.add(0);
        visit[0] = true;
        int sum = 0;
        while (ls.size()<n){
            int min =Integer.MAX_VALUE;
            int min_index = 0;

            for(int i=0;i<ls.size();i++){
                for(int j=0;j<n;j++){
                    if(visit[j]==false && graph[ls.get(i)][j] != 0){
                        if(min>graph[ls.get(i)][j]){
                            min = graph[ls.get(i)][j];
                            min_index = j;
                        }
                    }
                }
            }


            visit[min_index] = true;
           // System.out.print(min_index+" ");
            ls.add(min_index);
            sum = sum+min;


        }




        return sum;
    }


    public static void main(String[] args) throws Exception {
        /*
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int m = Integer.parseInt(br.readLine());
        */

        //int[][] arr = {{0,1,1},{1,2,1},{1,3,1},{3,4,1}};
        int[][] arr = {{0, 1, 1}, {0, 2, 2}, {1, 2, 5}, {1, 3, 1}, {2, 3, 8}};
        System.out.println(solution(4,arr));

    }


}
