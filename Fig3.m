%plots outputs of pulse_ID for both HYCOM and INALT on the the same axes
%N.Malan, Cape Town, August 2016
close all;clear all;clc

%%Hycom first
load ACpos_020_AGUHYCOM_Fig3.mat
ac_std020=repmat(std(ac_anom020),size(ac_anom020));
lastday_i = 4004;
n=4;
subplot(2,1,1)
r=plot(time(1:lastday_i),ac_anom020,'k')
datetick
ylabel('position anomaly [km]')
ylim([-100 250])
title('AGUHYCOM Agulhas Current core position anomaly at 020 (from abs. vel. & SSH gradient)')
hold on
plot(time(1:lastday_i),ac_std020*n,'r--')
datetick
hold on
%plot(time(1:lastday_i),ac_std020*-n,'k--')
datetick
hline(0,'k');
clear all

%Now INALT01
load ACpos_020_INALT_Fig3.mat
%find indices to plot only common time-period with HYCOM
c_ind=733;
n=4;
t=length(time_uv);

ac_std020=repmat(std(ac_anom020),size(ac_anom020));
subplot(2,1,2)
r=plot(time_uv(c_ind:t),ac_anom020(c_ind:t),'k')
datetick
ylabel('position anomaly [km]')
ylim([-100 250])
title('INALT01 Agulhas Current core position anomaly at 020 (from abs. vel. & SSH gradient)')
hold on
plot(time_uv(c_ind:t),ac_std020(c_ind:t)*n,'r--')
datetick
hold on
%plot(time_uv(c_ind:t),ac_std020(c_ind:t)*-n,'k--')
hold on
datetick
hline(0,'k');
clear all