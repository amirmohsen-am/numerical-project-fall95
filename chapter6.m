function varargout = chapter6(varargin)
% chapter6 MATLAB code for chapter6.fig
%      chapter6, by itself, creates a new chapter6 or raises the existing
%      singleton*.
%
%      H = chapter6 returns the handle to a new chapter6 or the handle to
%      the existing singleton*.
%
%      chapter6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in chapter6.M with the given input arguments.
%
%      chapter6('Property','Value',...) creates a new chapter6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter6

% Last Modified by GUIDE v2.5 05-Jan-2017 22:55:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter6_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter6_OutputFcn, ...
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



% --- Executes just before chapter6 is made visible.
function chapter6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter6 (see VARARGIN)

% Choose default command line output for chapter6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% myInit
global globalHandles
globalHandles=handles;
axes(handles.axesLog);
ylim([-1, 0]);

n = 4;
handles.editN.String = num2str(n);
rname = cell(1, n);
cname = cell(1, n+1);
for i = 1:n
	rname{i} = sprintf('eq#%d', i);
	cname{i} = sprintf('a%d', i);
end
cname{n+1} = 'c';
t = handles.uitable1;
t.ColumnWidth = num2cell(ones(1, n+1)*30);
t.Data = [1 -2 2 1 12; 0 0 -3 -2 5; 2 -1 3 4 10; 5 1 2 0 3];
t.RowName = rname;
t.ColumnName = cname;
t.ColumnEditable = true;





% --- Outputs from this function are returned to the command line.
function varargout = chapter6_OutputFcn(hObject, eventdata, handles) 
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
if value == 6 || value == 7
	handles.uipanel9.Visible = 'on';
else
	handles.uipanel9.Visible = 'off';
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

if (handles.buttonMethod.SelectedObject == handles.part1)
	steps = str2num(handles.editSteps.String);
	initial = eval(handles.editGuess.String);
	
	data = handles.uitable1.Data;
	n = length(data)-1;
	A = data(:,1:n);
	B = data(:,n+1);
	
	
	value = handles.listbox3.Value;
	switch value
		case 1 %Cramer
			chap6.cramer(A, B, @printLatex2);
		case 2 %Gausse Elimination
			chap6.gauss(A, B, @printLatex2);
		case 3 %LU Doolittle
			chap6.luDoolittle(A, B, @printLatex2);
		case 4 %LU Cholesky
			chap6.luCholesky(A, B, @printLatex2);
		case 5 %LU Crout
			chap6.luCrout(A, B, @printLatex2);
		case 6 %Jacobi
			chap6.jacobi(A, B, steps, initial, @printLatex2);
		case 7 %Gauss Seidel
			chap6.gaussSeidel(A, B, steps, initial, @printLatex2);
	end
else
	str = strjoin(handles.editInput.String);
	mat = eval(str);
	powermethod = handles.powermethod.Value;
	
	if powermethod == 0
		chap6.eigen(mat, @printLatex2);
	else
		steps = str2num(handles.editSteps2.String);
		initial = eval(handles.editGuess2.String);
		
		chap6.powerMethod(mat, steps, initial, @printLatex2);
	end
	
end



function editN_Callback(hObject, eventdata, handles)
% hObject    handle to editN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editN as text
%        str2double(get(hObject,'String')) returns contents of editN as a double

S = hObject.String;
n = str2num(S);
rname = cell(1, n);
cname = cell(1, n+1);
for i = 1:n
	rname{i} = sprintf('eq#%d', i);
	cname{i} = sprintf('a%d', i);
end
cname{n+1} = 'c';
if ~all(ismember(S, '.1234567890'))
	warndlg('Input must be numerical');
else
	t = handles.uitable1;
	t.ColumnWidth = num2cell(ones(1, n+1)*30);
	t.Data = zeros(n, n+1);
	t.RowName = rname;
	t.ColumnName = cname;
	t.ColumnEditable = true;
end



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


function editInput_Callback(hObject, eventdata, handles)
% hObject    handle to editInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInput as text
%        str2double(get(hObject,'String')) returns contents of editInput as a double


% --- Executes during object creation, after setting all properties.
function editInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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



function editGuess_Callback(hObject, eventdata, handles)
% hObject    handle to editGuess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGuess as text
%        str2double(get(hObject,'String')) returns contents of editGuess as a double


% --- Executes during object creation, after setting all properties.
function editGuess_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGuess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in powermethod.
function powermethod_Callback(hObject, eventdata, handles)
% hObject    handle to powermethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of powermethod

if hObject.Value == 0
	handles.uipanel10.Visible = 'off';
else
	handles.uipanel10.Visible = 'on';
end



function editGuess2_Callback(hObject, eventdata, handles)
% hObject    handle to editGuess2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGuess2 as text
%        str2double(get(hObject,'String')) returns contents of editGuess2 as a double


% --- Executes during object creation, after setting all properties.
function editGuess2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGuess2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSteps2_Callback(hObject, eventdata, handles)
% hObject    handle to editSteps2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSteps2 as text
%        str2double(get(hObject,'String')) returns contents of editSteps2 as a double


% --- Executes during object creation, after setting all properties.
function editSteps2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSteps2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
