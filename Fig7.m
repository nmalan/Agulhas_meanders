%plots meandercomposite anomaly surface relative vorticity from HYCOM and INALT01, for JGR paper.
%N. Malan, Cape Town, April 2018

close all;clear all;clc

load HYCOM_meander_vtcty_anom.mat

figure(1)

subaxis(2,1,1,'spacinghoriz',0.05,'spacingvert',0.15)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_v,lat_v,pulse_mean_vtcty_anom)
map=cmocean('balance');
colormap(map);
shading interp
colorbar('horiz','position',[.2,.5,.6,.01]);
%caxis([-0.25 0.25])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
caxis([-0.4 0.4])
hold on
%plot scale vector
m_vec(4,29.75,-37.5,-1,0)
m_text(28.75,-37.25,'1m/s')
m_text(19,-33.5,'HYCOM')

f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),4,'k')

load INALT_meander_vtcty_anom.mat

subaxis(2,1,2,'spacinghoriz',0.05,'spacingvert',0.15)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_v,lat_v,pulse_mean_vtcty_anom)
map=cmocean('balance');
colormap(map);
shading interp
%colorbar('horiz','position',[.15,.07,.7,.01]);
%caxis([-0.25 0.25])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
caxis([-0.4 0.4])
hold on
%plot scale vector
m_vec(4,29.75,-37.5,-1,0)
m_text(28.75,-37.25,'1m/s')
m_text(19,-33.5,'INALT01')

f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),4,'k')