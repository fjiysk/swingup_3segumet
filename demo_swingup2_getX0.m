function X0 = demo_swingup_getX0

params = demo_swingup_getparams ;

N = params.N ; % 微小時間数
n = params.n ; % 微小時間
m = params.m ; % 質量(kg)
l = params.l ; % アーム長
g = params.g ; % 重力加速度

x0 = params.x0(1) ;
v0 = params.x0(2) ;
xend = params.xend(1) ;
vend = params.xend(2) ;

%事前割り当て
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