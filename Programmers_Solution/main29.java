class Solution {
   
   static boolean check[][];


    public static int go(int m, int n, int color, int[][] picture) {
        int res = 0;
        if (check[m][n] == true) {
            //System.out.println(m+" / "+n+ "  방문");
            return 0;
        }
        if (picture[m][n] != color) {  //이전 색이랑 다르면
            return 0;
        }

        check[m][n] = true; //이전 색이랑 같으면 방문
        res++;
        if (m + 1 < picture.length) {
            res = res + go(m + 1, n, color, picture);//아래 검사
        }
        if(m-1 >= 0 ) {
            res = res + go(m - 1, n, color, picture);//위 검사
        }
        if(n-1 >= 0){
            res = res + go(m, n - 1, color, picture);//왼쪽 검사
        }
        if(n+1<picture[0].length){
            res = res + go(m, n + 1, color, picture); //오르쪽 검사
        }


        return res;
    }


    public static int[] solution(int m, int n, int[][] picture) {

        int[] answer = new int[2];
        check = new boolean[101][101];
        int kind = 0;
        int max = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (picture[i][j] != 0) {
                    int col = picture[i][j];
                    int a = go(i, j, col, picture);
                    if(a> max){
                        max= a;
                    }
                    if(a!=0){
                        kind++;
                    }
                }

            }
        }
        answer[0] = kind;
        answer[1] = max;
        //System.out.println(kind +" / "+max);
        return answer;
    }

}
