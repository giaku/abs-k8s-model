-module(class_K8sMaster_MasterObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Master">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sMaster_MasterObject,'cp'=null,'timeUnitSize'=null,'loadPeriod'=null,'resourceCycle'=null,'costGranularity'=null,'scheduler'=null}).
'init_internal'()->
    #state{}.

 %% K8sMaster.abs:25
'get_val_internal'(#state{'cp'=G},'cp')->
    G;
 %% K8sMaster.abs:25
'get_val_internal'(#state{'timeUnitSize'=G},'timeUnitSize')->
    G;
 %% K8sMaster.abs:25
'get_val_internal'(#state{'loadPeriod'=G},'loadPeriod')->
    G;
 %% K8sMaster.abs:25
'get_val_internal'(#state{'resourceCycle'=G},'resourceCycle')->
    G;
 %% K8sMaster.abs:25
'get_val_internal'(#state{'costGranularity'=G},'costGranularity')->
    G;
 %% K8sMaster.abs:26
'get_val_internal'(#state{'scheduler'=G},'scheduler')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sMaster.abs:25
'set_val_internal'(S,'cp',V)->
    S#state{'cp'=V};
 %% K8sMaster.abs:25
'set_val_internal'(S,'timeUnitSize',V)->
    S#state{'timeUnitSize'=V};
 %% K8sMaster.abs:25
'set_val_internal'(S,'loadPeriod',V)->
    S#state{'loadPeriod'=V};
 %% K8sMaster.abs:25
'set_val_internal'(S,'resourceCycle',V)->
    S#state{'resourceCycle'=V};
 %% K8sMaster.abs:25
'set_val_internal'(S,'costGranularity',V)->
    S#state{'costGranularity'=V};
 %% K8sMaster.abs:26
'set_val_internal'(S,'scheduler',V)->
    S#state{'scheduler'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'cp', S#state.'cp' }
        , { 'timeUnitSize', S#state.'timeUnitSize' }
        , { 'loadPeriod', S#state.'loadPeriod' }
        , { 'resourceCycle', S#state.'resourceCycle' }
        , { 'costGranularity', S#state.'costGranularity' }
        , { 'scheduler', S#state.'scheduler' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_cp,P_timeUnitSize,P_loadPeriod,P_resourceCycle,P_costGranularity,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'cp',P_cp)),
    put(this, C:set_val_internal(get(this),'timeUnitSize',P_timeUnitSize)),
    put(this, C:set_val_internal(get(this),'loadPeriod',P_loadPeriod)),
    put(this, C:set_val_internal(get(this),'resourceCycle',P_resourceCycle)),
    put(this, C:set_val_internal(get(this),'costGranularity',P_costGranularity)),
     %% K8sMaster.abs:26--26
     %% K8sMaster.abs:29--29
    put(this, C:set_val_internal(get(this), 'scheduler',object:new(cog:start(Cog,DC),class_K8sMaster_NodeSchedulerObject,[C:get_val_internal(get(this), 'cp'),C:get_val_internal(get(this), 'loadPeriod'),C:get_val_internal(get(this), 'resourceCycle'),[]],Cog,[O,DC| Stack]))),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sMaster.abs:32
 %% K8sMaster.abs:32
'm_deployService'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_s_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 's' => V_s_0 }),
    try
         %% K8sMaster.abs:33--33
        put(vars, (get(vars))#{'tmp1856885570' => cog:create_task(maps:get('s', get(vars)),'m_deploy',[C:get_val_internal(get(this), 'scheduler'),[]],#task_info{method= <<"deploy"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:33--33
        future:await(maps:get('tmp1856885570', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sMaster.abs:34--34
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method deployService and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:37
 %% K8sMaster.abs:37
'm_getNodesStates'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:38--38
        put(vars, (get(vars))#{'tmp815927219' => cog:create_task(C:get_val_internal(get(this), 'scheduler'),'m_getNodeStates',[[]],#task_info{method= <<"getNodeStates"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:38--38
        future:await(maps:get('tmp815927219', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sMaster.abs:38--38
        put(vars, (get(vars))#{'list' => future:get_blocking(maps:get('tmp815927219', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sMaster.abs:39--39
        maps:get('list', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getNodesStates and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:42
 %% K8sMaster.abs:42
'm_getNodesMap'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:43--43
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sMaster.abs:44--44
        put(vars, (get(vars))#{'tmp888293905' => cog:create_task(C:get_val_internal(get(this), 'scheduler'),'m_getNodes',[[]],#task_info{method= <<"getNodes"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:44--44
        future:await(maps:get('tmp888293905', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sMaster.abs:44--44
        put(vars, (get(vars))#{'nList' => future:get_blocking(maps:get('tmp888293905', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sMaster.abs:46--52
        put(vars, (get(vars))#{'tmp1469899497' => maps:get('nList', get(vars))}),
         %% K8sMaster.abs:46--52
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1469899497', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sMaster.abs:46--52
                put(vars, (get(vars))#{'n' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1469899497', get(vars)),[O,DC| Stack])}),
                 %% K8sMaster.abs:46--52
                put(vars, (get(vars))#{'tmp1469899497' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1469899497', get(vars)),[O,DC| Stack])}),
                 %% K8sMaster.abs:47--47
                put(vars, (get(vars))#{'tmp1064122091' => cog:create_task(maps:get('n', get(vars)),'m_getMonitor',[[]],#task_info{method= <<"getMonitor"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sMaster.abs:47--47
                future:await(maps:get('tmp1064122091', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sMaster.abs:47--47
                put(vars, (get(vars))#{'nMonitor' => future:get_blocking(maps:get('tmp1064122091', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sMaster.abs:48--48
                put(vars, (get(vars))#{'tmp1062913415' => cog:create_task(maps:get('n', get(vars)),'m_getName',[[]],#task_info{method= <<"getName"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sMaster.abs:48--48
                future:await(maps:get('tmp1062913415', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sMaster.abs:48--48
                put(vars, (get(vars))#{'nodeName' => future:get_blocking(maps:get('tmp1062913415', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sMaster.abs:49--49
                put(vars, (get(vars))#{'tmp530942536' => cog:create_task(maps:get('nMonitor', get(vars)),'m_getConsumptionMap',[[]],#task_info{method= <<"getConsumptionMap"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sMaster.abs:49--49
                future:await(maps:get('tmp530942536', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sMaster.abs:49--49
                put(vars, (get(vars))#{'map' => future:get_blocking(maps:get('tmp530942536', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sMaster.abs:51--51
                put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('result', get(vars)),{ dataPair,maps:get('nodeName', get(vars)),maps:get('map', get(vars))},[O,DC| Stack])}),
            Loop([])  end end)
        ([]),
         %% K8sMaster.abs:54--54
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getNodesMap and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:57
 %% K8sMaster.abs:57
'm_createNodes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_nNodes_0,V_cpu_0,V_memory_0,V_baseSystemLoad_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'nNodes' => V_nNodes_0,
 'cpu' => V_cpu_0,
 'memory' => V_memory_0,
 'baseSystemLoad' => V_baseSystemLoad_0 }),
    try
         %% K8sMaster.abs:58--58
        put(vars, (get(vars))#{'tmp958523759' => cog:create_task(C:get_val_internal(get(this), 'scheduler'),'m_createNodes',[maps:get('nNodes', get(vars)),maps:get('cpu', get(vars)),maps:get('memory', get(vars)),C:get_val_internal(get(this), 'timeUnitSize'),maps:get('baseSystemLoad', get(vars)),C:get_val_internal(get(this), 'costGranularity'),[]],#task_info{method= <<"createNodes"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:58--58
        future:await(maps:get('tmp958523759', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sMaster.abs:59--59
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method createNodes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:62
 %% K8sMaster.abs:62
'm_setSchedulerRulesMap'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rulesMap_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rulesMap' => V_rulesMap_0 }),
    try
         %% K8sMaster.abs:63--63
        put(vars, (get(vars))#{'tmp1873631950' => cog:create_task(C:get_val_internal(get(this), 'scheduler'),'m_setRulesMap',[maps:get('rulesMap', get(vars)),[]],#task_info{method= <<"setRulesMap"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:63--63
        future:await(maps:get('tmp1873631950', get(vars)), Cog, [O,DC| Stack]),
        ok,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setSchedulerRulesMap and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
