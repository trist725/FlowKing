

#include "ThreadPool.h"

extern std::queue<Que_t> g_TaskQue;
extern pthread_mutex_t g_QueMutex;

ThreadInfo_T CThreadPool::m_ThInfo[THREAD_COUNT];

CThreadPool::CThreadPool()
{
	
}

CThreadPool::~CThreadPool()
{

}

void* CThreadPool::RoutineThread(void* arg)
{	
	ThreadInfo_T *pInfo = (ThreadInfo_T *)arg;
	printf("1\n");
	while (pInfo->bRun)
	{
		printf("2\n");
		pthread_mutex_lock(&(pInfo->mtx));
		printf("3\n");
		pthread_cond_wait(&(pInfo->cond), &(pInfo->mtx));
		m_ThInfo->bIdle = false;
		printf("4\n");
		pthread_mutex_lock(&g_QueMutex);
		printf("5\n");
		Que_t& que = g_TaskQue.front();
		g_TaskQue.pop();
		printf("6\n");
		pthread_mutex_unlock(&g_QueMutex);
		printf("7\n");

		switch (que.eQueTaskType)
		{
		default:
			break;
		case ReadTask:
			printf("8\n");
			ReadData(que.pClient);
			break;
		case WriteTask:
			break;
		}
		printf("9\n");
		pthread_mutex_unlock(&(pInfo->mtx));
		pInfo->bIdle = true;
	}
}

bool CThreadPool::InitThreadPool()
{
	//设置线程分离属性
	pthread_attr_t  thread_attr;
	pthread_attr_init(&thread_attr);
	//pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);
	//创建线程池
	for (int n = 0; n < THREAD_COUNT; ++n)
	{
		pthread_cond_init(&(m_ThInfo[n].cond), NULL);
		pthread_mutex_init(&(m_ThInfo[n].mtx), NULL);
		pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);
		m_ThInfo[n].bIdle = true;
		m_ThInfo[n].bRun = true;
		int ret = pthread_create(&m_ThInfo[n].id, &thread_attr, RoutineThread, (void *)m_ThInfo);
		if (0 != ret)
		{
			perror("thread create");
			return(false);
		}
	}
	return true;
}

void CThreadPool::DispatchThread()
{
	for (int i = 0; i < THREAD_COUNT; ++i)
	{
		if (m_ThInfo[i].bIdle)
		{
			if (! g_TaskQue.empty())
			{
				printf("call a thread,i = %d\n", i);
				pthread_cond_signal(&m_ThInfo[i].cond);
			//	perror("signal");
				return;
			}
		}
	}
}

