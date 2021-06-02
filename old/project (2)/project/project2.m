function varargout = project2(varargin)
% PROJECT2 MATLAB code for project2.fig
%      PROJECT2, by itself, creates a new PROJECT2 or raises the existing
%      singleton*.
%
%      H = PROJECT2 returns the handle to a new PROJECT2 or the handle to
%      the existing singleton*.
%
%      PROJECT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT2.M with the given input arguments.
%
%      PROJECT2('Property','Value',...) creates a new PROJECT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project2

% Last Modified by GUIDE v2.5 26-May-2019 19:01:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project2_OpeningFcn, ...
                   'gui_OutputFcn',  @project2_OutputFcn, ...
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


% --- Executes just before project2 is made visible.
function project2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project2 (see VARARGIN)

% Choose default command line output for project2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project2 wait for user response (see UIRESUME)
% uiwait(handles.figure1)

[y, fs]=audioread('04_ikutoshitsuki_inst.mp3');
sound(y,fs);
global s remain round
remain=5040;
round=0;
s=nchoosek(0:1:9,4);
s=[perms(s(1,:));perms(s(2,:));perms(s(3,:));perms(s(4,:));perms(s(5,:));perms(s(6,:));perms(s(7,:));perms(s(8,:));perms(s(9,:));perms(s(10,:));perms(s(11,:));perms(s(12,:));perms(s(13,:));perms(s(14,:));perms(s(15,:));perms(s(16,:));perms(s(17,:));perms(s(18,:));perms(s(19,:));perms(s(20,:));perms(s(21,:));perms(s(22,:));perms(s(23,:));perms(s(24,:));perms(s(25,:));perms(s(26,:));perms(s(27,:));perms(s(28,:));perms(s(29,:));perms(s(30,:));perms(s(31,:));perms(s(32,:));perms(s(33,:));perms(s(34,:));perms(s(35,:));perms(s(36,:));perms(s(37,:));perms(s(38,:));perms(s(39,:));perms(s(40,:));perms(s(41,:));perms(s(42,:));perms(s(43,:));perms(s(44,:));perms(s(45,:));perms(s(46,:));perms(s(47,:));perms(s(48,:));perms(s(49,:));perms(s(50,:));perms(s(51,:));perms(s(52,:));perms(s(53,:));perms(s(54,:));perms(s(55,:));perms(s(56,:));perms(s(57,:));perms(s(58,:));perms(s(59,:));perms(s(60,:));perms(s(61,:));perms(s(62,:));perms(s(63,:));perms(s(64,:));perms(s(65,:));perms(s(66,:));perms(s(67,:));perms(s(68,:));perms(s(69,:));perms(s(70,:));perms(s(71,:));perms(s(72,:));perms(s(73,:));perms(s(74,:));perms(s(75,:));perms(s(76,:));perms(s(77,:));perms(s(78,:));perms(s(79,:));perms(s(80,:));perms(s(81,:));perms(s(82,:));perms(s(83,:));perms(s(84,:));perms(s(85,:));perms(s(86,:));perms(s(87,:));perms(s(88,:));perms(s(89,:));perms(s(90,:));perms(s(91,:));perms(s(92,:));perms(s(93,:));perms(s(94,:));perms(s(95,:));perms(s(96,:));perms(s(97,:));perms(s(98,:));perms(s(99,:));perms(s(100,:));perms(s(101,:));perms(s(102,:));perms(s(103,:));perms(s(104,:));perms(s(105,:));perms(s(106,:));perms(s(107,:));perms(s(108,:));perms(s(109,:));perms(s(110,:));perms(s(111,:));perms(s(112,:));perms(s(113,:));perms(s(114,:));perms(s(115,:));perms(s(116,:));perms(s(117,:));perms(s(118,:));perms(s(119,:));perms(s(120,:));perms(s(121,:));perms(s(122,:));perms(s(123,:));perms(s(124,:));perms(s(125,:));perms(s(126,:));perms(s(127,:));perms(s(128,:));perms(s(129,:));perms(s(130,:));perms(s(131,:));perms(s(132,:));perms(s(133,:));perms(s(134,:));perms(s(135,:));perms(s(136,:));perms(s(137,:));perms(s(138,:));perms(s(139,:));perms(s(140,:));perms(s(141,:));perms(s(142,:));perms(s(143,:));perms(s(144,:));perms(s(145,:));perms(s(146,:));perms(s(147,:));perms(s(148,:));perms(s(149,:));perms(s(150,:));perms(s(151,:));perms(s(152,:));perms(s(153,:));perms(s(154,:));perms(s(155,:));perms(s(156,:));perms(s(157,:));perms(s(158,:));perms(s(159,:));perms(s(160,:));perms(s(161,:));perms(s(162,:));perms(s(163,:));perms(s(164,:));perms(s(165,:));perms(s(166,:));perms(s(167,:));perms(s(168,:));perms(s(169,:));perms(s(170,:));perms(s(171,:));perms(s(172,:));perms(s(173,:));perms(s(174,:));perms(s(175,:));perms(s(176,:));perms(s(177,:));perms(s(178,:));perms(s(179,:));perms(s(180,:));perms(s(181,:));perms(s(182,:));perms(s(183,:));perms(s(184,:));perms(s(185,:));perms(s(186,:));perms(s(187,:));perms(s(188,:));perms(s(189,:));perms(s(190,:));perms(s(191,:));perms(s(192,:));perms(s(193,:));perms(s(194,:));perms(s(195,:));perms(s(196,:));perms(s(197,:));perms(s(198,:));perms(s(199,:));perms(s(200,:));perms(s(201,:));perms(s(202,:));perms(s(203,:));perms(s(204,:));perms(s(205,:));perms(s(206,:));perms(s(207,:));perms(s(208,:));perms(s(209,:));perms(s(210,:))];
set(handles.text2,'String',1234);

% --- Outputs from this function are returned to the command line.
function varargout = project2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s remain round
a=str2num(get(handles.edit1,'String'));
b=str2num(get(handles.edit2,'String'));
x= str2num(get(handles.text2,'String'));
unit_1 = mod(x,10);   
unit_10 = floor(mod(x,100)/10);
unit_100 = floor(mod(x,1000)/100);
unit_1000 = floor(x/1000);
refer=[unit_1000 unit_100 unit_10 unit_1];
i=0;
while i<remain
         aa = 0;
         bb = 0;  
         for j=0:3  
             for k=0:3
                 if s(i+1,j+1)==refer(k+1)
                     if j==k 
                         aa=aa+1;
                     else
                         bb=bb+1;
                     end
                 end
             end
         end

         if aa~=a || bb~=b
             for j=i:remain-2
                 s(j+1,:)=s(j+2,:); 
             end
             remain=remain-1;
             i=i-1;
         end
     i=i+1;
end
round=round+1;
if a==4 && b==0
    set(handles.text2,'String',"§ÚÄ¹¤F");
    answer = questdlg('Do you want to go to menu?')
        
else
    if s(1,1)==0
        num= s(1,2)*100+s(1,3)*10+s(1,4);
        set(handles.text2,'String',['0' num2str(num)]);
    else
        num=s(1,1)*1000+s(1,2)*100+s(1,3)*10+s(1,4);
        set(handles.text2,'String',num);
    end
end
set(handles.text3,'String',round);
if answer == 'Yes';
        close()
        model
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('0.jpg'));
% Hint: place code in OpeningFcn to populate axes1
