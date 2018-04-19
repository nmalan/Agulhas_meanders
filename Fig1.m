%plots eke from .mat files produced by the ****_eke.m routines
% N. Malan, UCT, July 2017

close all;clear all;clc

%load data
load aviso_kinetic_1997_2007.mat
ekemean=nanmean(eke,3);
mkemean=nanmean(mke,3);
figure(1)
subplot(3,1,1)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon,lat,ekemean)
map='jet',(30);
colormap(map)
shading interp
%colorbar('horiz','position',[.15,.2,.7,.01]);
caxis([0 0.3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
annotation(gcf,'textbox',[0.37 0.86 0.088 0.0619],'String',{'Aviso'},'EdgeColor','none','fontweight','bold');
hold on
%m_contour(lon_obs,lat_obs,temp_obs_clim,[21 23],'k')
hold off

%load data
load hycom_kinetic_1997_2007.mat
ekemean=nanmean(eke,3);
mkemean=nanmean(mke,3);
subplot(3,1,2)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon,lat,ekemean)
colormap(map)
shading interp
%colorbar('horiz','position',[.15,.2,.7,.01]);
caxis([0 0.3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
annotation(gcf,'textbox',[0.37 0.56 0.088 0.0619],'String',{'HYCOM'},'EdgeColor','none','fontweight','bold');
hold on
%m_contour(lon_s,lat_s,temp_hycom_clim,[21 23],'k')
hold off

%load data
load inalt_kinetic_1997_2007.mat
ekemean=nanmean(eke,3);
mkemean=nanmean(mke,3);
subplot(3,1,3)
m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
m_pcolor(lon,lat,ekemean)
colormap(map)
shading interp
%colorbar('horiz','position',[.15,.2,.7,.01]);
caxis([0 0.3])
m_grid('box','on')
m_gshhs_i('patch',[.7 .7 .7])
annotation(gcf,'textbox',[0.37 0.265 0.088 0.0619],'String',{'INALT01'},'EdgeColor','none','fontweight','bold');
hold on
%m_contour(lon_n,lat_n,temp_inalt_clim,[21 23],'k')
hold off

h=colorbar('vertical');
set(h, 'Position', [.75 .2 .01 .6])
set(get(h,'ylabel'),'String','Eddy Kinetic Energy [m^2.s^-^2]')

%print -depsc EKE_clim_combined.eps
