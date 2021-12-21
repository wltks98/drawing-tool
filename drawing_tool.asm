@SCREEN
D=A

@0
M=D	

@2
M=0

(HORIZON) //수평선 그리기 시작

@0
A=M	
M=-1	

@2 //카운트 용
M=M+1
D=M

@32
D=D-A

@0
M=M+1	



@HORIZON
D;JLT	
/////////////////////////
	
@480

D=A

@0
M=M+D

@2
M=0 

@24095
M=M+1
D=M
M=M-1

@HORIZON  //수평선 끝
D;JNE  

@SCREEN //수직선 시작
D=A

@32
D=D+A

@0
M=D

@2
M=0

(VERTICAL)
@0
A=M
M=1

@0
M=M+1

@2 //카운트 용
M=M+1
D=M

@480
D=D-A


@VERTICAL
D;JLT

@0
D=M

@32
D=D+A

@0
M=D


@24543
D=M

@2
M=0

@VERTICAL //수직선 끝
D;JEQ
 
//커서 그리기 시작

@512 //512를 저장
D=A
M=D

@7 //Y좌표가 8이면 7만큼 
D=A


@Y //Y좌표를 저장
M=D

@15
D=A
M=D

@X //X좌표를 저장
M=D



(DRAW)
@32
D=A

@X
D=D-M
@XBLOCK //오른쪽으로 막힘
D;JEQ

@X
D=M
@XBLOCK2 //왼쪽으로 막힘
D;JLT

@Y
D=M
@YBLOCK //위로 막힘
D;JLT


@16
D=A
@Y
D=D-M
@YBLOCK2 //아래로 막힘
D;JEQ


@513 //512Y를 저장하는 곳
M=0

@512
D=M


@514 //카운트 하는 곳
M=D

(LOOP) ///////
@Y	
D=M	

@513	
M=D+M	

@514	
M=M-1	

D=M
	
@LOOP	///////////////
D;JGT


@SCREEN
D=A

@CURSOR
M=0
M=M+D

@513
D=M

@CURSOR
M=M+D

@X
D=M

@CURSOR
M=M+D
D=M

@SAVEXY   /////////////////
M=D

@SAVEXY2
M=D

@15
D=A

@COUNT16
M=D

(LOOP32) ///////////////////////


@32
D=A

@SAVEXY2
M=M+D
A=M
M=1

@COUNT16
M=M-1
D=M

@LOOP32
D;JGT ////////////////

@64
D=A

@CURSOR
M=M+D

@1821
D=A

@CURSOR
A=M
M=D

@128
D=A

@CURSOR
M=M+D

A=M
M=-1

@192
D=A

@CURSOR
M=M+D

A=M
M=-1


//커서 그리기 끝

(KEBORD)
@KBD
D=M
@KEBORD 
D;JEQ

@131
D=D-A


@D130
D;JLT

@D131
D;JEQ

@132OR133
D;JGT

(D130)
@D130
D=A
@FILL1  ///
D;JMP
(D130D)
@X
M=M-1

@WAIT
D;JMP

(D131)
@D131
D=A
@FILL2  ///
D;JMP
(D131D)
@Y
M=M-1
@WAIT
D;JMP

(D132)
@D132
D=A
@FILL3  ///
D;JMP
(D132D)
@X
M=M+1
@WAIT
D;JMP

(D133)
@D133
D=A
@FILL4  ///
D;JMP
(D133D)
@Y
M=M+1
@WAIT
D;JMP



(WAIT) //키보드에서 손을 떼는 동안 기다리기
@KBD
D=M
@WAIT
D;JNE



@DRAW //커서 다시 그리기
D;JMP



(XBLOCK)
@X
M=M-1
@KEBORD   //
D;JMP

(XBLOCK2)
@X
M=M+1
@KEBORD   //
D;JMP

(YBLOCK)
@Y
M=M+1
@KEBORD   //
D;JMP

(YBLOCK2)
@Y
M=M-1
@KEBORD   //
D;JMP

(132OR133)
@1
D=D-A

@D132
D;JEQ

@D133
D;JGT


(FILL1) ////////검은색 칠하기 시작

@SAVEDDD  ///////
M=D

@X
M=M-1
D=M
M=M+1
@D130D
D;JLT


@16
D=A

@COUNT15
M=D

(LOOP31)
@SAVEXY
A=M
M=-1

@32
D=A

@SAVEXY
M=M+D

@COUNT15
M=M-1
D=M

@LOOP31
D;JGT

@4
D=A

@SAVEDDD
A=D+M
D;JMP


(FILL2)
@SAVEDDD  ///////
M=D

@Y
M=M-1
D=M
M=M+1
@D131D
D;JLT


@16
D=A

@COUNT15
M=D

(LOOP35)
@SAVEXY
A=M
M=-1

@32
D=A

@SAVEXY
M=M+D

@COUNT15
M=M-1
D=M

@LOOP35
D;JGT

@4
D=A

@SAVEDDD
A=D+M
D;JMP

(FILL3)
@SAVEDDD  ///////
M=D

@X
M=M+1

@32
D=A

@X
D=D-M
M=M-1
@D132D
D;JEQ


@16
D=A

@COUNT15
M=D

(LOOP33)
@SAVEXY
A=M
M=-1

@32
D=A

@SAVEXY
M=M+D

@COUNT15
M=M-1
D=M

@LOOP33
D;JGT

@4
D=A

@SAVEDDD
A=D+M
D;JMP

(FILL4)
@SAVEDDD  ///////
M=D

@Y
M=M+1

@16
D=A
@Y
D=D-M
M=M-1
@D133D //아래로 막힘
D;JEQ


@16
D=A

@COUNT15
M=D

(LOOP34)
@SAVEXY
A=M
M=-1

@32
D=A

@SAVEXY
M=M+D

@COUNT15
M=M-1
D=M

@LOOP34
D;JGT

@4
D=A

@SAVEDDD
A=D+M
D;JMP





