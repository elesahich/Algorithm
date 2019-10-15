//
//  Header.h
//  algorithmHW4
//
//  Created by elesahich on 2019/10/15.
//  Copyright © 2019 elesahich. All rights reserved.
//
#include <iostream>
#include <time.h>
#include <stdlib.h>

class TournamentSort
{
public:
    enum { MIN_NUM = -1 };

    TournamentSort(int nSize);
    ~TournamentSort();

public:
    void    initRandom();
    void    initSorted();
    void    initReverse();
    void    start();
    bool    isSorted();
    double    getTime() {    return m_fSortingTime;    }
    int        getSize() {    return m_nSize;    }

private:
    inline void    copyToLeaf();

private:
    int        m_nIndex;
    int        m_nSize;
    int        m_nLeafSize;
    int        m_nLevel;
    int        m_nStartPos;
    int*    m_nArr;
    int*    m_nBTree;
    double    m_fSortingTime;
};
