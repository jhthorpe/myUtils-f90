PROGRAM test
  USE myUtils
  IMPLICIT NONE
  integer(kind=4), dimension(:,:) , allocatable :: B
  logical, dimension(:),allocatable :: A,C 
  integer(kind=4), dimension(:), allocatable :: key
  logical :: val
  integer :: k,n,m,q


  n = 2
  m = 27
  val = .TRUE.
  call hash_qinit_2Dint4_bool(A,B,C,n,m)
  WRITE(*,*) SIZE(A(:))
  WRITE(*,*) SIZE(B(:,0))
  WRITE(*,*) SIZE(B(0,:))
  WRITE(*,*) SIZE(C(:))

  allocate(key(0:m-1))
  key(10) = 42
  WRITE(*,*) "key is..."
  WRITE(*,*) key
  
  q = 1
  call hash_qinsert_2Dint4_bool(A,B,C,key,val,0,n,q)
  key(11) = 24
  q = q + 1
  call hash_qinsert_2Dint4_bool(A,B,C,key,val,0,n,q)
  key(11) = 23
  q = q + 1
  call hash_qinsert_2Dint4_bool(A,B,C,key,val,0,n,q)

  write(*,*) B(0,:)

  call hash_qsearch_2Dint4_bool(A,B,C,key,val,0,n)

  
END PROGRAM
