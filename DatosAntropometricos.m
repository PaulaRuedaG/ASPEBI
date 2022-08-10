
function DatosAntropometricos
% Create a figure window
fig = uifigure;

% GUI
ax = uiaxes('Parent',fig,...
            'Units','pixels',...
            'Position', [340, 50, 170, 350]);   
%Ingresar
Ingresar = uilabel(fig,'Position',[30 360 500 22]);Ingresar.Text='Please enter the following data';
%EDITABLES  
Estatura = uieditfield(fig,'numeric','Position',[170 310 100 22]);
AnchoCadera = uieditfield(fig,'numeric','Position',[170 280 100 22]);
AlturaCadera = uieditfield(fig,'numeric','Position',[170 250 100 22]);
AlturaRodilla = uieditfield(fig,'numeric','Position',[170 220 100 22]);
AlturaTobillo = uieditfield(fig,'numeric', 'Position',[170 190 100 22]);
LongitudPie  = uieditfield(fig,'numeric','Position',[170 160 100 22]);
Peso = uieditfield(fig,'numeric','Position',[170 130 100 22]);
%TEXTO          
Estat = uilabel(fig,'Position',[50 310 120 22]);Estat.Text='Stature(cm):';
ACadera = uilabel(fig,'Position',[50 280 120 22]);ACadera.Text='Hip width(cm):';
AlCadera = uilabel(fig,'Position',[50 250 120 22]);AlCadera.Text='Hip height(cm):';
ARodilla = uilabel(fig,'Position',[50 220 120 22]);ARodilla.Text='Knee height(cm):';
Atobillo = uilabel(fig,'Position',[50 190 120 22]);Atobillo.Text='Ankle height(cm):';
LPie = uilabel(fig,'Position',[50 160 120 22]);LPie.Text='Foot length(cm):';
Pesolabel = uilabel(fig,'Position',[50 130 120 22]);Pesolabel.Text='Weight(kg):';
%BOTON
Save = uibutton(fig,'push','Text', 'Save',...
               'Position',[110, 70, 100, 22],...
               'ButtonPushedFcn', @(Save,event) ...
               plotButtonPushed(Save,Estatura,AnchoCadera,AlturaCadera,AlturaRodilla,AlturaTobillo,LongitudPie,Peso,ax));
end

% Create the function for the ButtonPushedFcn callback
function plotButtonPushed(Save,Estatura,AnchoCadera,AlturaCadera,AlturaRodilla,AlturaTobillo,LongitudPie,Peso,ax)
Data=[Estatura.Value;AnchoCadera.Value;AlturaCadera.Value;AlturaRodilla.Value;AlturaTobillo.Value;LongitudPie.Value;Peso.Value];
   if  (Data(1,1)>0)&&(Data(2,1)>0)&&(Data(3,1)>0)&&(Data(4,1)>0)&&(Data(5,1)>0)&&(Data(6,1)>0)
   xl=[-(Data(2,1)/2)-5,-(Data(2,1)/2),-(Data(2,1)/2),-(Data(2,1)/2),0,0,0,(Data(2,1)/2),(Data(2,1)/2),(Data(2,1)/2),(Data(2,1)/2)-5];
   yl=[(Data(5,1))-5,(Data(5,1)),(Data(4,1)),Data(3,1),Data(3,1),Data(3,1)+8,Data(3,1),Data(3,1),(Data(4,1)),(Data(5,1)),(Data(5,1))-5];
   plot(ax,xl,yl,'k')
   hold(ax,"on")
   scatter(ax,xl,yl,'k','x')
   xlim(ax,([-25 25]))
   ylim(ax,([0 100]))
   clc
   else 
   end
   save Antropometricos.mat Data
end