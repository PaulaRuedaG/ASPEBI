function export2 = exportdata
    %Crear entorno de trabajo
    d = dialog('Position',[500 250 270 276],'Name','Exportar Datos');
    %Crear titulo y definir nombre de la carpeta
    lbl = uicontrol('Parent',d,'Style','text','Position',[35 250 200 15],...
           'String','Nombre del proyecto');
    txt = uicontrol('Parent',d,'Style','edit','Position',[40 230 200 15]);
    %Crear checkbox
    Video = uicontrol('Parent',d,'Style','checkbox','Position',[50 200 200 15],...
       'String','Video de la reproducción 3D');
    Registro = uicontrol('Parent',d,'Style','checkbox','Position',[50 175 200 15],...
       'String','Registro del Usuario');
    Marcha = uicontrol('Parent',d,'Style','checkbox','Position',[50 150 200 15],...
       'String','Informe de Análisis de Marcha');
    Mvnx = uicontrol('Parent',d,'Style','checkbox','Position',[50 125 200 15],...
       'String','Información del archivo (.mvnx)');
    DAntro = uicontrol('Parent',d,'Style','checkbox','Position',[50 100 200 15],...
       'String','Datos Antropométricos');
   export2.eleccion=[0;0;0;0;0];
   %Boton de carpeta
    btn = uicontrol('Parent',d,'Style','pushbutton','Position',[40, 50, 200, 20],'String','Ubicar Carpeta','Callback',@carpeta);
   %Espere a que d se cierre antes de ejecutar hasta el final
    uiwait(d);
  
    
       function carpeta(btn,event)
          txt2=char(txt.String);
          content = uigetdir('','Save Folder');
          fullname = [content,'\',txt2];
          mkdir(fullname)
           
          export2.eleccion=[Video.Value;Registro.Value;Marcha.Value;Mvnx.Value;DAntro.Value];
          export2.ubicacion=fullname;
               
           close(d)   
       end
end