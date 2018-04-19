%plots meander and no meander composites from both HYCOM and INALT on a single axes for JGR paper
% N. Malan, Cape Town, October 2017

close all;clear all;clc

%load HYCOM
load HYCOM_meander_compo.mat


figure(1)
%subaxis(2,2,1,'spacinghoriz',0.05,'spacingvert',0.05)

subaxis(3,2,1,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_T)
map=brewermap(24,'OrRd')
colormap(map)
shading interp
cb=colorbar('horiz','position',[.15,.06,.7,.01]);
xlabel(cb,'SST [^oC]')
caxis([18 26])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
m_text(19.2,-33.5,'HYCOM meander','fontsize',10)
m_text(18.4,-33.3,'a)','fontweight','bold','fontsize',14)
hold on

f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),2,'k')

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',2,'linecolor','k');
clabel(fat,guy,clevs)

subaxis(3,2,2,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,nopulse_mean_T)
map=brewermap(24,'OrRd')
colormap(map)
shading interp
%colorbar('horiz','position',[.15,.2,.7,.01]);
caxis([18 26])
m_grid('box','on','yticklabels',[])
m_gshhs_i('patch',[.7 .7 .7])
m_text(19.2,-33.5,'HYCOM non-meander','fontsize',10)
m_text(18.4,-33.3,'b)','fontweight','bold','fontsize',14)
hold on
f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),nopulse_mean_U(f,j),nopulse_mean_V(f,j),2,'k')

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',2,'linecolor','k');
clabel(fat,guy,clevs)

%load INALT

load INALT_meander_compo.mat

subaxis(3,2,3,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_T)
map=brewermap(24,'OrRd')
colormap(map)
shading interp
caxis([18 26])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
m_text(19.2,-33.5,'INALT meander','fontsize',10)
m_text(18.4,-33.3,'c)','fontweight','bold','fontsize',14)
hold on

f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),2,'k')

%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',2,'linecolor','k');
clabel(fat,guy,clevs)

subaxis(3,2,4,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,nopulse_mean_T)
map=brewermap(24,'OrRd')
colormap(map)
shading interp
%colorbar('horiz','position',[.15,.2,.7,.01]);
caxis([18 26])
m_grid('box','on','yticklabels',[])
m_gshhs_i('patch',[.7 .7 .7])
m_text(19.2,-33.5,'INALT non-meander','fontsize',10)
m_text(18.4,-33.3,'d)','fontweight','bold','fontsize',14)
hold on
f= [1:4:length(lat_s)];
j= [1:4:length(lon_s)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),nopulse_mean_U(f,j),nopulse_mean_V(f,j),2,'k')
%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',2,'linecolor','k');
clabel(fat,guy,clevs)

%load AVISO & GHRSST

load AVISO_meander_compo.mat

subaxis(3,2,5,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,pulse_mean_T)
map=brewermap(24,'OrRd')
colormap(map)
shading interp
caxis([18 26])
m_grid('box','on','xticklabels',[])
m_gshhs_i('patch',[.7 .7 .7])
m_text(19.2,-33.5,'Obs meander','fontsize',10)
m_text(18.4,-33.3,'e)','fontweight','bold','fontsize',14)
hold on

f= [1:2:length(Lat)];
j= [1:2:length(Lon)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),pulse_mean_U(f,j),pulse_mean_V(f,j),1,'k')
%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',2,'linecolor','k');
clabel(fat,guy,clevs)

subaxis(3,2,6,'spacinghoriz',0.05,'spacingvert',0.05)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon_s,lat_s,nopulse_mean_T)
map=brewermap(24,'OrRd')
colormap(map)
shading interp
%colorbar('horiz','position',[.15,.2,.7,.01]);
caxis([18 26])
m_grid('box','on','xticklabels',[],'yticklabels',[])
m_gshhs_i('patch',[.7 .7 .7])
m_text(19.2,-33.5,'Obs non-meander','fontsize',10)
m_text(18.4,-33.3,'f)','fontweight','bold','fontsize',14)
hold on
f= [1:2:length(Lat)];
j= [1:2:length(Lon)];            %Take every 4th arrow for plotting  

m_quiver((lon1(f,j)),(lat1(f,j)),nopulse_mean_U(f,j),nopulse_mean_V(f,j),1,'k')
%add bathymetry
clevs=[-200];
[fat guy]=m_tbase('contour',0:-200:-200,'linewidth',2,'linecolor','k');
clabel(fat,guy,clevs)

%plot scale vector
m_vec(4,29.75,-37.5,-1,0)
m_text(28.75,-37.25,'1m/s')

