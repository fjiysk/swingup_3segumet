function params = demo_swingup_getparams
%% �œK���p�̃p�����[�^�̎w��

params.g = 9.81 ;% �d�͉����x

params.s = 3 ;%�Z�O�����g��
params.m = [3,2,1,1]  ; % ����(kg)
params.l = [1,0.6,0.3,0.1] ; % �A�[����

params.tf = 3 ; % ���쎞��(s)
params.Fs = 10 ; % �T���v�����O���[�g
params.n = 1/params.Fs ;%�ЂƋ�ԓ�����̌p������
params.N = params.tf * params.Fs ; %���ԋ�Ԑ�

%�^�X�N����(�v�ݒ�)
params.x0 = [-pi/2,0,pi,0,pi,0,pi/2,0]  ; % �������
params.xend = [pi/2,0,pi,0,pi,0,pi/2,0] ; % �I�����

params.e = 0 ;% �g���N�덷(%)







