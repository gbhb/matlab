function mouse_action(action)
if nargin<1, action='start';
end
switch(action)
    case 'start'	% 開啟圖形視窗
        axis([0 1 0 1]);
        box on;
        title('Click and drag your mouse in this window!');
        set(gcf, 'WindowButtonDownFcn', 'mouse_action down');
    case 'down'	% 滑鼠按鈕被按下時的反應指令
        set(gcf, 'WindowButtonMotionFcn', 'mouse_action move');
        set(gcf, 'WindowButtonUpFcn', 'mouse_action up');
    case 'move'	% 滑鼠移動時的反應指令
        CurrentPoint = get(gca, 'CurrentPoint');
        x = CurrentPoint(1,1);
        y = CurrentPoint(1,2);
        line(x, y, 'marker', '.');
    case 'up'	% 滑鼠按鈕被釋放時的反應指令
        set(gcf, 'WindowButtonMotionFcn', '');
        set(gcf, 'WindowButtonUpFcn', '');
        clf('reset')
        mouse_action();
end