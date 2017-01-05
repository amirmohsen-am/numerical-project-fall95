function varargout = chapter4(varargin)
% chapter4 MATLAB code for chapter4.fig
%      chapter4, by itself, creates a new chapter4 or raises the existing
%      singleton*.
%
%      H = chapter4 returns the handle to a new chapter4 or the handle to
%      the existing singleton*.
%
%      chapter4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in chapter4.M with the given input arguments.
%
%      chapter4('Property','Value',...) creates a new chapter4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter4

% Last Modified by GUIDE v2.5 05-Jan-2017 16:46:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter4_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter4_OutputFcn, ...
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



% --- Executes just before chapter4 is made visible.
function chapter4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter4 (see VARARGIN)

% Choose default command line output for chapter4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% myInit
global globalHandles
globalHandles=handles;
axes(handles.axesLog);
ylim([-1, 0]);

axes(handles.axesPlot);
cla


% --- Outputs from this function are returned to the command line.
function varargout = chapter4_OutputFcn(hObject, eventdata, handles) 
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

if value == 4 || value == 5
	handles.text17.String = 'n:';
else
	handles.text17.String = 'h:';
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

% --- Executes during object creation, after setting all properties.
function axesCurve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axesCurve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axesCurve

axes(hObject);
ylim([-1, 0]);
curves = {'$$O(h^2)$$',...
	'$$O(h^4)$$'};
texty = -0.15;
step = 0.47;
for str=curves
	text(0.05, texty-0.1, str, 'Interpreter', 'latex');
	texty = texty-step;
end


% --- Executes when selected object is changed in buttonMethod.
function buttonMethod_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttonMethod 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.integration)
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



function editInt1_Callback(hObject, eventdata, handles)
% hObject    handle to editInt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInt1 as text
%        str2double(get(hObject,'String')) returns contents of editInt1 as a double


% --- Executes during object creation, after setting all properties.
function editInt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editInt2_Callback(hObject, eventdata, handles)
% hObject    handle to editInt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInt2 as text
%        str2double(get(hObject,'String')) returns contents of editInt2 as a double


% --- Executes during object creation, after setting all properties.
function editInt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editH1_Callback(hObject, eventdata, handles)
% hObject    handle to editH1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editH1 as text
%        str2double(get(hObject,'String')) returns contents of editH1 as a double


% --- Executes during object creation, after setting all properties.
function editH1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editH1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editX_Callback(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editX as text
%        str2double(get(hObject,'String')) returns contents of editX as a double


% --- Executes during object creation, after setting all properties.
function editX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDegree_Callback(hObject, eventdata, handles)
% hObject    handle to editDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDegree as text
%        str2double(get(hObject,'String')) returns contents of editDegree as a double


% --- Executes during object creation, after setting all properties.
function editDegree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editH2_Callback(hObject, eventdata, handles)
% hObject    handle to editH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editH2 as text
%        str2double(get(hObject,'String')) returns contents of editH2 as a double


% --- Executes during object creation, after setting all properties.
function editH2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in richardson.
function richardson_Callback(hObject, eventdata, handles)
% hObject    handle to richardson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of richardson



function editError_Callback(hObject, eventdata, handles)
% hObject    handle to editError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editError as text
%        str2double(get(hObject,'String')) returns contents of editError as a double


% --- Executes during object creation, after setting all properties.
function editError_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editError (see GCBO)
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
global precision
precision=5;
digits(precision);

F = handles.editFunction.String;
if (handles.buttonMethod.SelectedObject == handles.integration)
	a = str2num(handles.editInt1.String);
	b = str2num(handles.editInt2.String);
	h = str2num(handles.editH1.String);
    
    axes(handles.axesPlot)
    cla
    hold on;
    plot([a-10, b+10], [0, 0], 'r--');
    fplot(F,[a b],'b')
    yl = ylim;
    xl = xlim;
    yrange =yl(2)-yl(1);
    xrange =xl(2)-xl(1);
    yl(1) = yl(1)-yrange/4;
    yl(2) = yl(2)+yrange/4;
    xl(1) = xl(1)-xrange/4;
    xl(2) = xl(2)+xrange/4;
    xlim(xl);
    ylim(yl);
    
	value = handles.listbox3.Value;
	switch value
		case 1 %Trapezodial
			out = chap4.trapezoidal(F,a,b,h,@printLatex2);
		case 2 %Simpson1/3
			out = chap4.simpsons3(F,a,b,h);
		case 3 %Simpson3/8
			out = chap4.simpsons8(F,a,b,h);
		case 4 %Romberg
			out = chap4.romberg(F,a,b,h);
		case 5 %Gauss Legandre
			out = chap4.gauss(F,a,b,h);
		case 6 %Customized Simpson
			n = (b-a)/h;
            if mod(n,2)==0
                printLatex('N is even, using Simpson $\frac{1}{3}$');
                out = chap4.simpsons3(F,a,b,h);
            else
                printLatex('N is odd using:');
                printLatex(sprintf('Simpson $\\frac{1}{3}$ for [%.4f, %.4f]',a,b-h*3));
                printLatex(sprintf('Simpson $\\frac{3}{8}$ for [%.4f, %.4f]',b-h*3,b));
                out = chap4.simpsons3(F,a,b-h*3,h);
                out
                out2 = chap4.simpsons8(F,b-h*3,b,h);
                out2
                out = out+out2;
            end
    end
    if ischar(out)
        errordlg(out, 'Input error');
    else
        out
        printLatex(sprintf(sprintf('Final answer = $%%.%df$',precision), out))
    end
else
    
	x = str2num(handles.editX.String);
    
    axes(handles.axesPlot)
    cla
    hold on;
    plot([x-100, x+100], [0, 0], 'r--');
    fplot(F,[x-1 x+1],'b')
    yl = ylim;
    xl = xlim;
    yrange =yl(2)-yl(1);
    xrange =xl(2)-xl(1);
    yl(1) = yl(1)-yrange/4;
    yl(2) = yl(2)+yrange/4;
    xl(1) = xl(1)-xrange/4;
    xl(2) = xl(2)+xrange/4;
    xlim(xl);
    ylim(yl);
    
	degree = str2num(handles.editDegree.String);
	h = str2num(handles.editH2.String);
	richardson = handles.richardson.Value;
	p = str2num(handles.editError.String);
	
	value = handles.curveMethod.SelectedObject; %Formula Method
	switch value
        case handles.formula1 %O(h^2)
            order = 2;
        case handles.formula2 %O(h^4)
            order = 4;
    end
    if richardson
        printLatex('$$h_2 = \frac{h_1}{2}$$');
        printLatex('$$G=\frac{2^pg(\frac{h_1}{2})-g(h_1)}{2^p-1}$$');
        out = chap4.diff(F,x,degree,order,h,@printLatex2);
        out2 = chap4.diff(F,x,degree,order,h/2,@printLatex2);
        printLatex(sprintf(sprintf('$$g(h_1) = %%.%df$$',precision), out));
        printLatex(sprintf(sprintf('$$g(h_2) = %%.%df$$',precision), out2));
        G = (2^p*out2-out)/(2^p-1);
        printLatex(sprintf(sprintf('$$G = %%.%df$$',precision), G));
    else
        out = chap4.diff(F,x,degree,order,h);
        printLatex(sprintf(sprintf('Final answer $= %%.%df$',precision), out));
    end
end

% --- Executes when selected object is changed in curveMethod.
function curveMethod_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in curveMethod 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 

% --- Executes on button press in formula1.
function formula1_Callback(hObject, eventdata, handles)
% hObject    handle to formula1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of formula1
