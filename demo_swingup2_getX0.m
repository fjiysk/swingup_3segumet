function X0 = demo_swingup_getX0

params = demo_swingup_getparams ;

N = params.N ; % �������Ԑ�
n = params.n ; % ��������
m = params.m ; % ����(kg)
l = params.l ; % �A�[����
g = params.g ; % �d�͉����x

x0 = params.x0(1) ;
v0 = params.x0(2) ;
xend = params.xend(1) ;
vend = params.xend(2) ;

%���O���蓖��
X0 = zeros(3*N,1) ;

xtrn = xend - x0 ;
xvar = xtrn/N ;



x = x0 ;
v = xvar ;
for i = 1:N
    
    X0(2*i-1) = x ;
    x = x + xvar ;
    
    X0(2*i) = v ;
%     v = v + vvar
    
end