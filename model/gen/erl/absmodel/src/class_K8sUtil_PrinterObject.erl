-module(class_K8sUtil_PrinterObject).
-include_lib("../include/abs_types.hrl").
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Printer">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sUtil_PrinterObject}).
'init_internal'()->
    #state{}.

'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

'set_val_internal'(S,S,S)->
    throw(badarg).
'get_state_for_modelapi'(S)->
    [
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sUtil.abs:364
 %% K8sUtil.abs:364
'm_printNodesStates'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_list_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'list' => V_list_0 }),
    try
         %% K8sUtil.abs:365--365
        T_1 = builtin:println(Cog,<<"MASTER STATUS:"/utf8>>),
        T_1,
         %% K8sUtil.abs:367--380
        put(vars, (get(vars))#{'tmp1309147872' => maps:get('list', get(vars))}),
         %% K8sUtil.abs:367--380
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1309147872', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:367--380
                put(vars, (get(vars))#{'state' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1309147872', get(vars)),[O,DC| Stack])}),
                 %% K8sUtil.abs:367--380
                put(vars, (get(vars))#{'tmp1309147872' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1309147872', get(vars)),[O,DC| Stack])}),
                 %% K8sUtil.abs:368--368
                put(vars, (get(vars))#{'nPods' => <<""/utf8>>}),
                 %% K8sUtil.abs:369--369
                case cmp:lt(m_K8sUtil_funs:f_nOfPods(Cog,maps:get('state', get(vars)),[O,DC| Stack]),10) of
                    true ->  %% K8sUtil.abs:370--370
                    put(vars, (get(vars))#{'nPods' := iolist_to_binary([<<" "/utf8>>, builtin:toString(Cog,m_K8sUtil_funs:f_nOfPods(Cog,maps:get('state', get(vars)),[O,DC| Stack]))])});
                    false ->                  %% K8sUtil.abs:372--372
                put(vars, (get(vars))#{'nPods' := builtin:toString(Cog,m_K8sUtil_funs:f_nOfPods(Cog,maps:get('state', get(vars)),[O,DC| Stack]))})
                end,
                 %% K8sUtil.abs:374--379
                T_2 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"Node: "/utf8>>, m_K8sUtil_funs:f_nName(Cog,maps:get('state', get(vars)),[O,DC| Stack])]), <<"   Pods: "/utf8>>]), maps:get('nPods', get(vars))]), <<"   Cpu Load : "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,m_K8sUtil_funs:f_cpuLoad(Cog,maps:get('state', get(vars)),[O,DC| Stack])))]), <<" / "/utf8>>]), builtin:toString(Cog,m_K8sUtil_funs:f_totalCpu(Cog,maps:get('state', get(vars)),[O,DC| Stack]))]), <<" [ "/utf8>>]), m_K8sUtil_funs:f_formatInt3(Cog,builtin:truncate(Cog,( rationals:mul( rationals:rdiv(m_K8sUtil_funs:f_cpuLoad(Cog,maps:get('state', get(vars)),[O,DC| Stack]),m_K8sUtil_funs:f_totalCpu(Cog,maps:get('state', get(vars)),[O,DC| Stack])) ,100)) ),[O,DC| Stack])]), <<"% ] "/utf8>>]), <<"   Requested Cpu : "/utf8>>]), builtin:toString(Cog,m_K8sUtil_funs:f_requestedCpu(Cog,maps:get('state', get(vars)),[O,DC| Stack]))]), <<" / "/utf8>>]), builtin:toString(Cog,m_K8sUtil_funs:f_totalCpu(Cog,maps:get('state', get(vars)),[O,DC| Stack]))]), <<"   Allocated Memory : "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,m_K8sUtil_funs:f_allocatedMemory(Cog,maps:get('state', get(vars)),[O,DC| Stack])))]), <<" / "/utf8>>]), builtin:toString(Cog,m_K8sUtil_funs:f_totalMemory(Cog,maps:get('state', get(vars)),[O,DC| Stack]))])),
                T_2,
            Loop([])  end end)
        ([]),
         %% K8sUtil.abs:381--381
        T_2 = builtin:println(Cog,<<""/utf8>>),
        T_2,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printNodesStates and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:384
 %% K8sUtil.abs:384
'm_printServiceStatus'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_s_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 's' => V_s_0 }),
    try
         %% K8sUtil.abs:385--385
        put(vars, (get(vars))#{'tmp1488311804' => cog:create_task(maps:get('s', get(vars)),'m_getName',[[]],#task_info{method= <<"getName"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:385--385
        future:await(maps:get('tmp1488311804', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:385--385
        put(vars, (get(vars))#{'serviceName' => future:get_blocking(maps:get('tmp1488311804', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sUtil.abs:386--386
        put(vars, (get(vars))#{'tmp1112763814' => cog:create_task(maps:get('s', get(vars)),'m_getConsumption',[[]],#task_info{method= <<"getConsumption"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:386--386
        future:await(maps:get('tmp1112763814', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:386--386
        put(vars, (get(vars))#{'consumptions' => future:get_blocking(maps:get('tmp1112763814', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sUtil.abs:387--387
        put(vars, (get(vars))#{'tmp1972489169' => cog:create_task(maps:get('s', get(vars)),'m_getUpscaleThreshold',[[]],#task_info{method= <<"getUpscaleThreshold"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:387--387
        future:await(maps:get('tmp1972489169', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:387--387
        put(vars, (get(vars))#{'upscaleThreshold' => future:get_blocking(maps:get('tmp1972489169', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sUtil.abs:388--388
        put(vars, (get(vars))#{'tmp1557955737' => cog:create_task(maps:get('s', get(vars)),'m_getPodsConsumptions',[[]],#task_info{method= <<"getPodsConsumptions"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:388--388
        future:await(maps:get('tmp1557955737', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:388--388
        put(vars, (get(vars))#{'list' => future:get_blocking(maps:get('tmp1557955737', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sUtil.abs:389--389
        T_1 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([<<"SERVICE "/utf8>>, maps:get('serviceName', get(vars))]), <<" STATUS:"/utf8>>])),
        T_1,
         %% K8sUtil.abs:390--390
        T_2 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"TOTAL  CPU: "/utf8>>, builtin:toString(Cog,builtin:truncate(Cog,m_K8sUtil_funs:f_cpuCsmpt(Cog,maps:get('consumptions', get(vars)),[O,DC| Stack])))]), <<"  UTIL %: "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,( rationals:mul(m_K8sUtil_funs:f_cpuRatio(Cog,maps:get('consumptions', get(vars)),[O,DC| Stack]),100)) ))]), <<" / "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,( rationals:mul(maps:get('upscaleThreshold', get(vars)),100)) ))]), <<"   MEMORY: "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,m_K8sUtil_funs:f_memoryCsmpt(Cog,maps:get('consumptions', get(vars)),[O,DC| Stack])))])),
        T_2,
         %% K8sUtil.abs:391--398
        put(vars, (get(vars))#{'tmp1243144433' => maps:get('list', get(vars))}),
         %% K8sUtil.abs:391--398
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1243144433', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:391--398
                put(vars, (get(vars))#{'state' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1243144433', get(vars)),[O,DC| Stack])}),
                 %% K8sUtil.abs:391--398
                put(vars, (get(vars))#{'tmp1243144433' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1243144433', get(vars)),[O,DC| Stack])}),
                 %% K8sUtil.abs:392--397
                T_3 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"Pod: "/utf8>>, builtin:toString(Cog,m_K8sUtil_funs:f_podID(Cog,maps:get('state', get(vars)),[O,DC| Stack]))]), <<"   Node : "/utf8>>]), builtin:toString(Cog,m_K8sUtil_funs:f_nodeName(Cog,maps:get('state', get(vars)),[O,DC| Stack]))]), <<"   Cpu Consumption: "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,m_K8sUtil_funs:f_cpuConsumption(Cog,maps:get('state', get(vars)),[O,DC| Stack])))]), <<"   Allocated Memory : "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,m_K8sUtil_funs:f_memoryConsumption(Cog,maps:get('state', get(vars)),[O,DC| Stack])))]), <<"   Cpu % : "/utf8>>]), builtin:toString(Cog,builtin:truncate(Cog,( rationals:mul(m_K8sUtil_funs:f_consumptionRatio(Cog,maps:get('state', get(vars)),[O,DC| Stack]),100)) ))])),
                T_3,
            Loop([])  end end)
        ([]),
         %% K8sUtil.abs:399--399
        T_3 = builtin:println(Cog,<<""/utf8>>),
        T_3,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printServiceStatus and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:403
 %% K8sUtil.abs:403
'm_printNodes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_m_0,V_times_0,V_interval_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'm' => V_m_0,
 'times' => V_times_0,
 'interval' => V_interval_0 }),
    try
         %% K8sUtil.abs:404--404
        put(vars, (get(vars))#{'ctr' => maps:get('times', get(vars))}),
         %% K8sUtil.abs:405--405
        []=(fun Loop ([])->
            case cmp:gt(maps:get('ctr', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:406--406
                put(vars, (get(vars))#{'tmp707834059' => cog:create_task(maps:get('m', get(vars)),'m_getNodesStates',[[]],#task_info{method= <<"getNodesStates"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sUtil.abs:406--406
                future:await(maps:get('tmp707834059', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sUtil.abs:406--406
                put(vars, (get(vars))#{'list' => future:get_blocking(maps:get('tmp707834059', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sUtil.abs:407--407
                T_1 = (fun() -> case O of
                    null -> throw(dataNullPointerException);
                    Callee=#object{oid=Oid,cog=Cog} ->
                        %% self-call
                        Vars=get(vars),
                        Result=C:'m_printNodesStates'(Callee,maps:get('list', get(vars)),[O,DC,Vars| Stack]),
                        put(vars, Vars),
                        Result;
                    Callee=#object{oid=ObjRef,cog=Cog} ->
                        %% cog-local call
                        V_list = maps:get('list', get(vars)),
                        State=get(this),
                        Vars=get(vars),
                        cog:object_state_changed(Cog, O, State),
                        put(this,cog:get_object_state(Callee#object.cog, Callee)),
                        put(task_info,(get(task_info))#task_info{this=Callee}),
                        T=object:get_class_from_state(get(this)), % it's the callee state already
                        Result=T:'m_printNodesStates'(Callee, V_list,[O,DC,Vars,State| Stack]),
                        cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                        put(task_info,(get(task_info))#task_info{this=O}),
                        put(this, cog:get_object_state(Cog, O)),
                        put(vars, Vars),
                        Result;
                    Callee ->
                        %% remote call
                        TempFuture = cog:create_task(Callee,'m_printNodesStates',[maps:get('list', get(vars)),[]],#task_info{method= <<"printNodesStates"/utf8>>},Cog, true),
                        future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                end end)(),
                T_1,
                 %% K8sUtil.abs:408--408
                put(vars, (get(vars))#{'ctr' := (maps:get('ctr', get(vars)) - 1) }),
                 %% K8sUtil.abs:410--410
                cog:suspend_current_task_for_duration(Cog,maps:get('interval', get(vars)),maps:get('interval', get(vars)),[O,DC| Stack]),
                ok,
            Loop([])  end end)
        ([]),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printNodes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:414
 %% K8sUtil.abs:414
'm_printService'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_s_0,V_times_0,V_interval_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 's' => V_s_0,
 'times' => V_times_0,
 'interval' => V_interval_0 }),
    try
         %% K8sUtil.abs:415--415
        put(vars, (get(vars))#{'ctr' => maps:get('times', get(vars))}),
         %% K8sUtil.abs:416--416
        []=(fun Loop ([])->
            case cmp:gt(maps:get('ctr', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:417--417
                T_1 = (fun() -> case O of
                    null -> throw(dataNullPointerException);
                    Callee=#object{oid=Oid,cog=Cog} ->
                        %% self-call
                        Vars=get(vars),
                        Result=C:'m_printServiceStatus'(Callee,maps:get('s', get(vars)),[O,DC,Vars| Stack]),
                        put(vars, Vars),
                        Result;
                    Callee=#object{oid=ObjRef,cog=Cog} ->
                        %% cog-local call
                        V_s = maps:get('s', get(vars)),
                        State=get(this),
                        Vars=get(vars),
                        cog:object_state_changed(Cog, O, State),
                        put(this,cog:get_object_state(Callee#object.cog, Callee)),
                        put(task_info,(get(task_info))#task_info{this=Callee}),
                        T=object:get_class_from_state(get(this)), % it's the callee state already
                        Result=T:'m_printServiceStatus'(Callee, V_s,[O,DC,Vars,State| Stack]),
                        cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                        put(task_info,(get(task_info))#task_info{this=O}),
                        put(this, cog:get_object_state(Cog, O)),
                        put(vars, Vars),
                        Result;
                    Callee ->
                        %% remote call
                        TempFuture = cog:create_task(Callee,'m_printServiceStatus',[maps:get('s', get(vars)),[]],#task_info{method= <<"printServiceStatus"/utf8>>},Cog, true),
                        future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                end end)(),
                T_1,
                 %% K8sUtil.abs:418--418
                put(vars, (get(vars))#{'ctr' := (maps:get('ctr', get(vars)) - 1) }),
                 %% K8sUtil.abs:420--420
                cog:suspend_current_task_for_duration(Cog,maps:get('interval', get(vars)),maps:get('interval', get(vars)),[O,DC| Stack]),
                ok,
            Loop([])  end end)
        ([]),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printService and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:424
 %% K8sUtil.abs:424
'm_printStatus'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_m_0,V_sList_0,V_times_0,V_interval_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'm' => V_m_0,
 'sList' => V_sList_0,
 'times' => V_times_0,
 'interval' => V_interval_0 }),
    try
         %% K8sUtil.abs:425--425
        put(vars, (get(vars))#{'ctr' => maps:get('times', get(vars))}),
         %% K8sUtil.abs:426--426
        []=(fun Loop ([])->
            case cmp:gt(maps:get('ctr', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:427--427
                T_1 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([<<"----------------------------- TIME "/utf8>>, builtin:toString(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]))]), <<" -----------------------------"/utf8>>])),
                T_1,
                 %% K8sUtil.abs:428--428
                put(vars, (get(vars))#{'tmp1943524982' => cog:create_task(maps:get('m', get(vars)),'m_getNodesStates',[[]],#task_info{method= <<"getNodesStates"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sUtil.abs:428--428
                future:await(maps:get('tmp1943524982', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sUtil.abs:428--428
                put(vars, (get(vars))#{'list' => future:get_blocking(maps:get('tmp1943524982', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sUtil.abs:429--429
                T_2 = (fun() -> case O of
                    null -> throw(dataNullPointerException);
                    Callee=#object{oid=Oid,cog=Cog} ->
                        %% self-call
                        Vars=get(vars),
                        Result=C:'m_printNodesStates'(Callee,maps:get('list', get(vars)),[O,DC,Vars| Stack]),
                        put(vars, Vars),
                        Result;
                    Callee=#object{oid=ObjRef,cog=Cog} ->
                        %% cog-local call
                        V_list = maps:get('list', get(vars)),
                        State=get(this),
                        Vars=get(vars),
                        cog:object_state_changed(Cog, O, State),
                        put(this,cog:get_object_state(Callee#object.cog, Callee)),
                        put(task_info,(get(task_info))#task_info{this=Callee}),
                        T=object:get_class_from_state(get(this)), % it's the callee state already
                        Result=T:'m_printNodesStates'(Callee, V_list,[O,DC,Vars,State| Stack]),
                        cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                        put(task_info,(get(task_info))#task_info{this=O}),
                        put(this, cog:get_object_state(Cog, O)),
                        put(vars, Vars),
                        Result;
                    Callee ->
                        %% remote call
                        TempFuture = cog:create_task(Callee,'m_printNodesStates',[maps:get('list', get(vars)),[]],#task_info{method= <<"printNodesStates"/utf8>>},Cog, true),
                        future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                end end)(),
                T_2,
                 %% K8sUtil.abs:430--432
                put(vars, (get(vars))#{'tmp1753178789' => maps:get('sList', get(vars))}),
                 %% K8sUtil.abs:430--432
                []=(fun Loop ([])->
                    case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1753178789', get(vars)),[O,DC| Stack])) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% K8sUtil.abs:430--432
                        put(vars, (get(vars))#{'s' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1753178789', get(vars)),[O,DC| Stack])}),
                         %% K8sUtil.abs:430--432
                        put(vars, (get(vars))#{'tmp1753178789' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1753178789', get(vars)),[O,DC| Stack])}),
                         %% K8sUtil.abs:431--431
                        T_3 = (fun() -> case O of
                            null -> throw(dataNullPointerException);
                            Callee=#object{oid=Oid,cog=Cog} ->
                                %% self-call
                                Vars=get(vars),
                                Result=C:'m_printServiceStatus'(Callee,maps:get('s', get(vars)),[O,DC,Vars| Stack]),
                                put(vars, Vars),
                                Result;
                            Callee=#object{oid=ObjRef,cog=Cog} ->
                                %% cog-local call
                                V_s = maps:get('s', get(vars)),
                                State=get(this),
                                Vars=get(vars),
                                cog:object_state_changed(Cog, O, State),
                                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                                put(task_info,(get(task_info))#task_info{this=Callee}),
                                T=object:get_class_from_state(get(this)), % it's the callee state already
                                Result=T:'m_printServiceStatus'(Callee, V_s,[O,DC,Vars,State| Stack]),
                                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                                put(task_info,(get(task_info))#task_info{this=O}),
                                put(this, cog:get_object_state(Cog, O)),
                                put(vars, Vars),
                                Result;
                            Callee ->
                                %% remote call
                                TempFuture = cog:create_task(Callee,'m_printServiceStatus',[maps:get('s', get(vars)),[]],#task_info{method= <<"printServiceStatus"/utf8>>},Cog, true),
                                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                        end end)(),
                        T_3,
                    Loop([])  end end)
                ([]),
                 %% K8sUtil.abs:433--433
                T_3 = builtin:println(Cog,<<"------------------------------------------------------------------"/utf8>>),
                T_3,
                 %% K8sUtil.abs:434--434
                T_4 = builtin:println(Cog,<<""/utf8>>),
                T_4,
                 %% K8sUtil.abs:436--436
                put(vars, (get(vars))#{'ctr' := (maps:get('ctr', get(vars)) - 1) }),
                 %% K8sUtil.abs:438--438
                cog:suspend_current_task_for_duration(Cog,maps:get('interval', get(vars)),maps:get('interval', get(vars)),[O,DC| Stack]),
                ok,
            Loop([])  end end)
        ([]),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printStatus and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:442
 %% K8sUtil.abs:442
'm_printMap'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_map_0,V_tFrom_0,V_tTo_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'map' => V_map_0,
 'tFrom' => V_tFrom_0,
 'tTo' => V_tTo_0 }),
    try
         %% K8sUtil.abs:443--443
        T_1 = builtin:println(Cog,iolist_to_binary([m_ABS_StdLib_funs:f_fst(Cog,maps:get('map', get(vars)),[O,DC| Stack]), <<" MAP:"/utf8>>])),
        T_1,
         %% K8sUtil.abs:444--444
        []=(fun Loop ([])->
            case cmp:le(maps:get('tFrom', get(vars)),maps:get('tTo', get(vars))) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:445--445
                put(vars, (get(vars))#{'v' => m_ABS_StdLib_funs:f_lookupDefault(Cog,m_ABS_StdLib_funs:f_snd(Cog,maps:get('map', get(vars)),[O,DC| Stack]),maps:get('tFrom', get(vars)),-1,[O,DC| Stack])}),
                 %% K8sUtil.abs:447--447
                case cmp:ge(maps:get('v', get(vars)),0) of
                    true ->  %% K8sUtil.abs:448--448
                    T_2 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"Time: "/utf8>>, builtin:toString(Cog,maps:get('tFrom', get(vars)))]), <<"  Val: "/utf8>>]), builtin:toString(Cog,maps:get('v', get(vars)))])),
                    T_2;
                    false ->                 ok
                end,
                 %% K8sUtil.abs:451--451
                put(vars, (get(vars))#{'tFrom' := (maps:get('tFrom', get(vars)) + 1) }),
            Loop([])  end end)
        ([]),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printMap and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:455
 %% K8sUtil.abs:455
'm_printMaps'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_maps_0,V_tFrom_0,V_tTo_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'maps' => V_maps_0,
 'tFrom' => V_tFrom_0,
 'tTo' => V_tTo_0 }),
    try
         %% K8sUtil.abs:456--458
        put(vars, (get(vars))#{'tmp2019019549' => maps:get('maps', get(vars))}),
         %% K8sUtil.abs:456--458
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp2019019549', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:456--458
                put(vars, (get(vars))#{'m' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp2019019549', get(vars)),[O,DC| Stack])}),
                 %% K8sUtil.abs:456--458
                put(vars, (get(vars))#{'tmp2019019549' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp2019019549', get(vars)),[O,DC| Stack])}),
                 %% K8sUtil.abs:457--457
                T_1 = (fun() -> case O of
                    null -> throw(dataNullPointerException);
                    Callee=#object{oid=Oid,cog=Cog} ->
                        %% self-call
                        Vars=get(vars),
                        Result=C:'m_printMap'(Callee,maps:get('m', get(vars)),maps:get('tFrom', get(vars)),maps:get('tTo', get(vars)),[O,DC,Vars| Stack]),
                        put(vars, Vars),
                        Result;
                    Callee=#object{oid=ObjRef,cog=Cog} ->
                        %% cog-local call
                        V_map = maps:get('m', get(vars)),
                        V_tFrom = maps:get('tFrom', get(vars)),
                        V_tTo = maps:get('tTo', get(vars)),
                        State=get(this),
                        Vars=get(vars),
                        cog:object_state_changed(Cog, O, State),
                        put(this,cog:get_object_state(Callee#object.cog, Callee)),
                        put(task_info,(get(task_info))#task_info{this=Callee}),
                        T=object:get_class_from_state(get(this)), % it's the callee state already
                        Result=T:'m_printMap'(Callee, V_map, V_tFrom, V_tTo,[O,DC,Vars,State| Stack]),
                        cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                        put(task_info,(get(task_info))#task_info{this=O}),
                        put(this, cog:get_object_state(Cog, O)),
                        put(vars, Vars),
                        Result;
                    Callee ->
                        %% remote call
                        TempFuture = cog:create_task(Callee,'m_printMap',[maps:get('m', get(vars)),maps:get('tFrom', get(vars)),maps:get('tTo', get(vars)),[]],#task_info{method= <<"printMap"/utf8>>},Cog, true),
                        future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                end end)(),
                T_1,
            Loop([])  end end)
        ([]),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method printMaps and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
