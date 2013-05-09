PRO destroy_threads,threads

    for i=0,n_elements(threads)-1 do obj_destroy, threads[i]

END
