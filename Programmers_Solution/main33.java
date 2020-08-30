import java.util.*;
import java.io.*;

public class Main {
    static int MOD = 20170805;

    public static int solution(int m, int n, int[][] cityMap) {
        int myCity[][] = new int[m+1][n+1];

        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                myCity[i+1][j+1] = cityMap[i][j];
            }
        }

        int arr[][] = new int[m + 1][n + 1];


        for(int i=1;i<=m;i++){
            for(int j=1;j<=n;j++){
                if(i==1 && j==1){
                    arr[i][j] = 1;
                }
                else{
                    if(myCity[i][j] == 1){
                        arr[i][j] = 0;
                    }
                    else{  //2하고 0일때
                        if(myCity[i][j-1] == 2){
                            for(int k=j-2;k>=0;k--){
                                if(myCity[i][k] !=2 ){
                                    arr[i][j] = (arr[i][j]+arr[i][k]) % MOD;
                                    break;
                                }
                            }
                        }
                        else {
                            arr[i][j] = (arr[i][j] +  arr[i][j-1]) % MOD;
                        }

                        if(myCity[i-1][j] == 2){
                            for(int k = i-2;k>=0;k--){
                                if(myCity[k][j] != 2){
                                    arr[i][j] = (arr[i][j] + arr[k][j]) % MOD;
                                    break;
                                }
                            }
                        }
                        else {
                            arr[i][j] = (arr[i][j] + arr[i-1][j]) % MOD;
                        }




                    }
                }

            }
        }



        return arr[m][n];
    }

    public static void main(String args[]) throws IOException {
        //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // String[] str = br.readLine().split(" ");
        int[][] arr = {{0, 2, 0, 0, 0, 2}, {0, 0, 2, 0, 1, 0}, {1, 0, 0, 2, 2, 0}};
        int[][] arr1 = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
        int[][] arr2 = {{0,1,1},{1,1,1},{1,1,0}};
        System.out.println(solution(3,3,arr1));
        System.out.println( solution(3, 6, arr));

    }


}
