function obj = demo_swingup_objfun(X,params)
%% 目的関数の作成


%%
params = demo_swingup2_getparams ;

N = params.N ; % 微小時間数
n = params.n ; % 微小時間
s = params.s ; % セグメント数

obj = 0 ;

for t = 1:(N*s)
    
    obj = obj + (X(2*N*s+t)*n)^2 ;
    
end
