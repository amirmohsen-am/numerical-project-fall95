function varargout = chapter2(varargin)
% chapter2 MATLAB code for chapter2.fig
%      chapter2, by itself, creates a new chapter2 or raises the existing
%      singleton*.
%
%      H = chapter2 returns the handle to a new chapter2 or the handle to
%      the existing singleton*.
%
%      chapter2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in chapter2.M with the given input arguments.
%
%      chapter2('Property','Value',...) creates a new chapter2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter2

% Last Modified by GUIDE v2.5 05-Jan-2017 15:41:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter2_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter2_OutputFcn, ...
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
movegui(gcf,'center');


% --- Executes just before chapter2 is made visible.
function chapter2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter2 (see VARARGIN)

% Choose default command line output for chapter2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% myInit
global globalHandles
globalHandles=handles;
axes(handles.axesLog);
ylim([-1, 0]);

setTable(handles);

% --- Outputs from this function are returned to the command line.
function varargout = chapter2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

value = get(handles.listbox2, 'Value');
if value == 6
	handles.uipanel1.Visible = 'on';
else
	handles.uipanel1.Visible = 'off';
end


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function generalized(data, size, handles)
equations = data(1:size,2);
initial_values = data(1+size:size+size,2);
steps = str2double(get(handles.editStep, 'String'));
chap2.generalizedNewton(equations, initial_values, steps, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value = get(handles.listbox2, 'Value');
if (value == 6 && ~all(~cellfun(@isempty, handles.uitable1.Data(:))))
	errordlg('Input data is incomplete', 'Input error');
	return;
end

axes(handles.axesPlot);
global texty
texty = 0;
cla

axes(handles.axesLog);
cla

x0 = str2double(get(handles.editLower,'String'));
x1 = str2double(get(handles.editUpper,'String'));
steps = str2double(get(handles.editStep,'String'));
F = get(handles.editFunction,'String');

syms x;
F = eval(F);

axes(handles.axesPlot)
cla
hold on;
xlim manual;

switch value
	case 1 %Bisection
		method = chap2.bisection();
	case 2 %Secant
		method = chap2.secant();
	case 3 %False-position
		method = chap2.falsePosition();
	case 4 %Fixed-point
		method = chap2.fixedPoint();
	case 5 %Newton-Raphson
		method = chap2.newton();
	case 6 %Generalized Newton-Raphson
        S = handles.edit2.String;
        generalized(handles.uitable1.Data, str2num(S), handles);
		return;
end

%mohsen
xlen = x1-x0;
xlimit = [x0-xlen/2, x1+xlen/2];
xlimit2 = [x0-xlen/5, x1+xlen/5];
xlim(xlimit2);

%fplot(@(x) 0,xlimit,'r--')
plot(xlimit, [0, 0], 'r--');
fplot(F,xlimit,'b')

sol = method.findRoot(F,x0,x1, steps, handles);
%set(handles.textAns, 'String', sol{1})




% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

val = handles.slider2.Value;
axes(handles.axesLog);
ylim([-1+val, val]);



% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

global texty
texty = 0;
function printLatex(str)
    global globalHandles
    axes(globalHandles.axesLog);
	global texty
	step = 0.05;
	text(0.1, texty-step/2, str, 'Interpreter', 'latex');
	texty = texty-step;
    axes(globalHandles.axesPlot);
	
	min = globalHandles.slider2.Min;
	if (texty < min-1)
		globalHandles.slider2.Min = min*2;
	end;

function printLatex2(str)
	printLatex(strcat('$$', str, '$$'));



function setTable(handles)
% Perhaps a small warning in WARNDLG or inside the GUI:
S = handles.edit2.String;
if ~all(ismember(S, '.1234567890'))
	warndlg('Input must be numerical');
else
	t = handles.uitable1;
	t.ColumnWidth = 'auto';
    S = str2num(S);
	t.Data = cell(S*2, 2);
    for i=1:S
        t.Data(i,1) = cellstr(sprintf('Equation #%d', i));
        % t.Data(i,1) = cellstr('<html><span style="background-color: #990000;">Shit</span></html>');
        t.Data(i+S,1) = cellstr(sprintf('a%d', i));
    end
    t.RowName = [];
    t.ColumnName = [];
    t.RowStriping = 'off';
    t.ColumnWidth = {60 200};
	t.ColumnEditable = [false, true];
end
    
    
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
setTable(handles);



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on uitable1 and none of its controls.
function uitable1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function editFunction_Callback(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFunction as text
%        str2double(get(hObject,'String')) returns contents of editFunction as a double


% --- Executes during object creation, after setting all properties.
function editFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLower_Callback(hObject, eventdata, handles)
% hObject    handle to editLower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLower as text
%        str2double(get(hObject,'String')) returns contents of editLower as a double


% --- Executes during object creation, after setting all properties.
function editLower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editUpper_Callback(hObject, eventdata, handles)
% hObject    handle to editUpper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editUpper as text
%        str2double(get(hObject,'String')) returns contents of editUpper as a double


% --- Executes during object creation, after setting all properties.
function editUpper_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editUpper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editStep_Callback(hObject, eventdata, handles)
% hObject    handle to editStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editStep as text
%        str2double(get(hObject,'String')) returns contents of editStep as a double


% --- Executes during object creation, after setting all properties.
function editStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% f = getframe(handles.axesPlot);
% image = frame2im(f);
% Fig2 = figure;
% copyobj(AxesH, Fig2);
% hgsave(Fig2, 'myFigure.fig');

F=getframe(handles.axesPlot); %select axes in GUI
figure(); %new figure
image(F.cdata); %show selected axes in new figure
saveas(gcf, 'savedfigure', 'fig'); %save figure
close(gcf); %and close it

% --------------------------------------------------------------------
function uipushtool7_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

F=getframe(handles.axesLog); %select axes in GUI
figure(); %new figure
image(F.cdata); %show selected axes in new figure
saveas(gcf, 'savedlog', 'fig'); %save figure
close(gcf); %and close it

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%error('Pogram close');


% --- Executes on button press in homebutton.
function homebutton_Callback(hObject, eventdata, handles)
% hObject    handle to homebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(handles.figure1);
main
