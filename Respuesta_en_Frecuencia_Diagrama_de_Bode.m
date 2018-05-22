function varargout = Respuesta_en_Frecuencia_Diagrama_de_Bode(varargin)
% RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE MATLAB code for Respuesta_en_Frecuencia_Diagrama_de_Bode.fig
%      RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE, by itself, creates a new RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE or raises the existing
%      singleton*.
%
%      H = RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE returns the handle to a new RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE or the handle to
%      the existing singleton*.
%
%      RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE.M with the given input arguments.
%
%      RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE('Property','Value',...) creates a new RESPUESTA_EN_FRECUENCIA_DIAGRAMA_DE_BODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Respuesta_en_Frecuencia_Diagrama_de_Bode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Respuesta_en_Frecuencia_Diagrama_de_Bode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Respuesta_en_Frecuencia_Diagrama_de_Bode

% Last Modified by GUIDE v2.5 20-May-2018 23:31:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Respuesta_en_Frecuencia_Diagrama_de_Bode_OpeningFcn, ...
                   'gui_OutputFcn',  @Respuesta_en_Frecuencia_Diagrama_de_Bode_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before Respuesta_en_Frecuencia_Diagrama_de_Bode is made visible.
function Respuesta_en_Frecuencia_Diagrama_de_Bode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Respuesta_en_Frecuencia_Diagrama_de_Bode (see VARARGIN)

% Choose default command line output for Respuesta_en_Frecuencia_Diagrama_de_Bode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% actualiza la interfas al abrir el programa
Orden_del_Polinomio_Polos=1;%determina el orden del polinomi de ceros que ingresa el usuario
Tamano_de_la_tabla_Polos=cell(Orden_del_Polinomio_Polos+1,1);%crea la tabla de una columna y el numero de filas es igual al orden del polinomio
Tamano_de_la_tabla_Polos(:,:)={'1',' 5'};%pone todos los espacios de la tabla en blanco
set(handles.Tabla_Polos,'Data',Tamano_de_la_tabla_Polos);%muestra la tabla creada en la interfas
set(handles.Tabla_Polos,'ColumnEditable',true(1,Orden_del_Polinomio_Polos+1));%asigna a todos los campos de la tabla como editables para que el usuario ingrese los coeficientes
Orden_del_Polinomio_Ceros=0;%determina el orden del polinomi de polos que ingresa el usuario
Tamano_de_la_tabla_Ceros=cell(Orden_del_Polinomio_Ceros+1,1);%crea la tabla de una columna y el numero de filas es igual al orden del polinomio
Tamano_de_la_tabla_Ceros(:,:)={'5'};%pone todos los espacios de la tabla en blanco
set(handles.Tabla_Ceros,'Data',Tamano_de_la_tabla_Ceros);%muestra la tabla creada en la interfas
set(handles.Tabla_Ceros,'ColumnEditable',true(1,Orden_del_Polinomio_Ceros+1));%asigna a todos los campos de la tabla como editables para que el usuario ingrese los coeficientes
% justes de las graficas
% Bode
subplot(handles.grafica_de_bode);% nuestra la grafica de la magnitud
hold off;
grid on
title('Diagrama de Bode');% da el titulo a la grafica
xlabel('Frecuencia (rad/s)');%le da titulo a el eje x
 %Polos y ceros
subplot(handles.grafica_de_polos_ceros)
grid on
title('Diagrama de Polos y Ceros');% da el titulo a la grafica
xlabel('Frecuencia (rad/s)');%le da titulo a el eje x
ylabel('Magnitud');% le da titulo al eje y

% UIWAIT makes Respuesta_en_Frecuencia_Diagrama_de_Bode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Respuesta_en_Frecuencia_Diagrama_de_Bode_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function N_Ceros_Callback(hObject, eventdata, handles)
% hObject    handle to N_Ceros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%Rutina de ingreso de coeficentes
Orden_del_Polinomio_Ceros=str2double(get(handles.N_Ceros,'String'));%determina el orden del polinomi de polos que ingresa el usuario
Tamano_de_la_tabla_Ceros=cell(Orden_del_Polinomio_Ceros+1,1);%crea la tabla de una columna y el numero de filas es igual al orden del polinomio
Tamano_de_la_tabla_Ceros(:,:)={'0'};%pone todos los espacios de la tabla en blanco
set(handles.Tabla_Ceros,'Data',Tamano_de_la_tabla_Ceros);%muestra la tabla creada en la interfas
set(handles.Tabla_Ceros,'ColumnEditable',true(1,Orden_del_Polinomio_Ceros+1));%asigna a todos los campos de la tabla como editables para que el usuario ingrese los coeficientes

%%
% Hints: get(hObject,'String') returns contents of N_Ceros as text
%        str2double(get(hObject,'String')) returns contents of N_Ceros as a double


% --- Executes during object creation, after setting all properties.
function N_Ceros_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_Ceros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = waitbar(0,'Procesando...');% abre la barra de espera
pause(0.5)
Ceros=str2double(get(handles.Tabla_Ceros,'Data'));%Estrae los valores valores de la tabla y los transforma en numeros
waitbar(0.03);
Polos=str2double(get(handles.Tabla_Polos,'Data'));%Estrae los valores valores de la tabla y los transforma en numeros
waitbar(0.06);
Frecuencia_minima=log10(str2num(get(handles.w_inicial,'String')));% determina el logaritmo en base de de la frecuencia minima
waitbar(0.09);
Frecuencia_maxima=log10(str2num(get(handles.w_final,'String')));% determina el logaritmo en base de de la frecuencia maxima
waitbar(0.12);
numero_de_puntos=str2num(get(handles.numero_de_puntos,'String'));% determina el numero de puntos a calcular
if numero_de_puntos>=10^6
    numero_de_puntos=10^5;
end
waitbar(0.15);
W=logspace(Frecuencia_minima,Frecuencia_maxima,numero_de_puntos); %genera un vector con el barrido de frecuencias a realizar con espacioado logaritmico
waitbar(0.21);
[Magnitud,Fase]=BODE(Ceros.',Polos.',W,h);%usa la funcion de matlab 'bode' para calcular la amplitud y face
waitbar(0.6);
F_Polos=Crea_Polinomios(Polos.');%crea el polinomio de polos
waitbar(0.65);
F_Ceros=Crea_Polinomios(Ceros.');%crea el polinomio de ceros
waitbar(0.7);
Funcio_Transferencia=F_Ceros/F_Polos; %crea la funcion de tranferencia
%% Muestra la funcion que se ha ingresado
set(handles.funcion_Polos,'string',char(F_Polos));%muestra el polinomio de polos
set(handles.funcion_Ceros,'string',char(F_Ceros));%muestra el polinomio de ceros
waitbar(0.75);
%% Ancho de banda
[ w1,w2,MAG1,MAG2,AB,text,tipo_filtro ] = Ancho_Banda(Funcio_Transferencia,Magnitud,W);
waitbar(0.8);
set(handles.Texto_Ancho_Banda,'string',text);% cambia el texto entre ancho de banda y frecuencia de corte segun corresponda al tipo de filtro
waitbar(0.9);
set(handles.ancho_banda,'string',AB);%muestra el ancho de banda
waitbar(1);
set(handles.Tipo_Filtro,'string',tipo_filtro);%muestra al usuario a que tipo de filtro corresponde la funcion de transferencia
close(h)
%% Gráficas
%Bode
MAG0=20*log10(abs(min(Magnitud)));
MAG1=20*log10(abs(MAG1));
MAG2=20*log10(abs(MAG2));
subplot(handles.grafica_de_bode),semilogx(W,20*log10(Magnitud),'g',W,Fase,'r',[w1,w1],[MAG0,MAG1],'b',[w2,w2],[MAG0,MAG2],'b');% nuestra la grafica de la magnitud
legend('Magnitud(db)', 'Fase(rad)', 'Frecuencia de corte');
grid on
title('Diagrama de Bode');% da el titulo a la grafica
xlabel('Frecuencia (rad/s)');%le da titulo a el eje x
%polos y ceros
subplot(handles.grafica_de_polos_ceros),semilogx(W,Magnitud,'b');
raices_Polos=raices(Polos.');%determina las raices de los polos
raices_Ceros=raices(Ceros.');%determina las raices de los polos
F_Ceros=inline(F_Ceros);
F_Polos=inline(F_Polos);
if raices_Polos(1,1)~=0 && raices_Ceros(1,1)~=0 % cuando numerador y denominador tienen raices
    subplot(handles.grafica_de_polos_ceros),plot(real(raices_Polos(2,:)),real(F_Polos(real(raices_Polos(2,:)))),'r*',abs(raices_Ceros(2,:)),real(F_Ceros(abs(raices_Ceros(2,:)))),'go');
    legend('Polos', 'Ceros') % Pone una leyenda
elseif raices_Polos(1,1)~=0 && raices_Ceros(1,1)==0 % solo numerador tiene raices
    subplot(handles.grafica_de_polos_ceros),plot(real(raices_Polos(2,:)),real(F_Polos(real(raices_Polos(2,:)))),'r*');
    legend('Polos') % Pone una leyenda
elseif raices_Polos(1,1)==0 && raices_Ceros(1,1)~=0% solo denominador tiene raices
    subplot(handles.grafica_de_polos_ceros),plot(real(raices_Ceros(2,:)),real(F_Ceros(real(raices_Ceros(2,:)))),'go');
    legend('Ceros') % Pone una leyenda
end
grid on
title('Diagrama de Polos y Ceros');% da el titulo a la grafica
xlabel('Frecuencia (rad/s)');%le da titulo a el eje x
ylabel('Magnitud');% le da titulo al eje y



%%

function N_Polos_Callback(hObject, eventdata, handles)
% hObject    handle to N_Ceros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%Rutina de ingreso de coeficientes
Orden_del_Polinomio_Polos=str2double(get(handles.N_Polos,'String'));%determina el orden del polinomi de ceros que ingresa el usuario
Tamano_de_la_tabla_Polos=cell(Orden_del_Polinomio_Polos+1,1);%crea la tabla de una columna y el numero de filas es igual al orden del polinomio
Tamano_de_la_tabla_Polos(:,:)={'0'};%pone todos los espacios de la tabla en blanco
set(handles.Tabla_Polos,'Data',Tamano_de_la_tabla_Polos);%muestra la tabla creada en la interfas
set(handles.Tabla_Polos,'ColumnEditable',true(1,Orden_del_Polinomio_Polos+1));%asigna a todos los campos de la tabla como editables para que el usuario ingrese los coeficientes

%%
% Hints: get(hObject,'String') returns contents of N_Ceros as text
%        str2double(get(hObject,'String')) returns contents of N_Ceros as a double


% --- Executes during object creation, after setting all properties.
function N_Polos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_Ceros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function w_inicial_Callback(hObject, eventdata, handles)
% hObject    handle to w_inicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_inicial as text
%        str2double(get(hObject,'String')) returns contents of w_inicial as a double


% --- Executes during object creation, after setting all properties.
function w_inicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_inicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_final_Callback(hObject, eventdata, handles)
% hObject    handle to w_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_final as text
%        str2double(get(hObject,'String')) returns contents of w_final as a double


% --- Executes during object creation, after setting all properties.
function w_final_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numero_de_puntos_Callback(hObject, eventdata, handles)
% hObject    handle to numero_de_puntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numero_de_puntos as text
%        str2double(get(hObject,'String')) returns contents of numero_de_puntos as a double


% --- Executes during object creation, after setting all properties.
function numero_de_puntos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numero_de_puntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function grafica_de_bode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grafica_de_bode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate grafica_de_bode


% --- Executes during object creation, after setting all properties.
function grafica_de_polos_ceros_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grafica_de_polos_ceros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate grafica_de_polos_ceros


% --- Executes during object creation, after setting all properties.
function funcion_Polos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion_Polos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function Polinomio=Crea_Polinomios(Vector)
a=size(Vector);%determina la cantidad de coeficientes
Orden_del_polinomio=a(1,2)-1;% determina el grado del polinomio
syms s %permite trabajar con s como una variable
Polinomio=0; %se define la variable polinomio
n=Orden_del_polinomio;%define la variable n
for i=0:Orden_del_polinomio
    Polinomio=(s^i)*Vector(n+1)+Polinomio;%se crea el polinomio
    n=n-1;
end
function Resultados=raices(Vector)
t=size(Vector);
if t(1,2)==1 %polinomios de grado 0 no tienen raices
    Resultados(1,:)=0;%numero de raices
    Resultados(2,:)=0;
else
    Resultados(2,:)=roots(Vector);%raices
    b=size(Resultados(2,:));
    Resultados(1,:)=b(1,1);%numero de raices
end
function [w1,w2,MAG1,MAG2, AB,text,tipo_filtro ] = Ancho_Banda(funcion,MAG,W)
syms s
f=inline(funcion);
H0=round(abs(f(0.000000000000000000000001*i))); % evalua la funcion en 0
H1=round(abs(f(100000000000000000000000*i)));%evalua la funcion en infinito
if H0>=1 && H1<=0 %pasa baja
    posicion=encuentra_banda_pasante(MAG.',1);%encuentra la posicion de W1 y W2
    AB=round(abs(W(posicion(1))));
    text ='Frecuencia de corte';
    tipo_filtro='Tipo de Filtro: Pasa Bajas';
    w1=W(posicion(1));
    MAG1=MAG(posicion(1));
    w2=0;
    MAG2=1;
elseif H0<=0 && H1>=1 %pasa alta
    posicion=encuentra_banda_pasante(MAG.',2),%encuentra la posicion de W1 y W2
    AB=round(abs(W(posicion(1))));
    text ='Frecuencia de corte';
    tipo_filtro='Tipo de Filtro: Pasa Altas';
    w2=W(posicion(1));
    MAG2=MAG(posicion(1));
    w1=0;
    MAG1=1;
elseif H0<=0 && H1<=0% pasa banda
    posicion=encuentra_banda_pasante(MAG.',3);%encuentra la posicion de W1 y W2
    AB=round(abs(W(posicion(1,2))-W(posicion(1,1))),2); %Calcula el ancho de banda
    text ='Ancho de Banda';
    tipo_filtro='Tipo de Filtro: Pasa Banda';
    w1=W(posicion(1,1));
    MAG1=MAG(posicion(1,1));
    w2=W(posicion(1,2));
    MAG2=MAG(posicion(1,2));
elseif H0>=1 && H1>=1% rechasa banda
    posicion=encuentra_banda_rechazada(MAG.');%encuentra la posicion de W1 y W2
    AB=round(abs(W(posicion(1,2))-W(posicion(1,1))),2);%Calcula el ancho de banda
    text ='Ancho de Banda';
    tipo_filtro='Tipo de Filtro: Rechaza Banda';
    w1=W(posicion(1,1));
    MAG1=MAG(posicion(1,1));
    w2=W(posicion(1,2));
    MAG2=MAG(posicion(1,2));
end


% --- Executes when entered data in editable cell(s) in Tabla_Polos.
function Tabla_Polos_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Tabla_Polos (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function funcion_Ceros_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion_Ceros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function [MAG,Fase]=BODE(numerador_polos,denominador_Ceros,Vector_frecuencia,h)
waitbar(0.25);
f=inline(Crea_Polinomios(numerador_polos)/Crea_Polinomios(denominador_Ceros));%forma la función de tranferencia apartir de los coeficientes
waitbar(0.3);
Resultados=f(Vector_frecuencia*i);
waitbar(0.4);
MAG=(abs(Resultados));
waitbar(0.5);
Fase=angle(Resultados);
%%se encarga de encontrar la posicion donde esta las frecuencias W1 y w2 de
%%la banda pasante
function posicion=encuentra_banda_pasante(MAG,tipo)
a=size(MAG);
if tipo==1 || tipo==3 %pasa bajos y pasabanda
    for i=1:a(1,1)%encuentra la posicion de W1
        if MAG(i,1)>=max(MAG)/sqrt(2)
            posicion(1,1)=i;
            i=a(1,1);
        end
    end
end
if tipo==2 || tipo ==3%pasa altos y pasabanda
    for i=a(1,1):-1:1%encuentra la posicion de W2
        if MAG(i,1)>=max(MAG)/sqrt(2)
            posicion(1,2)=i;
            i=1;
        end
        
    end
end
%%se encarga de encontrar la posicion donde esta las frecuencias W1 y w2 de
%%la banda rechazada
function posicion=encuentra_banda_rechazada(MAG)
a=size(MAG);
for i=1:a(1,1) %encuentra la posicion de W1
    if MAG(i,1)<=min(MAG)*sqrt(2)
        posicion(1,1)=i;
        i=a(1,1);
    end
end
for i=a(1,1):-1:1%encuentra la posicion de W2
    if MAG(i,1)<=min(MAG)*sqrt(2)
        posicion(1,2)=i;
        i=1;
    end
    
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
