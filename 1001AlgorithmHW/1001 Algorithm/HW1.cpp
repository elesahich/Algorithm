//
//  HW1.cpp
//  1001 Algorithm
//
//  Created by elesahich on 02/10/2019.
//  Copyright © 2019 elesahich. All rights reserved.
//
// 1 - 1.


/*
#include <iostream>
#include <time.h>
#include <stdlib.h>

using namespace std;

void Perfect(int n) {
    int sum = 0;
    for (int i = 1; i <= n / 2; i++) {
        if ( n%i == 0 )
        {
            sum += i;
        }
    }
    sum > n ? cout << "자연수 " << n << "은 과잉수입니다 " : sum < n ? cout <<"자연수 " << n << "은 부족수입니다 " :  cout << "자연수 " << n << "은 완전수 입니다." << endl;
}

int main () {
    int n;
    cout << "자연수 N 입력 : ";
    cin >> n;
    Perfect(n);
}

 */

// 1 - 2.
/*
#include <iostream>
using namespace std;

int isPrime(int a) {
    for ( int i = 2 ; i < a/2 ; i++) {
        if ( a==2) {
            cout << "소수입니다 " << endl;
        }
        if ( a % i == 0 ) {
            cout << " 소수가 아니에용" << endl;
            return 0;
        }
    }
    cout << " 소수입니다. " << endl;
    return 1;
}

int main () {
    int a = 0;
    cout << " 소수 판별할 1 이상의 수를 입력하세요 ";
    cin >> a;
    isPrime(a);
}

*/
