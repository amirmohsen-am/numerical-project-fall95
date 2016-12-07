function varargout = chapter3(varargin)
% chapter3 MATLAB code for chapter3.fig
%      chapter3, by itself, creates a new chapter3 or raises the existing
%      singleton*.
%
%      H = chapter3 returns the handle to a new chapter3 or the handle to
%      the existing singleton*.
%
%      chapter3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in chapter3.M with the given input arguments.
%
%      chapter3('Property','Value',...) creates a new chapter3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3

% Last Modified by GUIDE v2.5 07-Dec-2016 20:02:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_OutputFcn, ...
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


% --- Executes just before chapter3 is made visible.
function chapter3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter3 (see VARARGIN)

% Choose default command line output for chapter3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% myInit
global globalHandles
globalHandles=handles;
axes(handles.axesLog);
ylim([-1, 0]);

S = handles.edit2.String;
handles.edit2.String = '5';
t = handles.uitable1;
t.ColumnWidth = 'auto';
t.Data = [0 1 2 3 5; -3 0 5 12 32];
t.ColumnEditable = true;
%t.ColumnFormat = {'numeric', 'numeric', 'numeric', 'numeric', 'numeric'};

axes(handles.axesPlot);
cla

data = handles.uitable1.Data;
dataPlot(data);


% --- Outputs from this function are returned to the command line.
function varargout = chapter3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% axes(handles.axesLog);
% global texty
% texty = 0;
% cla
if (handles.buttonMethod.SelectedObject == handles.interpolation)
	value = handles.listbox3.Value;

	axes(handles.axesPlot);
	cla

	switch value
		case 1 %Lagrange
			method = @chap3.lagrange;
		case 2 %Newton Divided
			method = @chap3.dividedDifferences;
		case 3 %Newton Forward
			method = @chap3.forwardDifferences;
		case 4 %Newton Backward
			method = @chap3.backwardDifferences;
		case 5 %Newton Forward Central
			method = @chap3.forwardCentralDifferences;
		case 6 %Newton Backwrad Central
			method = @chap3.backwardCentralDifferences;
	end
	data = handles.uitable1.Data; 

	Xi = data(1,:);
	Yi = data(2,:);
	N = length(data);

	F = method(N, Xi, Yi);
	disp(F);
	printLatex2(latex(F));

	xl = dataPlot(data);
	fplot(F, xl, 'b');

else
	value = handles.curveMethod.SelectedObject;

	axes(handles.axesPlot);
	cla

	switch value
		case handles.curve1
			method = @chap3.curveFitting1;
		case handles.curve2
			method = @chap3.curveFitting2;
		case handles.curve3
			method = @chap3.curveFitting3;
		case handles.curve4
			method = @chap3.curveFitting4;
		case handles.curve5
			method = @chap3.curveFitting5;
		case handles.curveBest
			method = @chap3.chooseBestFitting;
	end
	data = handles.uitable1.Data; 

	Xi = data(1,:);
	Yi = data(2,:);
	N = length(data);

	global precision
	digits(precision);
	[F, rms] = method(N, Xi, Yi);
	if (rms == -1)
		errordlg('Input data points are not compatible', 'Input error');
		return;
	end
	disp(F);
	printLatex2(latex(F));

	xl = dataPlot(data);
	fplot(F, xl, 'b');
end

function xl = dataPlot(data)
	Xi = data(1,:);
	Yi = data(2,:);
	xl = [min(Xi) max(Xi)];
	yl = [min(Yi) max(Yi)];
	xlen = xl(2) - xl(1);
	ylen = yl(2) - yl(1);
	xl(1) = xl(1) - xlen/10;
	xl(2) = xl(2) + xlen/10;

	yl(1) = yl(1) - ylen/10;
	yl(2) = yl(2) + ylen/10;
	plot(Xi, Yi, 'kd', 'MarkerFaceColor', 'k');
	xlim(xl);
	ylim(yl);
	xl(1) = xl(1) - 2*xlen;
	xl(2) = xl(2) + 2*xlen;
	

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
	step = 0.2;
	text(0.05, texty-step/2, str, 'Interpreter', 'latex');
	texty = texty-step;
    axes(globalHandles.axesPlot);
	
	min = globalHandles.slider2.Min;
	if (texty < min-1)
		globalHandles.slider2.Min = min*2;
	end;

function printLatex2(str)
	printLatex(strcat('$', str, '$'));


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

% Perhaps a small warning in WARNDLG or inside the GUI:
S = hObject.String;
if ~all(ismember(S, '.1234567890'))
	warndlg('Input must be numerical');
else
	t = handles.uitable1;
	t.ColumnWidth = 'auto';
	t.Data = zeros(2, str2num(S));
	t.ColumnEditable = true;
end


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


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axesPlot);
cla

data = handles.uitable1.Data;
dataPlot(data);


% --- Executes on button press in curve1.
function curve1_Callback(hObject, eventdata, handles)
% hObject    handle to curve1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of curve1


% --- Executes during object creation, after setting all properties.
function axesCurve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axesCurve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axesCurve

axes(hObject);
ylim([-1, 0]);
curves = {'$$y = \alpha e^{\beta x}$$',...
	'$$y = a \ln b$$',...
	'$$y = \frac{a}{x} + b$$',...
	'$$y = \frac{1}{ax+b}$$',...
	'$$y = \sum a_i x^i (i \leq 3)$$',...
	'best fitted curve'};
texty = 0;
step = 0.16;
for str=curves
	text(0.05, texty-0.1, str, 'Interpreter', 'latex');
	texty = texty-step;
end


% --- Executes when selected object is changed in buttonMethod.
function buttonMethod_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttonMethod 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.interpolation)
	handles.listbox3.Visible = 'on';
	handles.uipanel2.Visible = 'off';
else	
	handles.listbox3.Visible = 'off';
	handles.uipanel2.Visible = 'on';
end



function editFunction_Callback(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFunction as text
%        str2double(get(hObject,'String')) returns contents of editFunction as a double
axes(handles.axesPlot);
cla

data = handles.uitable1.Data;
dataPlot(data);


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


% --- Executes when selected object is changed in uibuttongroup4.
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.radiopoints)
	handles.uipanelfunction.Visible = 'off';
	handles.uipanel1.Visible = 'on';
else	
	handles.uipanelfunction.Visible = 'on';
	handles.uipanel1.Visible = 'off';
end



function editMin_Callback(hObject, eventdata, handles)
% hObject    handle to editMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMin as text
%        str2double(get(hObject,'String')) returns contents of editMin as a double


% --- Executes during object creation, after setting all properties.
function editMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMax_Callback(hObject, eventdata, handles)
% hObject    handle to editMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMax as text
%        str2double(get(hObject,'String')) returns contents of editMax as a double


% --- Executes during object creation, after setting all properties.
function editMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N = str2num(handles.editFuncN.String);
min = str2num(handles.editMin.String);
max = str2num(handles.editMax.String);
syms x;
F = eval(handles.editFunction.String);
data = chap3.returnPoints(N, min, max, F);
handles.uitable1.Data = data;
handles.edit2.String = num2str(N);

axes(handles.axesPlot);
cla

dataPlot(data);

function editFuncN_Callback(hObject, eventdata, handles)
% hObject    handle to editFuncN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFuncN as text
%        str2double(get(hObject,'String')) returns contents of editFuncN as a double


% --- Executes during object creation, after setting all properties.
function editFuncN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFuncN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
