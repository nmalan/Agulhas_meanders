%plots outputs of pulse_ID for both HYCOM and INALT on the the same axes
%N.Malan, Cape Town, August 2016
close all;clear all;clc

%%Hycom first
load /Users/neilmalan/Google_Drive/PhD/Analysis/HYCOM/Meanders/AC_Meander_ID/ACpos_020_AGUHYCOM_new.mat
ac_std020=repmat(std(ac_anom020),size(ac_anom020));
lastday_i = 4004;
n=4;
subplot(3,1,1)
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
load ~/Google_Drive/PhD/Analysis/NEMO/Natal_pulses/AC_meanders/ACpos_020_INALT_new.mat
%find indices to plot only common time-period with HYCOM
c_ind=733;
n=4;
t=length(time_uv);

ac_std020=repmat(std(ac_anom020),size(ac_anom020));
subplot(3,1,2)
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

%Now AVISO
nc=netcdf('~/Google_Drive/PhD/Altimetry/avisoCore_020.nc');
ac_pos020=nc{'coreDist_020'}(:);
time=nc{'time'}(:)+datenum(1950,01,01);

 %subset to common time period ...
 ac_pos020=ac_pos020(find(time==datenum(1997,01,01)):find(time==datenum(2007,12,26)));
 time=time(find(time==datenum(1997,01,01)):find(time==datenum(2007,12,26)));
 ac_anom020=ac_pos020-mode(ac_pos020);
 ac_std020=repmat(std(ac_anom020),size(ac_anom020));
 %plot
 n=2;
 subplot(3,1,3)
 r=plot(time,ac_anom020,'k')
 datetick
 ylabel('position anomaly [km]')
 ylim([-100 250])
 title('AVISO Agulhas Current core position anomaly at 020 (from abs. vel. & SSH gradient)')
 hold on
 plot(time,ac_std020*n,'r--')
 datetick
 hold on
 %plot(time(1:lastday_i),ac_std020*-n,'k--')
 datetick
 hline(0,'k');