-module(class_K8sUtil_ResourcesMonitorObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ResourcesMonitor">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sUtil_ResourcesMonitorObject,'serviceName'=null,'id'=null,'cycle'=null,'cpuRequest'=null,'nodeName'=null,'cpu'=null,'memoryChange'=null,'activeReqChange'=null,'pod'=null,'node'=null,'cpuDisplay'=null,'memoryDisplay'=null,'activeRequests'=null,'cpuConsumptionRatio'=null,'cpuConsumptionMap'=null,'cpuRatioMap'=null,'shutdown'=null}).
'init_internal'()->
    #state{}.

 %% K8sUtil.abs:113
'get_val_internal'(#state{'serviceName'=G},'serviceName')->
    G;
 %% K8sUtil.abs:113
'get_val_internal'(#state{'id'=G},'id')->
    G;
 %% K8sUtil.abs:113
'get_val_internal'(#state{'cycle'=G},'cycle')->
    G;
 %% K8sUtil.abs:113
'get_val_internal'(#state{'cpuRequest'=G},'cpuRequest')->
    G;
 %% K8sUtil.abs:114
'get_val_internal'(#state{'nodeName'=G},'nodeName')->
    G;
 %% K8sUtil.abs:116
'get_val_internal'(#state{'cpu'=G},'cpu')->
    G;
 %% K8sUtil.abs:117
'get_val_internal'(#state{'memoryChange'=G},'memoryChange')->
    G;
 %% K8sUtil.abs:118
'get_val_internal'(#state{'activeReqChange'=G},'activeReqChange')->
    G;
 %% K8sUtil.abs:120
'get_val_internal'(#state{'pod'=G},'pod')->
    G;
 %% K8sUtil.abs:121
'get_val_internal'(#state{'node'=G},'node')->
    G;
 %% K8sUtil.abs:124
'get_val_internal'(#state{'cpuDisplay'=G},'cpuDisplay')->
    G;
 %% K8sUtil.abs:125
'get_val_internal'(#state{'memoryDisplay'=G},'memoryDisplay')->
    G;
 %% K8sUtil.abs:126
'get_val_internal'(#state{'activeRequests'=G},'activeRequests')->
    G;
 %% K8sUtil.abs:128
'get_val_internal'(#state{'cpuConsumptionRatio'=G},'cpuConsumptionRatio')->
    G;
 %% K8sUtil.abs:131
'get_val_internal'(#state{'cpuConsumptionMap'=G},'cpuConsumptionMap')->
    G;
 %% K8sUtil.abs:132
'get_val_internal'(#state{'cpuRatioMap'=G},'cpuRatioMap')->
    G;
 %% K8sUtil.abs:135
'get_val_internal'(#state{'shutdown'=G},'shutdown')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sUtil.abs:113
'set_val_internal'(S,'serviceName',V)->
    S#state{'serviceName'=V};
 %% K8sUtil.abs:113
'set_val_internal'(S,'id',V)->
    S#state{'id'=V};
 %% K8sUtil.abs:113
'set_val_internal'(S,'cycle',V)->
    S#state{'cycle'=V};
 %% K8sUtil.abs:113
'set_val_internal'(S,'cpuRequest',V)->
    S#state{'cpuRequest'=V};
 %% K8sUtil.abs:114
'set_val_internal'(S,'nodeName',V)->
    S#state{'nodeName'=V};
 %% K8sUtil.abs:116
'set_val_internal'(S,'cpu',V)->
    S#state{'cpu'=V};
 %% K8sUtil.abs:117
'set_val_internal'(S,'memoryChange',V)->
    S#state{'memoryChange'=V};
 %% K8sUtil.abs:118
'set_val_internal'(S,'activeReqChange',V)->
    S#state{'activeReqChange'=V};
 %% K8sUtil.abs:120
'set_val_internal'(S,'pod',V)->
    S#state{'pod'=V};
 %% K8sUtil.abs:121
'set_val_internal'(S,'node',V)->
    S#state{'node'=V};
 %% K8sUtil.abs:124
'set_val_internal'(S,'cpuDisplay',V)->
    S#state{'cpuDisplay'=V};
 %% K8sUtil.abs:125
'set_val_internal'(S,'memoryDisplay',V)->
    S#state{'memoryDisplay'=V};
 %% K8sUtil.abs:126
'set_val_internal'(S,'activeRequests',V)->
    S#state{'activeRequests'=V};
 %% K8sUtil.abs:128
'set_val_internal'(S,'cpuConsumptionRatio',V)->
    S#state{'cpuConsumptionRatio'=V};
 %% K8sUtil.abs:131
'set_val_internal'(S,'cpuConsumptionMap',V)->
    S#state{'cpuConsumptionMap'=V};
 %% K8sUtil.abs:132
'set_val_internal'(S,'cpuRatioMap',V)->
    S#state{'cpuRatioMap'=V};
 %% K8sUtil.abs:135
'set_val_internal'(S,'shutdown',V)->
    S#state{'shutdown'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'serviceName', S#state.'serviceName' }
        , { 'id', S#state.'id' }
        , { 'cycle', S#state.'cycle' }
        , { 'cpuRequest', S#state.'cpuRequest' }
        , { 'nodeName', S#state.'nodeName' }
        , { 'cpu', S#state.'cpu' }
        , { 'memoryChange', S#state.'memoryChange' }
        , { 'activeReqChange', S#state.'activeReqChange' }
        , { 'pod', S#state.'pod' }
        , { 'node', S#state.'node' }
        , { 'cpuDisplay', S#state.'cpuDisplay' }
        , { 'memoryDisplay', S#state.'memoryDisplay' }
        , { 'activeRequests', S#state.'activeRequests' }
        , { 'cpuConsumptionRatio', S#state.'cpuConsumptionRatio' }
        , { 'cpuConsumptionMap', S#state.'cpuConsumptionMap' }
        , { 'cpuRatioMap', S#state.'cpuRatioMap' }
        , { 'shutdown', S#state.'shutdown' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_serviceName,P_id,P_cycle,P_cpuRequest,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'serviceName',P_serviceName)),
    put(this, C:set_val_internal(get(this),'id',P_id)),
    put(this, C:set_val_internal(get(this),'cycle',P_cycle)),
    put(this, C:set_val_internal(get(this),'cpuRequest',P_cpuRequest)),
     %% K8sUtil.abs:114--114
    put(this, C:set_val_internal(get(this),'nodeName',<<""/utf8>>)),
     %% K8sUtil.abs:116--116
    put(this, C:set_val_internal(get(this),'cpu',0)),
     %% K8sUtil.abs:117--117
    put(this, C:set_val_internal(get(this),'memoryChange',0)),
     %% K8sUtil.abs:118--118
    put(this, C:set_val_internal(get(this),'activeReqChange',0)),
     %% K8sUtil.abs:120--120
     %% K8sUtil.abs:121--121
    put(this, C:set_val_internal(get(this),'node',null)),
     %% K8sUtil.abs:124--124
    put(this, C:set_val_internal(get(this),'cpuDisplay',0)),
     %% K8sUtil.abs:125--125
    put(this, C:set_val_internal(get(this),'memoryDisplay',0)),
     %% K8sUtil.abs:126--126
    put(this, C:set_val_internal(get(this),'activeRequests',0)),
     %% K8sUtil.abs:128--128
    put(this, C:set_val_internal(get(this),'cpuConsumptionRatio',0)),
     %% K8sUtil.abs:131--131
    put(this, C:set_val_internal(get(this),'cpuConsumptionMap',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
     %% K8sUtil.abs:132--132
    put(this, C:set_val_internal(get(this),'cpuRatioMap',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
     %% K8sUtil.abs:135--135
    put(this, C:set_val_internal(get(this),'shutdown',false)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sUtil.abs:137
 %% K8sUtil.abs:137
'm_setNode'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_n_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'n' => V_n_0 }),
    try
         %% K8sUtil.abs:138--138
        put(this, C:set_val_internal(get(this), 'node',maps:get('n', get(vars)))),
         %% K8sUtil.abs:139--139
        put(vars, (get(vars))#{'tmp944002819' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_getName',[[]],#task_info{method= <<"getName"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sUtil.abs:139--139
        future:await(maps:get('tmp944002819', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sUtil.abs:139--139
        put(this, C:set_val_internal(get(this), 'nodeName',future:get_blocking(maps:get('tmp944002819', get(vars)), Cog, [O,DC| Stack]))),
         %% K8sUtil.abs:140--140
        T_1 = cog:create_task(O,'m_resourcesRefresh',[[]],#task_info{method= <<"resourcesRefresh"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setNode and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:143
 %% K8sUtil.abs:143
'm_resourcesRefresh'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:145--145
        put(vars, (get(vars))#{'time' => (builtin:truncate(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack])) - 1) }),
         %% K8sUtil.abs:148--148
        put(this, C:set_val_internal(get(this), 'cpuConsumptionRatio', rationals:rdiv(C:get_val_internal(get(this), 'cpu'),C:get_val_internal(get(this), 'cpuRequest')) )),
         %% K8sUtil.abs:149--149
        put(this, C:set_val_internal(get(this), 'cpuDisplay',C:get_val_internal(get(this), 'cpu'))),
         %% K8sUtil.abs:156--156
        put(this, C:set_val_internal(get(this), 'cpu',0)),
         %% K8sUtil.abs:159--159
        put(this, C:set_val_internal(get(this), 'memoryDisplay',( rationals:add(C:get_val_internal(get(this), 'memoryDisplay'),C:get_val_internal(get(this), 'memoryChange'))) )),
         %% K8sUtil.abs:160--160
        put(this, C:set_val_internal(get(this), 'memoryChange',0)),
         %% K8sUtil.abs:163--163
        put(this, C:set_val_internal(get(this), 'activeRequests',( rationals:add(C:get_val_internal(get(this), 'activeRequests'),C:get_val_internal(get(this), 'activeReqChange'))) )),
         %% K8sUtil.abs:164--164
        put(this, C:set_val_internal(get(this), 'activeReqChange',0)),
         %% K8sUtil.abs:170--170
        cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'cycle'),C:get_val_internal(get(this), 'cycle'),[O,DC| Stack]),
        ok,
         %% K8sUtil.abs:172--172
        case not (C:get_val_internal(get(this), 'shutdown')) of
            true ->  %% K8sUtil.abs:173--173
            T_1 = cog:create_task(O,'m_resourcesRefresh',[[]],#task_info{method= <<"resourcesRefresh"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
            T_1;
            false ->         ok
        end,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method resourcesRefresh and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:177
 %% K8sUtil.abs:177
'm_cpuConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:179--179
        C:get_val_internal(get(this), 'cpuDisplay')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method cpuConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:182
 %% K8sUtil.abs:182
'm_memoryConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:184--184
        C:get_val_internal(get(this), 'memoryDisplay')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method memoryConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:187
 %% K8sUtil.abs:187
'm_cpuConsumptionRatio'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:188--188
        C:get_val_internal(get(this), 'cpuConsumptionRatio')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method cpuConsumptionRatio and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:191
 %% K8sUtil.abs:191
'm_getActiveRequests'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:192--192
        builtin:truncate(Cog,C:get_val_internal(get(this), 'activeRequests'))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getActiveRequests and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:195
 %% K8sUtil.abs:195
'm_getCpuRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:196--196
        C:get_val_internal(get(this), 'cpuRequest')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getCpuRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:199
 %% K8sUtil.abs:199
'm_consumeCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_value_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'value' => V_value_0 }),
    try
         %% K8sUtil.abs:200--200
        put(this, C:set_val_internal(get(this), 'cpu',( rationals:add(C:get_val_internal(get(this), 'cpu'),maps:get('value', get(vars)))) )),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method consumeCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:203
 %% K8sUtil.abs:203
'm_consumedMemoryUpdate'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_mValue_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'mValue' => V_mValue_0 }),
    try
         %% K8sUtil.abs:205--205
        put(this, C:set_val_internal(get(this), 'memoryChange',( rationals:add(C:get_val_internal(get(this), 'memoryChange'),maps:get('mValue', get(vars)))) )),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method consumedMemoryUpdate and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:208
 %% K8sUtil.abs:208
'm_updateActiveRequests'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_value_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'value' => V_value_0 }),
    try
         %% K8sUtil.abs:209--209
        put(this, C:set_val_internal(get(this), 'activeReqChange',( rationals:add(C:get_val_internal(get(this), 'activeReqChange'),maps:get('value', get(vars)))) )),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method updateActiveRequests and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:212
 %% K8sUtil.abs:212
'm_getPodState'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:214--214
        put(vars, (get(vars))#{'ps' => { dataPodState,C:get_val_internal(get(this), 'serviceName'),C:get_val_internal(get(this), 'id'),C:get_val_internal(get(this), 'nodeName'),C:get_val_internal(get(this), 'cpuDisplay'),C:get_val_internal(get(this), 'memoryDisplay'),C:get_val_internal(get(this), 'cpuConsumptionRatio')}}),
         %% K8sUtil.abs:216--216
        maps:get('ps', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPodState and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:219
 %% K8sUtil.abs:219
'm_getServiceName'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:220--220
        C:get_val_internal(get(this), 'serviceName')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getServiceName and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:223
 %% K8sUtil.abs:223
'm_getNode'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:224--224
        C:get_val_internal(get(this), 'node')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getNode and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:227
 %% K8sUtil.abs:227
'm_setPod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'p' => V_p_0 }),
    try
         %% K8sUtil.abs:228--228
        put(this, C:set_val_internal(get(this), 'pod',maps:get('p', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setPod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sUtil.abs:231
 %% K8sUtil.abs:231
'm_shutdown'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sUtil.abs:232--232
        put(this, C:set_val_internal(get(this), 'shutdown',true)),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method shutdown and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
