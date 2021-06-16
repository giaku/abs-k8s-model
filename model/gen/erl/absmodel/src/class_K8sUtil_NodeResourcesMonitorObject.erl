-module(class_K8sUtil_NodeResourcesMonitorObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"NodeResourcesMonitor">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sUtil_NodeResourcesMonitorObject,'cycle'=null,'totalCpu'=null,'totalMemory'=null,'cpu'=null,'memoryChange'=null,'node'=null,'nodeName'=null,'cpuDisplay'=null,'memoryDisplay'=null,'requestedCpu'=null,'consumptionMap'=null}).
'init_internal'()->
    #state{}.

 %% K8sUtil.abs:259
'get_val_internal'(#state{'cycle'=G},'cycle')->
    G;
 %% K8sUtil.abs:259
'get_val_internal'(#state{'totalCpu'=G},'totalCpu')->
    G;
 %% K8sUtil.abs:259
'get_val_internal'(#state{'totalMemory'=G},'totalMemory')->
    G;
 %% K8sUtil.abs:261
'get_val_internal'(#state{'cpu'=G},'cpu')->
    G;
 %% K8sUtil.abs:262
'get_val_internal'(#state{'memoryChange'=G},'memoryChange')->
    G;
 %% K8sUtil.abs:263
'get_val_internal'(#state{'node'=G},'node')->
    G;
 %% K8sUtil.abs:264
'get_val_internal'(#state{'nodeName'=G},'nodeName')->
    G;
 %% K8sUtil.abs:267
'get_val_internal'(#state{'cpuDisplay'=G},'cpuDisplay')->
    G;
 %% K8sUtil.abs:268
'get_val_internal'(#state{'memoryDisplay'=G},'memoryDisplay')->
    G;
 %% K8sUtil.abs:269
'get_val_internal'(#state{'requestedCpu'=G},'requestedCpu')->
    G;
 %% K8sUtil.abs:272
'get_val_internal'(#state{'consumptionMap'=G},'consumptionMap')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sUtil.abs:259
'set_val_internal'(S,'cycle',V)->
    S#state{'cycle'=V};
 %% K8sUtil.abs:259
'set_val_internal'(S,'totalCpu',V)->
    S#state{'totalCpu'=V};
 %% K8sUtil.abs:259
'set_val_internal'(S,'totalMemory',V)->
    S#state{'totalMemory'=V};
 %% K8sUtil.abs:261
'set_val_internal'(S,'cpu',V)->
    S#state{'cpu'=V};
 %% K8sUtil.abs:262
'set_val_internal'(S,'memoryChange',V)->
    S#state{'memoryChange'=V};
 %% K8sUtil.abs:263
'set_val_internal'(S,'node',V)->
    S#state{'node'=V};
 %% K8sUtil.abs:264
'set_val_internal'(S,'nodeName',V)->
    S#state{'nodeName'=V};
 %% K8sUtil.abs:267
'set_val_internal'(S,'cpuDisplay',V)->
    S#state{'cpuDisplay'=V};
 %% K8sUtil.abs:268
'set_val_internal'(S,'memoryDisplay',V)->
    S#state{'memoryDisplay'=V};
 %% K8sUtil.abs:269
'set_val_internal'(S,'requestedCpu',V)->
    S#state{'requestedCpu'=V};
 %% K8sUtil.abs:272
'set_val_internal'(S,'consumptionMap',V)->
    S#state{'consumptionMap'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'cycle', S#state.'cycle' }
        , { 'totalCpu', S#state.'totalCpu' }
        , { 'totalMemory', S#state.'totalMemory' }
        , { 'cpu', S#state.'cpu' }
        , { 'memoryChange', S#state.'memoryChange' }
        , { 'node', S#state.'node' }
        , { 'nodeName', S#state.'nodeName' }
        , { 'cpuDisplay', S#state.'cpuDisplay' }
        , { 'memoryDisplay', S#state.'memoryDisplay' }
        , { 'requestedCpu', S#state.'requestedCpu' }
        , { 'consumptionMap', S#state.'consumptionMap' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_cycle,P_totalCpu,P_totalMemory,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'cycle',P_cycle)),
    put(this, C:set_val_internal(get(this),'totalCpu',P_totalCpu)),
    put(this, C:set_val_internal(get(this),'totalMemory',P_totalMemory)),
     %% K8sUtil.abs:261--261
    put(this, C:set_val_internal(get(this),'cpu',0)),
     %% K8sUtil.abs:262--262
    put(this, C:set_val_internal(get(this),'memoryChange',0)),
     %% K8sUtil.abs:263--263
     %% K8sUtil.abs:264--264
    put(this, C:set_val_internal(get(this),'nodeName',<<""/utf8>>)),
     %% K8sUtil.abs:267--267
    put(this, C:set_val_internal(get(this),'cpuDisplay',0)),
     %% K8sUtil.abs:268--268
    put(this, C:set_val_internal(get(this),'memoryDisplay',0)),
     %% K8sUtil.abs:269--269
    put(this, C:set_val_internal(get(this),'requestedCpu',0)),
     %% K8sUtil.abs:272--272
    put(this, C:set_val_internal(get(this),'consumptionMap',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sUtil.abs:274
 %% K8sUtil.abs:274
'm_cpuConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:275--275
        C:get_val_internal(get(this), 'cpuDisplay')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method cpuConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:278
 %% K8sUtil.abs:278
'm_memoryConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:279--279
        C:get_val_internal(get(this), 'memoryDisplay')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method memoryConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:282
 %% K8sUtil.abs:282
'm_setConsumedCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_value_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'value' => V_value_0 }),
    try
         %% K8sUtil.abs:283--283
        put(this, C:set_val_internal(get(this), 'cpuDisplay',maps:get('value', get(vars)))),
         %% K8sUtil.abs:286--286
        put(vars, (get(vars))#{'time' => builtin:truncate(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]))}),
         %% K8sUtil.abs:287--287
        put(this, C:set_val_internal(get(this), 'consumptionMap',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'consumptionMap'),maps:get('time', get(vars)),maps:get('value', get(vars)),[O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setConsumedCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:290
 %% K8sUtil.abs:290
'm_setConsumedMemory'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_value_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'value' => V_value_0 }),
    try
         %% K8sUtil.abs:291--291
        put(this, C:set_val_internal(get(this), 'memoryDisplay',maps:get('value', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setConsumedMemory and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:294
 %% K8sUtil.abs:294
'm_setRequestedCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_value_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'value' => V_value_0 }),
    try
         %% K8sUtil.abs:295--295
        put(this, C:set_val_internal(get(this), 'requestedCpu',maps:get('value', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setRequestedCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:298
 %% K8sUtil.abs:298
'm_getNodeState'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:299--299
        put(vars, (get(vars))#{'tmp1152281446' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_getPods',[[]],#task_info{method= <<"getPods"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:299--299
        future:await(maps:get('tmp1152281446', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:299--299
        put(vars, (get(vars))#{'pods' => future:get_blocking(maps:get('tmp1152281446', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sUtil.abs:300--300
        put(vars, (get(vars))#{'ns' => { dataNodeState,C:get_val_internal(get(this), 'nodeName'),m_ABS_StdLib_funs:f_length(Cog,maps:get('pods', get(vars)),[O,DC| Stack]),C:get_val_internal(get(this), 'cpuDisplay'),C:get_val_internal(get(this), 'memoryDisplay'),C:get_val_internal(get(this), 'totalCpu'),C:get_val_internal(get(this), 'totalMemory'),C:get_val_internal(get(this), 'requestedCpu')}}),
         %% K8sUtil.abs:302--302
        maps:get('ns', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getNodeState and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:305
 %% K8sUtil.abs:305
'm_setNode'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_n_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'n' => V_n_0 }),
    try
         %% K8sUtil.abs:306--306
        put(this, C:set_val_internal(get(this), 'node',maps:get('n', get(vars)))),
         %% K8sUtil.abs:307--307
        put(vars, (get(vars))#{'tmp1527668063' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_getName',[[]],#task_info{method= <<"getName"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:307--307
        future:await(maps:get('tmp1527668063', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:307--307
        put(this, C:set_val_internal(get(this), 'nodeName',future:get_blocking(maps:get('tmp1527668063', get(vars)), Cog, [O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setNode and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:310
 %% K8sUtil.abs:310
'm_getAverageLoad'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_period_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'period' => V_period_0 }),
    try
         %% K8sUtil.abs:311--311
        put(vars, (get(vars))#{'time' => (builtin:truncate(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack])) - 1) }),
         %% K8sUtil.abs:312--312
        put(vars, (get(vars))#{'ctr' => 0}),
         %% K8sUtil.abs:313--313
        put(vars, (get(vars))#{'result' => 0}),
         %% K8sUtil.abs:315--315
        []=(fun Loop ([])->
            case (cmp:gt(maps:get('time', get(vars)),0)) and (cmp:gt(maps:get('period', get(vars)),0)) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sUtil.abs:316--316
                put(vars, (get(vars))#{'consumption' => m_K8sUtil_funs:f_maybeZero(Cog,m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'consumptionMap'),maps:get('time', get(vars)),[O,DC| Stack]),[O,DC| Stack])}),
                 %% K8sUtil.abs:317--317
                put(vars, (get(vars))#{'result' := ( rationals:add(maps:get('result', get(vars)),maps:get('consumption', get(vars)))) }),
                 %% K8sUtil.abs:319--319
                put(vars, (get(vars))#{'ctr' := (maps:get('ctr', get(vars)) + 1) }),
                 %% K8sUtil.abs:320--320
                put(vars, (get(vars))#{'time' := (maps:get('time', get(vars)) - 1) }),
                 %% K8sUtil.abs:321--321
                put(vars, (get(vars))#{'period' := (maps:get('period', get(vars)) - 1) }),
            Loop([])  end end)
        ([]),
         %% K8sUtil.abs:324--324
        case cmp:gt(maps:get('ctr', get(vars)),0) of
            true ->  %% K8sUtil.abs:325--325
            put(vars, (get(vars))#{'result' :=  rationals:rdiv(maps:get('result', get(vars)),maps:get('ctr', get(vars))) });
            false ->         ok
        end,
         %% K8sUtil.abs:328--328
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getAverageLoad and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:331
 %% K8sUtil.abs:331
'm_getConsumptionMap'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:332--332
        C:get_val_internal(get(this), 'consumptionMap')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getConsumptionMap and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
