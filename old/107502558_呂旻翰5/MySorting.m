function out = MySorting(in)
nvals = size(in,2);
for ii = 1:nvals-1
    iptr = ii;
    for jj = ii+1:nvals
        if in(jj) > in(iptr)
            iptr = jj;
        end
    end
    
    % iptr now points to the minimum value, so swap a(iptr)
    % with a(ii) if ii ~= iptr.
    if ii ~= iptr
        temp    = in(ii);
        in(ii)   = in(iptr);
        in(iptr) = temp;
    end
end

out = in;