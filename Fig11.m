%plots tracer experiment results, for JGR paper.
%N. Malan, Cape Town, April 2018

close all ; clear all ; clc

%set up plotting

lonmin=18
lonmax=32
latmin=-38
latmax=-30
map = cmocean('speed',10)

%load tracer and ssh data 

%plot day 1

load tracer_1.mat

subaxis(2,3,1,'spacinghoriz',0,'spacingvert',0)
m_proj('Mercator','longitude',[lonmin lonmax],'latitude', [latmin latmax])
 m_pcolor(lon,lat,squeeze(tracer(8,:,:)))
 caxis([0 1])
 shading interp
 colormap(map)
  m_text(19.5,-31.5,'day 1','fontsize',15)
   m_grid('box','fancy','tickdir','in','yticklabels',[],'xtick',([21 24 27 30]))
 m_gshhs_i('patch',[.7 .7 .7])
 m_gshhs_i('speckle','color','k');
 set(gcf,'color','white');
 hold on
 [fa gu]=m_contour(lon,lat,ssh,[0.5 0.5],'linecolor','k')
 clabel(fa,gu,[0.5]);
 
 %plot day 4
 
 load tracer_2.mat
 
subaxis(2,3,2,'spacinghoriz',0,'spacingvert',0)
  m_proj('Mercator','longitude',[lonmin lonmax],'latitude', [latmin latmax])
   m_pcolor(lon,lat,squeeze(tracer(8,:,:)))
   caxis([0 1])
   shading interp
  colormap(map)
   m_text(19.5,-31.5,'day 4','fontsize',15)
     m_grid('box','fancy','tickdir','in','yticklabels',[],'xtick',([21 24 27 30]))
   m_gshhs_i('patch',[.7 .7 .7])
   m_gshhs_i('speckle','color','k');
   set(gcf,'color','white');
 hold on
 [fa gu]=m_contour(lon,lat,ssh,[0.5 0.5],'linecolor','k')
 clabel(fa,gu,[0.5]);
 
 %plot day 7
 
  load tracer_3.mat
 
subaxis(2,3,3,'spacinghoriz',0,'spacingvert',0)
  m_proj('Mercator','longitude',[lonmin lonmax],'latitude', [latmin latmax])
   m_pcolor(lon,lat,squeeze(tracer(8,:,:)))
   caxis([0 1])
   shading interp
  colormap(map)
   m_text(19.5,-31.5,'day 7','fontsize',15)
    m_grid('box','fancy','tickdir','in','yaxislocation','right','xtick',([21 24 27 30]))
   m_gshhs_i('patch',[.7 .7 .7])
   m_gshhs_i('speckle','color','k');
   set(gcf,'color','white');
 hold on
 [fa gu]=m_contour(lon,lat,ssh,[0.5 0.5],'linecolor','k')
 clabel(fa,gu,[0.5]);
 
 %plot day 10
 
  load tracer_4.mat
  
subaxis(2,3,4,'spacinghoriz',0,'spacingvert',0)
   m_proj('Mercator','longitude',[lonmin lonmax],'latitude', [latmin latmax])
    m_pcolor(lon,lat,squeeze(tracer(8,:,:)))
    caxis([0 1])
    shading interp
  colormap(map)
   m_text(19.5,-31.5,'day 10','fontsize',15)
    m_grid('box','fancy','xticklabels',[],'yticklabels',[])
    m_gshhs_i('patch',[.7 .7 .7])
    m_gshhs_i('speckle','color','k');
    set(gcf,'color','white');
 hold on
 [fa gu]=m_contour(lon,lat,ssh,[0.5 0.5],'linecolor','k')
 clabel(fa,gu,[0.5]);
 
 %plot day 14
 
  load tracer_5.mat
  
subaxis(2,3,5,'spacinghoriz',0,'spacingvert',0)
   m_proj('Mercator','longitude',[lonmin lonmax],'latitude', [latmin latmax])
    m_pcolor(lon,lat,squeeze(tracer(8,:,:)))
    caxis([0 1])
    shading interp
  colormap(map)
   m_text(19.5,-31.5,'day 14','fontsize',15)
    m_grid('box','fancy','xticklabels',[],'yticklabels',[])
    m_gshhs_i('patch',[.7 .7 .7])
    m_gshhs_i('speckle','color','k');
    set(gcf,'color','white');
 hold on
 [fa gu]=m_contour(lon,lat,ssh,[0.5 0.5],'linecolor','k')
 clabel(fa,gu,[0.5]);
 
 %plot final situation after 4 weeks
 
   load tracer_6.mat
 
   subaxis(2,3,6,'spacinghoriz',0,'spacingvert',0)
    m_proj('Mercator','longitude',[lonmin lonmax],'latitude', [latmin latmax])
     m_pcolor(lon,lat,squeeze(tracer(8,:,:)))
     caxis([0 1])
     shading interp
     colormap(map)
      m_text(19.5,-31.5,'week 4','fontsize',15)
     m_grid('box','fancy','xticklabels',[],'yaxislocation','right')
     m_gshhs_i('patch',[.7 .7 .7])
     m_gshhs_i('speckle','color','k');
     set(gcf,'color','white');
    hold on
    [fa gu]=m_contour(lon,lat,ssh,[0.5 0.5],'linecolor','k')
    clabel(fa,gu,[0.5]);		
  
     h=colorbar('horiz','position',[.15,.45,.7,.01]);	
     xlabel(h,'tracer concentration at 64m')
 