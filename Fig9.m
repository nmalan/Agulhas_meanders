%plots lag correlations of shelf edge relationships between Agulhas Current position and temepratures from HYCOM and INALT01, for JGR paper.
%N. Malan, Cape Town, April 2018

close all;clear all;clc

%first plot curves from INALT

load INALT_EAB_corr.mat

%do correlation
% calculate lag-correlation between current position and shelf edge temp at 100m
[cor, lags]=xcov(ac_anom020(1:length(time_sec)),temp_100m_ts,'coeff'); %temp leads for positive lag NB!!! (check formula in xcov help)


%get lag at which min negative corelation occurs
cormin_lag=find(cor==min(cor))
cormin_lag=cormin_lag-length(time_sec)
cormax_lag=find(cor==max(cor))
cormax_lag=cormax_lag-length(time_sec)

% calculate significant level using Bretherton formula (JD_significant_bretherton)

[rsign, veclag]=JD_significant_bretherton(ac_anom020(1:length(time_sec)),temp_100m_ts,26);

% and plot the results (using area for gray shading)
figure(1)
area(veclag,rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
area(veclag,-rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
in1=plot(lags,cor,'b','linewidth',3)
grid on
xlim([-50 50])
title('Bretherton method - position anom leads for negative lags')

temp_100m_ts=filtreNaN_bandpass(squeeze(temp_sec(:,10,150)),5,145);

%do correlation
% calculate lag-correlation between current position and shelf edge temp at 100m
[cor, lags]=xcov(ac_anom020(1:length(time_sec)),temp_100m_ts,'coeff'); %temp leads for positive lag NB!!! (check formula in xcov help)


%get lag at which min negative corelation occurs
cormin_lag=find(cor==min(cor))
cormin_lag=cormin_lag-length(time_sec)
cormax_lag=find(cor==max(cor))
cormax_lag=cormax_lag-length(time_sec)

% calculate significant level using Bretherton formula (JD_significant_bretherton)

[rsign, veclag]=JD_significant_bretherton(ac_anom020(1:length(time_sec)),temp_100m_ts,26);

% and plot the results (using area for gray shading)
hold on
in2=plot(lags,cor,'r','linewidth',3)
grid on
xlim([-50 50])
title('Bretherton method - position anom leads for negative lags')

temp_100m_ts=filtreNaN_bandpass(squeeze(temp_sec(:,10,1)),5,145);

%do correlation
% calculate lag-correlation between current position and shelf edge temp at 100m
[cor, lags]=xcov(ac_anom020(1:length(time_sec)),temp_100m_ts,'coeff'); %temp leads for positive lag NB!!! (check formula in xcov help)


%get lag at which min negative corelation occurs
cormin_lag=find(cor==min(cor))
cormin_lag=cormin_lag-length(time_sec)
cormax_lag=find(cor==max(cor))
cormax_lag=cormax_lag-length(time_sec)

% calculate significant level using Bretherton formula (JD_significant_bretherton)

[rsign, veclag]=JD_significant_bretherton(ac_anom020(1:length(time_sec)),temp_100m_ts,26);

% and plot the results (using area for gray shading)
in3=plot(lags,cor,'c','linewidth',3)
grid on
xlim([-50 50])
title('Bretherton method - position anom leads for negative lags')

% now plot curves from HYCOM

load HYCOM_EAB_corr.mat

%do correlation

% calculate lag-correlation ACposition and temp at 100m
[cor, lags]=xcov(ac_anom020,temp_100m_ts(1:length(ac_anom020)),'coeff'); %temp leads for positive lag NB!!! (check formula in xcov help)

[rsign, veclag]=JD_significant_bretherton(ac_anom020,temp_100m_ts(1:length(ac_anom020)),26);

% and plot the results (using area for gray shading)
%area(veclag,rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
%area(veclag,-rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
h1=plot(lags,cor,'b--','linewidth',3)
grid on
xlim([-50 50])
title('Bretherton method - position anom leads for negative lags')

temp_100m_ts=filtreNaN_bandpass(squeeze(temp_sec(:,10,1)),5,145);

%do correlation
% calculate lag-correlation between current position and shelf edge temp at 100m
[cor, lags]=xcov(ac_anom020,temp_100m_ts(1:length(ac_anom020)),'coeff'); %temp leads for positive lag NB!!! (check formula in xcov help)

[rsign, veclag]=JD_significant_bretherton(ac_anom020,temp_100m_ts(1:length(ac_anom020)),26);

% and plot the results (using area for gray shading)
%area(veclag,rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
%area(veclag,-rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
h2=plot(lags,cor,'r--','linewidth',3)
grid on
xlim([-50 50])
title('Bretherton method - position anom leads for negative lags')

temp_100m_ts=filtreNaN_bandpass(squeeze(temp_sec(:,10,50)),5,145);

%do correlation
% calculate lag-correlation between current position and shelf edge temp at 100m
[cor, lags]=xcov(ac_anom020,temp_100m_ts(1:length(ac_anom020)),'coeff'); %temp leads for positive lag NB!!! (check formula in xcov help)

[rsign, veclag]=JD_significant_bretherton(ac_anom020,temp_100m_ts(1:length(ac_anom020)),26);

% and plot the results (using area for gray shading)
%area(veclag,rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
%area(veclag,-rsign,0,'facecolor',[.6 .6 .6],'linestyle','none')
hold on
h3=plot(lags,cor,'c--','linewidth',3)
grid on
xlim([-50 50])
title('Bretherton method - position anom leads for negative lags')
xlabel('lag [days]')

%add legend

legend([in1 in2 in3 h1 h2 h3],'INALT-centre','INALT-west','INALT-east','HYC-centre','HYC-west','HYC-east')
legend boxoff