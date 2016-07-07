
#include "MyFunc.h"
#include <QTime>

int GetRandom(int nStart, int nEnd)
{
    if((nStart < 0) || (nEnd < 0) || (nStart >= nEnd))
    {
        return 0;
    }
    if(nStart == nEnd)
    {
        return nEnd;
    }

    QTime time;
    time= QTime::currentTime();
    qsrand(time.msec()+time.second()*1000);

    int random;
    if(nStart == 0)
    {
        random = qrand() % (nEnd + 1);
    }
    else
    {
        random = qrand() % (nEnd-nStart+1) + nStart;
    }

    return random;
}

QString GetMainKeyByUrl(QString url)
{
    int pos1 = 0, pos2 = 0;
    pos1 = url.indexOf(".");
    pos2 = url.indexOf(".", pos1+1);

    return url.mid(pos1+1, pos2-pos1-1);
}
