function obj = demo_swingup_objfun(X,params)
%% �ړI�֐��̍쐬


%%
params = demo_swingup2_getparams ;

N = params.N ; % �������Ԑ�
n = params.n ; % ��������
s = params.s ; % �Z�O�����g��

obj = 0 ;

for t = 1:(N*s)
    
    obj = obj + (X(2*N*s+t)*n)^2 ;
    
end
