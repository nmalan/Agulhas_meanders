%plots Shelf edge temperature anomaly at 100m from HYCOM and INALT01, for Figure 8 of JGR paper.
%N. Malan, Cape Town, April 2018

close all;clear all;clc

load HYCOM_EAB_hov.mat

%plot map

figure(1)
%axes('position', [.1,.8,1,.25])

m_proj('Mercator','longitude',[20 28],'latitude', [-36 -33])
 %colorbar
 m_tbase('contour',0:-100:-400);
 %colorbar
 m_grid('box','fancy')
 m_gshhs_h('patch',[.7 .7 .7])
 m_gshhs_h('speckle','color','k');
 set(gcf,'color','white');
 m_plot(lon_sec,lat_sec,'k--','linewidth',3)
 %m_plot([23 26],[-35.1 -34.45],'r--','linewidth',3)
 %plot location of timeseries for lag corelations
  m_plot(lon_sec(25),lat_sec(25),'bd','linewidth',3,'markersize',5)
   m_plot(lon_sec(1),lat_sec(1),'rd','linewidth',3,'markersize',5)
    m_plot(lon_sec(50),lat_sec(50),'cd','linewidth',3,'markersize',5)

%plot HYCOM
figure(2)

axes('position', [.1,.2,.4,.7])
contourf(x_dist,time,temp_anom_100m)
 caxis([-4 4])
 map=brewermap(16,'*RdBu');
 colormap(map)
 %c=colorbar
 %ylabel(c,'Temperature @100m [deg. C]')
 datetick('y','mmm')
 hold on
 %plot start of pulse events
hline(time_sec(ind_pulse020{1}(1)),'g:','Meander 1')
hline(time_sec(ind_pulse020{2}(1)),'g:','Meander 2')
hl=hline(time_sec(ind_pulse020{3}(1)),'m','Meander 3')
hl2=hline(time_sec(ind_pulse020{4}(1)),'m','Meander 4')

set(hl,'linewidth',4)
hold on
set(hl2,'linewidth',6)

clear all

load INALT_EAB_hov.mat

%load meander indices
load /Users/neilmalan/Google_Drive/PhD/Analysis/HYCOM/Meanders/AC_Meander_ID/Pulse_020_4std_new.mat

%plot INALT01

axes('position', [.55,.2,.4,.7]) 
 contourf(x_dist,time,temp_anom_100m)
 caxis([-4 4])
 map=brewermap(16,'*RdBu');
 colormap(map)
 c=colorbar('horiz','position',[.16,.1,.7,.02]);
 xlabel(c,'Temperature anomaly @100m [deg. C]')
 datetick('y','mmm')
 hold on
 %plot start of pulse events
hl=hline(time_sec(ind_pulse020{3}(1)),'m','Meander 3')

set(hl,'linewidth',4)