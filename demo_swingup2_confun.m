function [c,ceq] =demo_swingup_confun(X)
%% 制約関数の作成（決定論的環境）

%% code

params = demo_swingup2_getparams ;

s = params.s ; % セグメント数
N = params.N ; % 微小時間数
n = params.n ; % 微小時間
m = params.m ; % 質量(kg)
l = params.l ; % アーム長
g = params.g ; % 重力加速度

x0 = params.x0(1:2:2*s-1) ;
v0 = params.x0(2:2:2*s) ;
xend = params.xend(1:2:2*s-1) ;
vend = params.xend(2:2:2*s) ;

%事前割り当て
c = [] ;
ceq = zeros(2*s*(N+1),1) ;

% 力学的制約(2*s*(N-1)個)
for t = 1:N-1
    for i = 1:s
        
        if i == 1 % phiが特殊
            phi = X(2*t*s+1) ;
            %θ1(t+1) = θ1(t) + ω1(t)*Δt
            ceq(2*s*(t-1)+2*i-1) = X(2*s*(t-1)+2*i-1) + X(2*s*(t-1)+2*i)*n - X(2*s*t+2*i-1) ;
            %ω1(t+1) = ω1(t) +((ui(t)-ui+1(t))/(m(i)*li(t)^2) - g/l(i)cos(phi))*Δt 
            ceq(2*s*(t-1)+2*i) = X(2*s*(t-1)+2*i) + (((X(2*N*s+(t-1)*s+i)-X(2*N*s+(t-1)*s+i+1))/(m(i)*l(i)^2)) - g/l(i)*cos(phi))*n - X(2*s*t+2*i) ;
        elseif i ~= s 
            phi = phi + pi + X(2*t*s+2*i-1) ;
            %
            ceq(2*s*(t-1)+2*i-1) = X(2*s*(t-1)+2*i-1) + X(2*s*(t-1)+2*i)*n - X(2*s*t+2*i-1) ;       
            %
            ceq(2*s*(t-1)+2*i) = X(2*s*(t-1)+2*i) + (((X(2*N*s+(t-1)*s+i)-X(2*N*s+(t-1)*s+i+1))/(m(i)*l(i)^2)) - g/l(i)*cos(phi))*n - X(2*s*t+2*i) ;
        else % 末端
            phi = phi + pi + X(2*t*s+2*i-1) ;
            %
            ceq(2*s*(t-1)+2*i-1) = X(2*s*(t-1)+2*i-1) + X(2*s*(t-1)+2*i)*n - X(2*s*t+2*i-1) ;
            %
            ceq(2*s*(t-1)+2*i) = X(2*s*(t-1)+2*i) + ((X(2*N*s+(t-1)*s+i)/(m(i)*l(i)^2)) - g/l(i)*cos(phi))*n - X(2*s*t+2*i) ;
        end
    end
end

% タスク制約(4*s個)
for i = 1:s
    %初期状態(x)
    ceq(2*s*(N-1)+4*i-3) = X(2*i-1) - x0(i) ;
    %初期状態(v)
    ceq(2*s*(N-1)+4*i-2) = X(2*i) - v0(i) ;
    %終期状態(x)
    ceq(2*s*(N-1)+4*i-1) = X(2*s*(N-1)+2*i-1) - xend(i) ;
    %終期状態(v)
    ceq(2*s*(N-1)+4*i) = X(2*s*(N-1)+2*i) - vend(i) ;


end
 
 


