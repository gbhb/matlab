%% 1
%% main function in structural programming style: 
global arr

arr = [1, 5, 2, 3, 9, 7, 11];
comp = @yourCompare; %% next week, professor will teach you in chapter7.

ssort(arr, comp);
disp(arr);  %% sub-problem 2 : why unsorted ?
            %% output : 1, 5, 2, 3, 9, 7, 11 ?! 

%% define selection sort :

function sortedArr = ssort(arr, comp) 
    global arr
    narginchk(1, 2);
    nvals = length(arr);
    for idx=1:nvals-1
        select = idx;
        for jdx=idx+1:nvals
            %% replace the comp function..
            if(nargin==1)
                if(arr(jdx)<arr(select))
                    select = jdx;  %% min = jdx
                end
            else
                if(comp(arr(jdx), arr(select)))  %% your code ..
                    select = jdx;  %% max = jdx
                end
            end
        end
        if idx ~= select
                tmp = arr(idx);
                arr(idx) = arr(select);
                arr(select) = tmp;
        end
    end
    sortedArr = arr;
end


%% Hint :
function tag = yourCompare(x1, x2)
    %code your compare function here...
    if x1>x2
        tag=1;
    else
        tag=0;
    end
end