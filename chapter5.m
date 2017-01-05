function varargout = chapter5(varargin)
% chapter5 MATLAB code for chapter5.fig
%      chapter5, by itself, creates a new chapter5 or raises the existing
%      singleton*.
%
%      H = chapter5 returns the handle to a new chapter5 or the handle to
%      the existing singleton*.
%
%      chapter5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in chapter5.M with the given input arguments.
%
%      chapter5('Property','Value',...) creates a new chapter5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter5

% Last Modified by GUIDE v2.5 05-Jan-2017 23:05:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter5_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter5_OutputFcn, ...
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



% --- Executes just before chapter5 is made visible.
function chapter5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter5 (see VARARGIN)

% Choose default command line output for chapter5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% myInit
global globalHandles
globalHandles=handles;
axes(handles.axesLog);
ylim([-1, 0]);


% --- Outputs from this function are returned to the command line.
function varargout = chapter5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

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
	laxes = gca;
    axes(globalHandles.axesLog);
	global texty
	step = 0.05;
	text(0.05, texty-step/2, str, 'Interpreter', 'latex');
	texty = texty-step;
    axes(laxes);
	
	min = globalHandles.slider2.Min;
	if (texty < min-1)
		globalHandles.slider2.Min = min*2;
	end;

function printLatex2(str)
	printLatex(strcat('$', str, '$'));


% --- Executes on key press with focus on uitable1 and none of its controls.
function uitable1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3

value = hObject.Value;
if value == 1
	handles.uipanel11.Visible = 'on';
else
	handles.uipanel11.Visible = 'off';
end



% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes when selected object is changed in buttonMethod.
function buttonMethod_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttonMethod 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.part1)
	handles.uipanel1.Visible = 'on';
	handles.uipanel2.Visible = 'off';
else	
	handles.uipanel1.Visible = 'off';
	handles.uipanel2.Visible = 'on';
end



% --- Executes on button press in homebutton.
function homebutton_Callback(hObject, eventdata, handles)
% hObject    handle to homebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(handles.figure1);
main


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

part1 = 0;
if (handles.buttonMethod.SelectedObject == handles.part1)
	part1 = 1;
end

method = 0;
if part1 == 1
	method = handles.listbox3.Value-1;
else
	method = handles.listbox4.Value+7;
end

% chapter5(F, initial, h, n, steps, y, method)
F = handles.editFunction.String;
h = str2num(handles.editH.String);
n = str2num(handles.editN.String);
steps = str2num(handles.editSteps.String);
y = str2num(handles.editSteps.String);
x0 = str2num(handles.editX0.String);
y0 = str2num(handles.editY0.String);
yp0 = str2num(handles.editYp0.String);
initial = [x0 y0 yp0];

steps = NaN;

out = chap5.chap5(F, initial, h, n, steps, y, method);
printLatex2(out);

function editSteps_Callback(hObject, eventdata, handles)
% hObject    handle to editSteps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSteps as text
%        str2double(get(hObject,'String')) returns contents of editSteps as a double


% --- Executes during object creation, after setting all properties.
function editSteps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSteps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editN_Callback(hObject, eventdata, handles)
% hObject    handle to editN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editN as text
%        str2double(get(hObject,'String')) returns contents of editN as a double

% --- Executes during object creation, after setting all properties.
function editN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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



function editX0_Callback(hObject, eventdata, handles)
% hObject    handle to editX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editX0 as text
%        str2double(get(hObject,'String')) returns contents of editX0 as a double


% --- Executes during object creation, after setting all properties.
function editX0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editY0_Callback(hObject, eventdata, handles)
% hObject    handle to editY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editY0 as text
%        str2double(get(hObject,'String')) returns contents of editY0 as a double


% --- Executes during object creation, after setting all properties.
function editY0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editH_Callback(hObject, eventdata, handles)
% hObject    handle to editH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editH as text
%        str2double(get(hObject,'String')) returns contents of editH as a double


% --- Executes during object creation, after setting all properties.
function editH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYp0_Callback(hObject, eventdata, handles)
% hObject    handle to editYp0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYp0 as text
%        str2double(get(hObject,'String')) returns contents of editYp0 as a double


% --- Executes during object creation, after setting all properties.
function editYp0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYp0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editY_Callback(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editY as text
%        str2double(get(hObject,'String')) returns contents of editY as a double


% --- Executes during object creation, after setting all properties.
function editY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
