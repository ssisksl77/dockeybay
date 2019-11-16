# dockeybay
dockeybay is a tiny project to convey multiple files and folders. 
회사 업무를 하던 중, 항상 수정한 파일들을 하나하나 지정된 곳에 옮기고 그것들을 수기로 기록을 해서 보고하고,
또 수정을 할 때마다 문서를 수정하고, 파일들을 다시 옮기고 하는 일들을 하면서 손가락이 이러다가는 남아나지 않겠다라는 생각이 들어서
내가 수정한 파일을 기록하면서 동시에 어디에 옮겨놓을지 지정하면 패스에 해당하는 폴더를 생성하고 파일을 복사하는 프로그램을 만들어야 겠다고 생각했다.

## abstract
* "from_path.txt" is where your files' paths should be placed in. (from_path.txt 파일을 만들어서 복사할 파일의 패스와 파일명을 기술)
* "to_path.txt" is a where the "from_path.txt" files will be placed in. (to_path.txt 파일을 만들어서 옮겨질 파일의 패스와 파일명을 기술)

이 둘은 두개의 파일을 읽어서 동시에 한줄씩 읽어서 옮겨놓는다고 생각하면 된다. 
예)
<code>
from_path.txt
===
PATH/a.txt
PATH/b.exe
===

to_path.txt
===
NEW_PATH/aa.txt
NEW_PATH/bb.exe
===
</code>
이렇게 만든다면 각각 한줄씩 읽어서 복사되는 것이다.

## how to get executable
* stack install (하스켈 패키징 툴 stack이 필요하다)
* will make an exe file. (위 명령어를 사용하면 exe파일이 생성된다.)
