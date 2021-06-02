# -*- coding: utf-8 -*-
"""
Created on Tue Sep 29 13:36:33 2020

@author: msn71
"""
def foo(bar):
    ret_val = 0
	try:
        r1 = allocate_resources_1()
        do_something(r1, bar)
   
        try:
            r2 = allocate_resources_2()
            do_something(r2, bar)
                
        except:
            cleanup_1(r1)
            cleanup_2(r2)
    except:
        cleanup_1(r1)
        
    

        
    r2 = allocate_resources_2();

    if (!r2 || !init_stuff(r2, bar))
        goto error_2;

    r3 = allocate_resources_3();

    if (!r3 || !prepare_stuff(r3, bar))
        goto error_3;

    ret_val = do_the_thing(bar);

error_3:
    cleanup_3(r3);
error_2:
    cleanup_2(r2);
error_1:
    cleanup_1(r1);
    return ret_val;
}

