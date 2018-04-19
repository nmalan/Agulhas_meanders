%plots depth averaged temperature and meander composite surface currents at a series of lags and leads from INALT01 for JGR paper
% N. Malan, Cape Town, October 2017

close all;clear all;clc

load Fig6a.mat

figure(1)

subaxis(2,2,1,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_zaveT)
map=brewermap(15,'*RdYlBu')
colormap(map)
shading interp
colorbar('horiz','position',[.15,.5,.7,.01]);
caxis([-3 3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
hold on
	%plot scale vector
	m_vec(4,29.75,-37.5,-1,0)
	m_text(28.75,-37.25,'1m/s')
f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),2,'k')

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',3,'linecolor','k');
clabel(fat,guy,clevs)

load Fig6b.mat

subaxis(2,2,2,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_zaveT)
map=brewermap(15,'*RdYlBu')
colormap(map)
shading interp
caxis([-3 3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
hold on
	%plot scale vector
	m_vec(4,29.75,-37.5,-1,0)
	m_text(28.75,-37.25,'1m/s')
f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),2,'k')
%plot scale vector

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',3,'linecolor','k');
clabel(fat,guy,clevs)

load Fig6c.mat

subaxis(2,2,3,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_zaveT)
map=brewermap(15,'*RdYlBu')
colormap(map)
shading interp
caxis([-3 3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
hold on
	%plot scale vector
	m_vec(4,29.75,-37.5,-1,0)
	m_text(28.75,-37.25,'1m/s')
f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),2,'k')
%plot scale vector

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',3,'linecolor','k');
clabel(fat,guy,clevs)

load Fig6d.mat

subaxis(2,2,4,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_zaveT)
map=brewermap(15,'*RdYlBu')
colormap(map)
shading interp
caxis([-3 3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
hold on
	%plot scale vector
	m_vec(4,29.75,-37.5,-1,0)
	m_text(28.75,-37.25,'1m/s')
f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),2,'k')
%plot scale vector

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',3,'linecolor','k');
clabel(fat,guy,clevs)
