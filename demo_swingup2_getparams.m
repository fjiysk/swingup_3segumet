function params = demo_swingup_getparams
%% 最適化用のパラメータの指定

params.g = 9.81 ;% 重力加速度

params.s = 3 ;%セグメント数
params.m = [3,2,1,1]  ; % 質量(kg)
params.l = [1,0.6,0.3,0.1] ; % アーム長

params.tf = 3 ; % 動作時間(s)
params.Fs = 10 ; % サンプリングレート
params.n = 1/params.Fs ;%ひと区間当たりの継続時間
params.N = params.tf * params.Fs ; %時間区間数

%タスク制約(要設定)
params.x0 = [-pi/2,0,pi,0,pi,0,pi/2,0]  ; % 初期状態
params.xend = [pi/2,0,pi,0,pi,0,pi/2,0] ; % 終期状態

params.e = 0 ;% トルク誤差(%)







