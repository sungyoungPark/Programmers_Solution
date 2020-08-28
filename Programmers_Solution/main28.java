import java.util.*;
import java.io.*;

public class Main {

    public static String solution(String number, int k) {
        String answer = "";
        StringBuffer s = new StringBuffer(number);
        int a_index = 0;
        int b_index = 0;

        while (true){
            if(k==0){
                break;
            }
            if(b_index > number.length()-1){
                break;
            }

            if(s.charAt(a_index)==s.charAt(b_index)){ //비교값이 같으면
                b_index++;
            }
            else if(s.charAt(a_index) < s.charAt(b_index)){  //뒤에 숫자가 더 크면
                s.deleteCharAt(a_index);
                k--;
                if(a_index!=0){
                    a_index--;
                }
                if(a_index==0){
                    b_index = 1;
                }
                else{
                    b_index--;
                }
            }
            else if(s.charAt(a_index) > s.charAt(b_index)){ //앞에 숫자가 더 크면
                a_index= b_index;
                b_index++;
            }

        }

        if(k!=0){
            for(int i=0;i<k;i++){
                s.deleteCharAt(s.length()-1);
            }
        }
        System.out.println(s);
        return s.toString();
    }

    public static void main(String args[]) throws IOException {
        //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // String[] str = br.readLine().split(" ");

        solution("4177252841",4);

    }


}
