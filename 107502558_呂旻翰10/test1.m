%% test2template.txt
%% Define the trivial plot..
x = -3*pi:pi/10:3*pi;
y1 = sin(x);
y2 = cos(x);

%% complete the plot..
%% figure with tag 1
gHand_1 = plot(x, y1);
tag = 1;
setting_figure(gHand_1, tag);
hold on;

%% figure with tag 2
gHand_2 = plot(x, y2);
tag = 2;
setting_figure(gHand_2, tag);
hold off;

%% event handler..
event = waitforbuttonpress;
%%% your code in second part of test1.m.
while 1
    
    % Get the handle of the object
    handle = gco;
    
    % Get the type of this object.
    x=get(handle,'Type');
    
    if x== "line"
        LineWidth = get(handle,'LineWidth');
        
        
        LineStyle = get(handle,'LineStyle');
        
        disp(["The LineWidth is "+num2str(LineWidth)+" and the LineStyle is "+convertCharsToStrings(LineStyle)]);
        yn = input('finish ?','s');
        if yn == 'y'
            return
        end
        if yn == 'n'
            disp('then click the line ~ ~')
        end
        % Check for another mouse click
    end
    event = waitforbuttonpress;
    
end
%% It's time to show your hack..
function setting_figure(gHand, tag)
%%.. your code in first part of test1.m.
if tag == 1
    set(gHand,'LineWidth',5,'LineStyle',':','Color','y')
end
if tag == 2
    set(gHand,'LineWidth',3,'LineStyle','--','Color','g')
end
end