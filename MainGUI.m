function varargout = MainGUI(varargin)
%MAINGUI M-file for MainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to MainGUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAINGUI('CALLBACK') and MAINGUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAINGUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainGUI

% Last Modified by GUIDE v2.5 17-Jan-2016 07:28:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before MainGUI is made visible.
function MainGUI_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for MainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainGUI_OutputFcn(~, ~, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fall reel1 reel2 reel3 reel4 reel5 sets n rad1 rad2 rad3 rad4
[fall,reel1,reel2,reel3,reel4,reel5,n] = Main;
sets = 1;

if rad4 == 1
    if fall == 1
        set(handles.edit1,'String','Fall Detected');
    else
        set(handles.edit1,'String','No Fall Detected');
    end
elseif rad3 == 1
    pks = findpeaks(reel2(:,4));
    set(handles.edit1,'String',num2str(round(length(pks)/10)));
elseif rad2 == 1
    pks = findpeaks(reel5(:,4));
    set(handles.edit1,'String',num2str(round(length(pks)/10)));
else
    pks = findpeaks(reel3(:,4));
    set(handles.edit1,'String',num2str(round(length(pks)/10)));
end

grid on
axes(handles.axes1);
realdata = reel1;
[~,len]=size(realdata);
i=1;
colorVec = hsv(len);
title('Accelerometer','Color','w');
for j=2:len
    realdata(:,j) = realdata(:,j)/max(realdata(:,j));
    hold on
    plot(1:n(i),realdata(:,j),'Color',colorVec(j-1,:))
end

axes(handles.axes2);
realdata = reel2;
[~,len]=size(realdata);
i=2;
colorVec = hsv(len);
title('EMG','Color','w');
for j=2:len
    realdata(:,j) = realdata(:,j)/max(realdata(:,j));
    hold on
    plot(1:n(i),realdata(:,j),'Color',colorVec(j-1,:))
end

axes(handles.axes3);
realdata = reel3;
[~,len]=size(realdata);
i=3;
colorVec = hsv(len);
title('Gyro','Color','w');
for j=2:len
    realdata(:,j) = realdata(:,j)/max(realdata(:,j));
    hold on
    plot(1:n(i),realdata(:,j),'Color',colorVec(j-1,:))
end

axes(handles.axes4);
realdata = reel4;
[~,len]=size(realdata);
i=4;
colorVec = hsv(len);
title('Orientation','Color','w');
for j=2:len
    realdata(:,j) = realdata(:,j)/max(realdata(:,j));
    hold on
    plot(1:n(i),realdata(:,j),'Color',colorVec(j-1,:))
end

axes(handles.axes5);
realdata = reel5;
[~,len]=size(realdata);
i=5;
colorVec = hsv(len);
title('Orientation Euler','Color','w');
for j=2:len
    realdata(:,j) = realdata(:,j)/max(realdata(:,j));
    hold on
    plot(1:n(i),realdata(:,j),'Color',colorVec(j-1,:))
end


function edit1_Callback(~, ~, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global sets rad1 rad2 rad3 rad4 reel2 reel5 reel3

if rad4 == 1
    if sets == 1
        set(handles.edit1,'String','Fall Detected');
    else
        set(handles.edit1,'String','No Fall Detected');
    end
elseif rad3 == 1
    pks = findpeaks(reel2(:,4));
    set(handles.edit1,'String',num2str(round(length(pks)/10)));
elseif rad2 == 1
    pks = findpeaks(reel5(:,4));
    set(handles.edit1,'String',num2str(round(length(pks)/10)));
else
    pks = findpeaks(reel3(:,4));
    set(handles.edit1,'String',num2str(round(length(pks)/10)));
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton1_Callback(hObject, ~, ~)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global rad1
if (get(hObject,'Value') == get(hObject,'Max'))
	rad1 = 1;
end

function radiobutton2_Callback(hObject, ~, ~)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global rad2
if (get(hObject,'Value') == get(hObject,'Max'))
	rad2 = 1;
end

function radiobutton3_Callback(hObject, ~, ~)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global rad3
if (get(hObject,'Value') == get(hObject,'Max'))
	rad3 = 1;
end

function radiobutton4_Callback(hObject, ~, ~)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global rad4
if (get(hObject,'Value') == get(hObject,'Max'))
	rad4 = 1;
end
