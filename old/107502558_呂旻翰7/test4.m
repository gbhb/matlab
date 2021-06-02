function varargout = test4(varargin)
% TEST4 MATLAB code for test4.fig
%      TEST4, by itself, creates a new TEST4 or raises the existing
%      singleton*.
%
%      H = TEST4 returns the handle to a new TEST4 or the handle to
%      the existing singleton*.
%
%      TEST4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST4.M with the given input arguments.
%
%      TEST4('Property','Value',...) creates a new TEST4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test4

% Last Modified by GUIDE v2.5 30-Apr-2019 18:18:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test4_OpeningFcn, ...
                   'gui_OutputFcn',  @test4_OutputFcn, ...
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


% --- Executes just before test4 is made visible.
function test4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test4 (see VARARGIN)

% Choose default command line output for test4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = test4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function linec_Callback(hObject, eventdata, handles)
% hObject    handle to linec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function lines_Callback(hObject, eventdata, handles)
% hObject    handle to lines (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function grid_Callback(hObject, eventdata, handles)
% hObject    handle to grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p x y xx yy c l
[x,y] = textread(uigetfile('*.txt'),'%f %f');
p = polyfit(x,y,1);
xx = 1:10;
yy = xx.*p(1)+p(2);
axes(handles.axes1);
c='g';
l='-';
plot(x,y,'bo',xx,yy,[c l]);

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

answer = questdlg('Are you sure')
if answer == 'Yes'
    close();
end


% --------------------------------------------------------------------
function off_Callback(hObject, eventdata, handles)
% hObject    handle to off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid on;

% --------------------------------------------------------------------
function on_Callback(hObject, eventdata, handles)
% hObject    handle to on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid off;

% --------------------------------------------------------------------
function solid_Callback(hObject, eventdata, handles)
% hObject    handle to solid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y xx yy c l
axes(handles.axes1);
l='-';
plot(x,y,'bo',xx,yy,[c l]); 


% --------------------------------------------------------------------
function dashed_Callback(hObject, eventdata, handles)
% hObject    handle to dashed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y xx yy c l
axes(handles.axes1);
l='--';
    plot(x,y,'bo',xx,yy,[c l]); 


% --------------------------------------------------------------------
function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y xx yy c l
axes(handles.axes1);
c='g';
plot(x,y,'bo',xx,yy,[c l]);

% --------------------------------------------------------------------
function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y xx yy c l
axes(handles.axes1);
c='r';
plot(x,y,'bo',xx,yy,[c l]);