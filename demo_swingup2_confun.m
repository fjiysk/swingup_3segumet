function [c,ceq] =demo_swingup_confun(X)
%% ����֐��̍쐬�i����_�I���j

%% code

params = demo_swingup2_getparams ;

s = params.s ; % �Z�O�����g��
N = params.N ; % �������Ԑ�
n = params.n ; % ��������
m = params.m ; % ����(kg)
l = params.l ; % �A�[����
g = params.g ; % �d�͉����x

x0 = params.x0(1:2:2*s-1) ;
v0 = params.x0(2:2:2*s) ;
xend = params.xend(1:2:2*s-1) ;
vend = params.xend(2:2:2*s) ;

%���O���蓖��
c = [] ;
ceq = zeros(2*s*(N+1),1) ;

% �͊w�I����(2*s*(N-1)��)
for t = 1:N-1
    for i = 1:s
        
        if i == 1 % phi������
            phi = X(2*t*s+1) ;
            %��1(t+1) = ��1(t) + ��1(t)*��t
            ceq(2*s*(t-1)+2*i-1) = X(2*s*(t-1)+2*i-1) + X(2*s*(t-1)+2*i)*n - X(2*s*t+2*i-1) ;
            %��1(t+1) = ��1(t) +((ui(t)-ui+1(t))/(m(i)*li(t)^2) - g/l(i)cos(phi))*��t 
            ceq(2*s*(t-1)+2*i) = X(2*s*(t-1)+2*i) + (((X(2*N*s+(t-1)*s+i)-X(2*N*s+(t-1)*s+i+1))/(m(i)*l(i)^2)) - g/l(i)*cos(phi))*n - X(2*s*t+2*i) ;
        elseif i ~= s 
            phi = phi + pi + X(2*t*s+2*i-1) ;
            %
            ceq(2*s*(t-1)+2*i-1) = X(2*s*(t-1)+2*i-1) + X(2*s*(t-1)+2*i)*n - X(2*s*t+2*i-1) ;       
            %
            ceq(2*s*(t-1)+2*i) = X(2*s*(t-1)+2*i) + (((X(2*N*s+(t-1)*s+i)-X(2*N*s+(t-1)*s+i+1))/(m(i)*l(i)^2)) - g/l(i)*cos(phi))*n - X(2*s*t+2*i) ;
        else % ���[
            phi = phi + pi + X(2*t*s+2*i-1) ;
            %
            ceq(2*s*(t-1)+2*i-1) = X(2*s*(t-1)+2*i-1) + X(2*s*(t-1)+2*i)*n - X(2*s*t+2*i-1) ;
            %
            ceq(2*s*(t-1)+2*i) = X(2*s*(t-1)+2*i) + ((X(2*N*s+(t-1)*s+i)/(m(i)*l(i)^2)) - g/l(i)*cos(phi))*n - X(2*s*t+2*i) ;
        end
    end
end

% �^�X�N����(4*s��)
for i = 1:s
    %�������(x)
    ceq(2*s*(N-1)+4*i-3) = X(2*i-1) - x0(i) ;
    %�������(v)
    ceq(2*s*(N-1)+4*i-2) = X(2*i) - v0(i) ;
    %�I�����(x)
    ceq(2*s*(N-1)+4*i-1) = X(2*s*(N-1)+2*i-1) - xend(i) ;
    %�I�����(v)
    ceq(2*s*(N-1)+4*i) = X(2*s*(N-1)+2*i) - vend(i) ;


end
 
 


