//
//  main.cpp
//  1001 Algorithm
//
//  Created by elesahich on 01/10/2019.
//  Copyright © 2019 elesahich. All rights reserved.
//

// 1. CocktailSort

/*
#include<iostream>
#include <stdlib.h>
#include <time.h>
const int n = 40000;
using namespace std;
void cocktail_sort(int* data, int n)
{
    int i, tmp, left, right = n - 1, shift = -1;
    while ((left = shift) < right)
    {
        for (i = left + 1; i < right; i++)
        {
            if (data[i] > data[i + 1])
            {
                tmp = data[(shift = i)];
                data[i] = data[i + 1];
                data[i + 1] = tmp;
            }
        }
        for (i = (right = shift) - 1; i > left; i--)
        {
            if (data[i] > data[i + 1])
            {
                tmp = data[(shift = i)];
                data[i] = data[i + 1];
                data[i + 1] = tmp;
            }
        }
    }
    
}
int main()
{
    int data[n+1];
    double start_time;
    srand((unsigned int)time(NULL));
    for (int i = 1; i <= n; i++) data[i] = i;
    start_time = clock();
    cocktail_sort(data, n);
    cout << "칵테일 정렬의 실행 시간 (n = " << n << ") : " << clock() - start_time << endl;
    return 0;
}

 */

// 2. bubbleSort

/*

#include <iostream>
#include <time.h>
#include <stdlib.h>
using namespace std;
const int n = 40000;
inline void swap(int a[], int i, int j)
{
    int t = a[i]; a[i] = a[j]; a[j] = t;
}
void bubblesort(int a[], int n)
{
    int i, j;
    for (i = n; i >= 1; i--) {
        for (j = 1; j < i; j++)
            if (a[j] > a[j + 1]) swap(a, j, j + 1);
    }
}

int main()
{
    int i, a[n + 1];
    double start_time;
    srand((unsigned int)time(NULL));
    for (i = 1; i <= n; i++) a[n-i] = i;
    start_time = clock();
    bubblesort(a, n);
    cout << "버블 정렬의 실행 시간 (n = " << n << ") : " <<
    clock() - start_time << endl;
}

 */

// 3. 교환정렬
// 이거는 다시 한번 봐야할것 같은데용

#include<iostream>
#include<fstream>
#include<stdlib.h>
#include<stdio.h>
//#include<windows.h>
#include<vector>
#include<time.h>

#define DATA_SIZE 1000000
#define CHECK_TIME_START QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);QueryPerformanceCounter((_LARGE_INTEGER*)&start)
#define CHECK_TIME_END(a) QueryPerformanceCounter((_LARGE_INTEGER*)&end); a=(float)((float)(end-start)/freq)
using namespace std;
int main()
{
    __int64_t start, freq, end;
    int data_num;
    int* test_data = new int[DATA_SIZE];
    FILE* f;
    cout << "\n테스트 할 데이터의 갯수를 입력하세요...\n";
    cin >> data_num;
    if (f == fopen("/Users/iseungho/input.txt", "r")) {
        for (int j = 0; j < data_num; j++) {
            fprintf(f, "%d\n", j);
        }
        fclose(f);
    }
    cout << "\n inputing data at the memory...\n";
    if (f == fopen("/Users/iseungho/input.txt", "r")) {
        for (int j = 0; j < data_num; j++) {
            fscanf(f, "%d", &test_data[j]);
            
        }
        fclose(f);
    }
    else
        printf("에러");
    
    
    cout << "  알고리즘 시작\n" << endl;
    int temp = 0;
    int i = 0;
    int j = 0;
    double start_time = 0;
    double end_time = 0;
    start_time = clock();
    for (i = 0; i < data_num; i++)
    {
        for (j = i + 1; j < data_num; j++)
        {
            if (test_data[i] < test_data[j])
            {
                temp = test_data[i];
                test_data[i] = test_data[j];
                test_data[j] = temp;
            }
        }
    }
    end_time = clock() - start_time;
    cout << "실행 시간 : " << end_time ;
    
    if (f == fopen("test1.txt", "w+"))
    {
        for (j = 0; j < data_num; j++)
        {
            fprintf(f, "%d\n", test_data[j]);
            
        }
        fclose(f);
    }
    else
        printf("error");
    printf("시뮬레이션 끝");
    
    return 0;
    
    
}



// 4. 선택정렬

/*
#include <iostream>
#include <time.h>
#include <stdlib.h>
using namespace std;
const int N = 40000;
const int TRUE = 1;
const int FALSE = 0;

inline void swap(int a[], int i, int j)
{
    int t = a[i]; a[i] = a[j]; a[j] = t;
}

void CheckSort(int a[], int n)
{
    int i, Sorted;
    Sorted = TRUE;
    for (i = 1; i < n; i++) {
        if (a[i] > a[i + 1]) Sorted = FALSE;
        if (!Sorted) break;
    }
    if (Sorted) cout << "정렬 완료." << endl;
    else cout << "정렬 오류 발생." << endl;
}
void SelectionSort(int a[], int N)
{
    int i, j, min;
    for (i = 1; i < N; i++) {
        min = i;
        for (j = i + 1; j <= N; j++)
            if (a[j] < a[min]) min = j;
        swap(a, min, i);
    }
}

int main() {
    int i, a[N + 1];
    double start_time;
    srand((unsigned int)time(NULL));
    for (i = 1; i <= N; i++) a[i] = N-i;
    start_time = clock();
    SelectionSort(a, N);
    cout << "선택 정렬의 실행 시간 (N = " << N << ") : " <<
    clock() - start_time << endl;
    CheckSort(a, N);
}
 
 */




