function mouse_action(action)
if nargin<1, action='start';
end
switch(action)
    case 'start'	% �}�ҹϧε���
        axis([0 1 0 1]);
        box on;
        title('Click and drag your mouse in this window!');
        set(gcf, 'WindowButtonDownFcn', 'mouse_action down');
    case 'down'	% �ƹ����s�Q���U�ɪ��������O
        set(gcf, 'WindowButtonMotionFcn', 'mouse_action move');
        set(gcf, 'WindowButtonUpFcn', 'mouse_action up');
    case 'move'	% �ƹ����ʮɪ��������O
        CurrentPoint = get(gca, 'CurrentPoint');
        x = CurrentPoint(1,1);
        y = CurrentPoint(1,2);
        line(x, y, 'marker', '.');
    case 'up'	% �ƹ����s�Q����ɪ��������O
        set(gcf, 'WindowButtonMotionFcn', '');
        set(gcf, 'WindowButtonUpFcn', '');
        clf('reset')
        mouse_action();
end