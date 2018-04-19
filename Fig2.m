%plots figure 2 from Malan et. al. 2018
close all;clear all; clc;
load fig2.mat

%set up vector scale arrow
vec_scale_lon=29.75;
vec_scale_lat=-37.5;

	figure(1)
	axes('position', [.72,.4,.2,.2])
	[hAx,hLine1,hLine2]=plotyy(dist(1:50)/1000,plot_speed,dist(1:50)/1000,plot_SSH_grad)
	set(hLine1,'LineWidth',2);
	set(hLine2,'LineWidth',2);
	set(hAx,'xlim',[0,500]);
	set(hAx(1),'YLim',[-1 2])
	set(hAx(2),'YLim',[-0.02 0.05])
	set(hAx(1),'YTick',[-1:1:2])
	set(hAx(2),'YTick',[-0.02 0 0.05])
	xlabel('distance from coast [km]')
	ylabel('Surface Speed [m/s]')
	set(get(hAx(2),'Ylabel'),'String','SSH gradient [m/km]')

	hold on

	[ac_mag,ac_edge_ind]=findpeaks(plot_speed,'minpeakheight',0.55);
	[ssh_mag,ssh_grad_max]=findpeaks(plot_SSH_grad,'minpeakheight',0.005);

	if isempty(ac_edge_ind)
		ac_edge_ind=ssh_grad_max(1);
			   	plot(dist(ssh_grad_max(1))/1000,SSH_grad(ssh_grad_max(1)),'o','markersize',8,'markeredgecolor','k','markerfacecolor','c')
	elseif isempty(ssh_grad_max)
		plot(dist(ac_edge_ind)/1000,surf_speed(ac_edge_ind),'o','markersize',8,'markeredgecolor','k','markerfacecolor','g')
				ssh_grad_max=ac_edge_ind(1);
	else
	 plot(dist(ac_edge_ind)/1000,plot_speed(ac_edge_ind),'o','markersize',8,'markeredgecolor','k','markerfacecolor','g')
	 hold on
	 [ssh_mag,ssh_grad_max]=findpeaks(plot_SSH_grad,'minpeakheight',0.005);
	plot(dist(ssh_grad_max(1))/1000,plot_SSH_grad(ssh_grad_max(1)),'o','markersize',8,'markeredgecolor','k','markerfacecolor','c')
end
	ac_core_ind=nearestpoint(ssh_grad_max(1),ac_edge_ind);
	hold on
	h=vline((dist(ac_edge_ind(ac_core_ind))/1000))
	hold off

	axes('position', [.1,.05,.55,.9])
	m_proj('mercator','longitude',[18 30],'latitude', [-38 -33])
	m_pcolor(lon_s,lat_s,plot_temp)
	map=brewermap(24,'OrRd')
	colormap(map)
	shading interp
	colorbar('horiz','position',[.1,.2,.55,.01]);
	caxis([16 28])
	m_grid('box','on')
	m_gshhs_i('patch',[.7 .7 .7])
	hold on

	%or absolute surf currents
	m_vec(2,lon,lat,plot_utot,plot_vtot)
	hold on
	%plot scale vector
	m_vec(2,vec_scale_lon,vec_scale_lat,-1,0)
	m_text(28.75,-37.25,'1m/s')

	clevs=[0.1,0.2,0.3,0.4]
	 	[z,h]=m_contour(lon_s,lat_s,plot_ssh,clevs)
		clabel(z,h,0.2)
		hold on
		m_plot(lon(ac_edge_ind),lat(ac_edge_ind),'o','markersize',8,'markeredgecolor','k','markerfacecolor','g')
		m_plot(lon(ssh_grad_max(1)),lat(ssh_grad_max(1)),'o','markersize',6,'markeredgecolor','k','markerfacecolor','c')
	hold off



