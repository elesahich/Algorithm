//
//  main.cpp
//  algorithmHW4
//
//  Created by elesahich on 2019/10/09.
//  Copyright © 2019 elesahich. All rights reserved.
//

// 자연합병
/*
#include<iostream>
#include<time.h>
using namespace std;
const int N = 10000;

void MergeSort(int arr[], int l, int r, int divide)
{
    int *first_Arr = new int[N + 1];
    int first_Cnt = 0;
    int *second_Arr = new int[N + 1];
    int second_Cnt = 0;
    
    for (int i = l; i <= divide; i++)
        first_Arr[++first_Cnt] = arr[i];
    
    for (int i = divide + 1; i <= r; i++)
        second_Arr[++second_Cnt] = arr[i];
    
    int first_index = 1;
    int second_index = 1;
    //    int present_Position = 0;
    
    for (int i = l; i < l + (first_Cnt + second_Cnt); i++)
    {
        arr[i] = first_Arr[first_index] > second_Arr[second_index] ? second_Arr[second_index++] : first_Arr[first_index++];
        if (first_index == first_Cnt + 1)        // 첫번째 배열이 다 들어가서 두번째 배열만 넣어주면 되는 경우
        {
            for (int j = i + 1; j < l + (first_Cnt + second_Cnt); j++)
                arr[j] = second_Arr[second_index++];
            break;
        }
        else if (second_index == second_Cnt + 1)        // 두번째 배열이 다 들어가서 첫번째 배열만 넣어주면 되는 경우
        {
            for (int j = i + 1; j < l + (first_Cnt + second_Cnt); j++)
                arr[j] = first_Arr[first_index++];
            break;
        }
    }
    delete[] first_Arr;
    delete[] second_Arr;
    first_Arr = NULL;
    second_Arr = NULL;
}

void NaturalMergeSort(int arr[], int l, int r)
{
    int check_Cnt = 0;        // 2개 일때 합병
    int first_Merge_start = 1;
    int check_Point = 0;
    int sw = 0;
    for (int i = l + 1; i <= r; i++)
    {
        if (arr[i - 1] > arr[i])
        {
            check_Cnt++;
            sw = 1;
            if (check_Cnt == 1)
                check_Point = i - 1;
        }
        if (check_Cnt == 2)
        {
            MergeSort(arr, first_Merge_start, i - 1, check_Point);
            check_Cnt = 0;
            first_Merge_start = i;
        }
        if (i == r && check_Cnt == 1)
            MergeSort(arr, first_Merge_start, i, check_Point);
    }
    if (sw == 1)
        NaturalMergeSort(arr, 1, N);
}

int main()
{
    srand((unsigned int)time(NULL));
    int *arr = new int[N + 1];
    double start_time;
    int rever = N;
    for (int i = 1; i <= N; i++)
        arr[i] = rever--;
    start_time = clock();
    NaturalMergeSort(arr, 1, N);
    cout << "총 걸린 시간 = " << (clock() - start_time)/CLOCKS_PER_SEC << "초" << endl;
    
    delete[] arr;
    arr = NULL;
    return 0;
}



// 합병정렬
/*
#include <iostream>
#include <time.h>
#include <stdlib.h>
using namespace std;

const int N = 10000;
int b[N+1];
void MergeSort(int a[], int l, int r)
{
    int i, j, k, m;
    if (r > l) {
        m = (r+l)/2;
        MergeSort(a, l, m);
        MergeSort(a, m+1, r);
        for (i = m+1; i > l; i--) b[i-1] = a[i-1];
        for (j = m; j < r; j++) b[r+m-j] = a[j+1];
        for (k = l; k <= r; k++)
            a[k] = (b[i] < b[j]) ? b[i++] : b[j--];
    }
}
int main()
{
    int i, a[N+1];
    double start_time;
    srand((unsigned int)time(NULL));
    for (i = 1; i <= N; i++) a[i] = rand();
    start_time = clock();
    MergeSort(a, 1, N);
    cout << "합병 정렬의 실행 시간 (N = " << N << ") : " <<
    (clock() - start_time) / CLOCKS_PER_SEC << endl;
}
*/

// 힙정렬

 #include <iostream>
#include <time.h>
#include <stdlib.h>
//#include "sort.h"

const int N = 100000;
using namespace std;

inline void swap (int a[], int i, int j) {
    int t = a[i]; a[i] = a[j]; a[j] = t;
}
void heapify(int a[], int h, int m)
{
    int j, v;
    v = a[h];
    for (j = 2*h; j <= m; j *= 2) {
        if (j < m && a[j] < a[j+1]) j++;
        if (v >= a[j]) break;
        else a[j/2] = a[j];
    }
    a[j/2] = v;
}
void HeapSort(int a[], int n) {
    int i;
    for ( i = n/2; i >= 1; i-- )
        heapify(a, i, n);
    for ( i = n-1; i >= 1; i-- ) {
        swap(a, 1, i+1);
        heapify(a, 1, i);
    }
}
int main()
{
    int i, a[N+1];
    double start_time;
    srand((unsigned int)time(NULL));
    for (i = 1; i <= N; i++) a[i] = rand();
    start_time = clock();
    HeapSort(a, N);
    cout << "히프 정렬의 실행 시간 (N = " << N<< ") : " <<
    (clock() - start_time) / CLOCKS_PER_SEC  << endl;
}
 
 

/*
#include "Header.h"
#include <iostream>
#include <string>
using namespace std;

TournamentSort::TournamentSort(int nSize)
    :m_nIndex(1), m_nSize(nSize), m_nLeafSize(1), m_nLevel(0), m_nStartPos(1)
{
    m_nArr = new int[nSize + 1];
    m_nArr[0] = MIN_NUM;

    for (int i = 1; i < m_nSize; m_nLevel++)
        i *= 2;

    for (int k = 1; k <= m_nLevel; k++)
        m_nLeafSize *= 2;

    m_nBTree = new int[m_nLeafSize * 2];
    for (int i = 0; i <= m_nLeafSize * 2; i++)
        m_nBTree[i] = MIN_NUM;

    for (int i = 1; i <= m_nLevel; i++)
        m_nStartPos *= 2;

    srand((unsigned int)time(NULL));
}

TournamentSort::~TournamentSort()
{
    if (m_nArr)    delete[] m_nArr;
}

void TournamentSort::initRandom()
{
    for (int i = 1; i <= m_nSize; i++) m_nArr[i] = rand();
}

void TournamentSort::initSorted()
{
    for (int i = 1; i <= m_nSize; i++) m_nArr[i] = i;
}

void TournamentSort::initReverse()
{
    for (int i = 1; i <= m_nSize; i++) m_nArr[i] = m_nSize + 1 - i;
}

void TournamentSort::start()
{
    int nPos = m_nStartPos;
    int nUpPos = m_nStartPos >> 1;
    int nSize = m_nLeafSize;
    int nCount = 1;
    int i = 0;
    double fStart = clock();

    copyToLeaf();    //리프 노드로 복사
    //처음 상위레벨로 승자트리 만들기
    for (; i < m_nSize >> 1; ++i)
    {
        if (m_nBTree[nPos + (i << 1)] == MIN_NUM)
            break;
        else if (m_nBTree[nPos + (i << 1)] >= m_nBTree[nPos + (i << 1) + 1])
            m_nBTree[nUpPos + i] = nPos + (i << 1);
        else
            m_nBTree[nUpPos + i] = nPos + (i << 1) + 1;
    }

    // 첫번째 데이터 구하기
    while (nUpPos != 1)
    {
        nPos = nPos >> 1;
        nUpPos = nUpPos >> 1;
        nSize = nSize >> 1;
        for (i = 0; i < nSize >> 1; ++i)
        {
            if (m_nBTree[nPos + (i << 1)] == MIN_NUM)
                break;
            else if (m_nBTree[m_nBTree[nPos + (i << 1)]] >= m_nBTree[m_nBTree[nPos + (i << 1) + 1]])
                m_nBTree[nUpPos + i] = m_nBTree[nPos + (i << 1)];
            else
                m_nBTree[nUpPos + i] = m_nBTree[nPos + (i << 1) + 1];
        }
    }

    while (nCount <= m_nSize)
    {
        // 추출된 데이터 원래 배열끝부터 삽입
        m_nArr[m_nSize + 1 - nCount] = m_nBTree[m_nBTree[nUpPos]];
        // 추출한 리프노드에 최소값(-1) 삽입
        m_nBTree[m_nBTree[nUpPos]] = MIN_NUM;

        // 추출된 리프노드만 상위레벨로 다시 승자트리 만들기
        nPos = m_nBTree[nUpPos];
        if ((nPos << 31) ^ 0) --nPos;
        nUpPos = nPos >> 1;

        if (m_nBTree[nPos] >= m_nBTree[nPos + 1])
            m_nBTree[nUpPos] = nPos;
        else
            m_nBTree[nUpPos] = nPos + 1;

        while (nUpPos != 1)
        {
            nPos = nPos >> 1;
            nUpPos = nUpPos >> 1;
            if ((nPos << 31) ^ 0) --nPos;
            if (m_nBTree[m_nBTree[nPos]] >= m_nBTree[m_nBTree[nPos + 1]])
                m_nBTree[nUpPos] = m_nBTree[nPos];
            else
                m_nBTree[nUpPos] = m_nBTree[nPos + 1];
        }
        ++nCount;
    }
    m_fSortingTime = clock() - fStart;
}

void TournamentSort::copyToLeaf()
{
    int nPos = m_nStartPos;
    for (int i = 1; i <= m_nSize; i++)
        m_nBTree[nPos++] = m_nArr[i];
}

bool TournamentSort::isSorted()
{
    for (int i = 1; i < m_nSize; i++)
        if (m_nArr[i] > m_nArr[i + 1]) return false;
    return true;
}

int main()
{
    cout << "토너먼트 정렬을 원하는 갯수를 입력하세요: ";
    int nNum;
    cin >> nNum;
    TournamentSort TSort(nNum);
    cout << "데이터 삽입 종류를 선택하세요(1번 - 랜덤, 2번 - 정렬된, 3번 - 역순): ";
    int nSelect;
    cin >> nSelect;
    string strNumType;
    switch (nSelect)
    {
    case 1:
        TSort.initRandom();
        strNumType = "랜덤";
        break;
    case 2:
        TSort.initSorted();
        strNumType = "정렬";
        break;
    case 3:
        TSort.initReverse();
        strNumType = "역순";
        break;
    }
    double start_time;
    start_time = clock();

    TSort.start();

    cout << "[" << strNumType << "] 토너먼트 정렬의 실행 시간 (갯수 = "
        << TSort.getSize() << " ) : " << (clock()-start_time)/CLOCKS_PER_SEC << endl;


    if (TSort.isSorted()) cout << "정렬 완료" << endl;
    else cout << "정렬 오류 발생" << endl;

    return 0;
}

*/
