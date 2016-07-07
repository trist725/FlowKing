#ifndef THREADPOLL_H_
#define THREADPOLL_H_

#define THREAD_COUNT 6

#include <pthread.h>
#include <errno.h>
#include <stdio.h>
#include "def.h"
#include "IOData.h"
#include <queue>

typedef struct ThreadInfo
{
	pthread_t id;
	pthread_cond_t cond;
	pthread_mutex_t mtx;
	bool bIdle;
	bool bRun;
}ThreadInfo_T;

class CThreadPool
{
public:
	CThreadPool();
	virtual ~CThreadPool();

	bool InitThreadPool();

	static void* RoutineThread(void* arg);

	void DispatchThread();
	
private:

	static ThreadInfo_T m_ThInfo[THREAD_COUNT];
};

#endif
