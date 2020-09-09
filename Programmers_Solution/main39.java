import java.util.*;
import java.io.*;

public class Main {
    static int[][] graph;
    static int n;
    public static int[] dijkstra(int v) {
        int[] distance = new int[n + 1];
        boolean[] visited = new boolean[n + 1];

        for (int i = 1; i <= n; i++) {
            distance[i] = Integer.MAX_VALUE;
        }
        distance[v] = 0;
        visited[v] = true;

        for (int i = 1; i <= n; i++) {
            if (!visited[i] && graph[v][i] != Integer.MAX_VALUE) {
                distance[i] = graph[v][i];
            }
        }

        for (int i = 0; i < n - 1; i++) {
            int min = Integer.MAX_VALUE;
            int index = 0;

            for (int j = 1; j <= n; j++) {
                if (!visited[j] && distance[j] != Integer.MAX_VALUE) {
                    if (distance[j] < min) {
                        min = distance[j];
                        index = j;
                    }
                }
            }

            visited[index] = true;
            if(index == 0){
                break;
            }
            for (int j = 1; j <= n; j++) {
                if (!visited[j] && graph[index][j] != Integer.MAX_VALUE) {
                    if (distance[j] > distance[index] + graph[index][j])
                        distance[j] = distance[index] + graph[index][j];
                }
            }
        }
        return distance;
    }

    public static int solution(int N, int[][] road, int k) {
        n = N;
        graph = new int[n + 1][n + 1];

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++) {
                graph[i][j] = Integer.MAX_VALUE;
            }
        }

        for (int[] r : road) {
            int a = r[0];
            int b = r[1];
            int c = r[2];
            if (graph[a][b] > c) {
                graph[a][b] = c;
                graph[b][a] = c;
            }
        }
        int[] dis = dijkstra(1);
        int count = 0;
        for (int i = 1; i <= n; i++){
            if (dis[i] <= k) {
                count++;
            }
    }

        return count;
    }


    public static void main(String[] args) throws Exception {
        //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        //StringTokenizer st = new StringTokenizer(br.readLine());
        //String[] str = br.readLine().split(" ");

        int[][] arr = {{1, 2, 1}, {2, 3, 3}, {5, 2, 2}, {1, 4, 2}, {5, 3, 1}, {5, 4, 2}};
        System.out.print(solution(5, arr, 3));
    }


}
