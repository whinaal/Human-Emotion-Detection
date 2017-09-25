function varargout = Start(varargin)
global wav_file
global ujisatu
global mfcc
% START M-file for Start.fig
%      START, by itself, creates a new STA RT or raises the existing
%      singleton*.
%
%      H = START returns the handle to a new START or the handle to
%      the existing singleton*.
%
%      START('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START.M with the given input arguments.
%
%      START('Property','Value',...) creates a new START or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Start_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Start_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Start

% Last Modified by GUIDE v2.5 08-Dec-2014 01:07:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Start_OpeningFcn, ...
                   'gui_OutputFcn',  @Start_OutputFcn, ...
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


% --- Executes just before Start is made visible.
function Start_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Start (see VARARGIN)

% Choose default command line output for Start
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Start wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Start_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function url_Callback(hObject, eventdata, handles)
% hObject    handle to url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of url as text
%        str2double(get(hObject,'String')) returns contents of url as a double


% --- Executes during object creation, after setting all properties.
function url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in bukafail.
function bukafail_Callback(hObject, eventdata, handles)
global wav_file
% hObject    handle to bukafail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.wav','Pilih fail suara');
wav_file = [pathname filename]
set(handles.url,'string',wav_file);
save('wav_file');

% --- Executes on button press in mfccuji.
function mfccuji_Callback(hObject, eventdata, handles)
global wav_file
global ujisatu
global ujimfcc
wav_file=load(wav_file);
% hObject    handle to mfccuji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ujisatu=wavread(wav_file);
%ujimfcc=mfcc(ujisatu);
%save('ujisatu','ujimfcc');
%codebook;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ujisatu=wavread(wavfile);
ujimfcc=mfcc(ujisatu);
codebook;
hitungjaraknya(r1,r2,ujimfcc);
hasilhaha=hasilkenal;
set(handles.hasilnyah,'String',hasilhaha);

% --- Executes on button press in masukan.
function masukan_Callback(hObject, eventdata, handles)
% hObject    handle to masukan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in codebook.
function codebook_Callback(hObject, eventdata, handles)
% hObject    handle to codebook (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
satutrain;


