clear
day=input('Please input the date: ');
switch (day)
	case 7
		disp('Today is Sun')
    case 1
		disp('Today is Mon')
    case 2
		disp('Today is Tue')
    case 3
		disp('Today is Wed')
    case 4
		disp('Today is Thu')
    case 5
		disp('Today is Fri')
    case 6
		disp('Today is Sat')
    otherwise
        if day >7
            fprintf('ERROR_MESSAGE : \nThe date should less than 8.\n');
        elseif  day <1
            fprintf('ERROR_MESSAGE : \nThe date should greater than 0.\n');
        end
end