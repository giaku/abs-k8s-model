-module(class_K8sService_PodObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Pod">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_PodObject,'serviceName'=null,'id'=null,'compUnitSize'=null,'cpuRequest'=null,'cpuLimit'=null,'monitor'=null,'insufficientMemCooldown'=null,'refCycle'=null,'costGranularity'=null,'executing'=null,'blocked'=null,'node'=null,'cooldown'=null,'availableCpu'=null,'activeRequests'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:92
'get_val_internal'(#state{'serviceName'=G},'serviceName')->
    G;
 %% K8sService.abs:92
'get_val_internal'(#state{'id'=G},'id')->
    G;
 %% K8sService.abs:92
'get_val_internal'(#state{'compUnitSize'=G},'compUnitSize')->
    G;
 %% K8sService.abs:92
'get_val_internal'(#state{'cpuRequest'=G},'cpuRequest')->
    G;
 %% K8sService.abs:92
'get_val_internal'(#state{'cpuLimit'=G},'cpuLimit')->
    G;
 %% K8sService.abs:93
'get_val_internal'(#state{'monitor'=G},'monitor')->
    G;
 %% K8sService.abs:93
'get_val_internal'(#state{'insufficientMemCooldown'=G},'insufficientMemCooldown')->
    G;
 %% K8sService.abs:93
'get_val_internal'(#state{'refCycle'=G},'refCycle')->
    G;
 %% K8sService.abs:93
'get_val_internal'(#state{'costGranularity'=G},'costGranularity')->
    G;
 %% K8sService.abs:94
'get_val_internal'(#state{'executing'=G},'executing')->
    G;
 %% K8sService.abs:95
'get_val_internal'(#state{'blocked'=G},'blocked')->
    G;
 %% K8sService.abs:97
'get_val_internal'(#state{'node'=G},'node')->
    G;
 %% K8sService.abs:100
'get_val_internal'(#state{'cooldown'=G},'cooldown')->
    G;
 %% K8sService.abs:103
'get_val_internal'(#state{'availableCpu'=G},'availableCpu')->
    G;
 %% K8sService.abs:106
'get_val_internal'(#state{'activeRequests'=G},'activeRequests')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:92
'set_val_internal'(S,'serviceName',V)->
    S#state{'serviceName'=V};
 %% K8sService.abs:92
'set_val_internal'(S,'id',V)->
    S#state{'id'=V};
 %% K8sService.abs:92
'set_val_internal'(S,'compUnitSize',V)->
    S#state{'compUnitSize'=V};
 %% K8sService.abs:92
'set_val_internal'(S,'cpuRequest',V)->
    S#state{'cpuRequest'=V};
 %% K8sService.abs:92
'set_val_internal'(S,'cpuLimit',V)->
    S#state{'cpuLimit'=V};
 %% K8sService.abs:93
'set_val_internal'(S,'monitor',V)->
    S#state{'monitor'=V};
 %% K8sService.abs:93
'set_val_internal'(S,'insufficientMemCooldown',V)->
    S#state{'insufficientMemCooldown'=V};
 %% K8sService.abs:93
'set_val_internal'(S,'refCycle',V)->
    S#state{'refCycle'=V};
 %% K8sService.abs:93
'set_val_internal'(S,'costGranularity',V)->
    S#state{'costGranularity'=V};
 %% K8sService.abs:94
'set_val_internal'(S,'executing',V)->
    S#state{'executing'=V};
 %% K8sService.abs:95
'set_val_internal'(S,'blocked',V)->
    S#state{'blocked'=V};
 %% K8sService.abs:97
'set_val_internal'(S,'node',V)->
    S#state{'node'=V};
 %% K8sService.abs:100
'set_val_internal'(S,'cooldown',V)->
    S#state{'cooldown'=V};
 %% K8sService.abs:103
'set_val_internal'(S,'availableCpu',V)->
    S#state{'availableCpu'=V};
 %% K8sService.abs:106
'set_val_internal'(S,'activeRequests',V)->
    S#state{'activeRequests'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'serviceName', S#state.'serviceName' }
        , { 'id', S#state.'id' }
        , { 'compUnitSize', S#state.'compUnitSize' }
        , { 'cpuRequest', S#state.'cpuRequest' }
        , { 'cpuLimit', S#state.'cpuLimit' }
        , { 'monitor', S#state.'monitor' }
        , { 'insufficientMemCooldown', S#state.'insufficientMemCooldown' }
        , { 'refCycle', S#state.'refCycle' }
        , { 'costGranularity', S#state.'costGranularity' }
        , { 'executing', S#state.'executing' }
        , { 'blocked', S#state.'blocked' }
        , { 'node', S#state.'node' }
        , { 'cooldown', S#state.'cooldown' }
        , { 'availableCpu', S#state.'availableCpu' }
        , { 'activeRequests', S#state.'activeRequests' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_serviceName,P_id,P_compUnitSize,P_cpuRequest,P_cpuLimit,P_monitor,P_insufficientMemCooldown,P_refCycle,P_costGranularity,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'serviceName',P_serviceName)),
    put(this, C:set_val_internal(get(this),'id',P_id)),
    put(this, C:set_val_internal(get(this),'compUnitSize',P_compUnitSize)),
    put(this, C:set_val_internal(get(this),'cpuRequest',P_cpuRequest)),
    put(this, C:set_val_internal(get(this),'cpuLimit',P_cpuLimit)),
    put(this, C:set_val_internal(get(this),'monitor',P_monitor)),
    put(this, C:set_val_internal(get(this),'insufficientMemCooldown',P_insufficientMemCooldown)),
    put(this, C:set_val_internal(get(this),'refCycle',P_refCycle)),
    put(this, C:set_val_internal(get(this),'costGranularity',P_costGranularity)),
     %% K8sService.abs:94--94
    put(this, C:set_val_internal(get(this),'executing',false)),
     %% K8sService.abs:95--95
    put(this, C:set_val_internal(get(this),'blocked',false)),
     %% K8sService.abs:97--97
    put(this, C:set_val_internal(get(this),'node',null)),
     %% K8sService.abs:100--100
    put(this, C:set_val_internal(get(this),'cooldown',0)),
     %% K8sService.abs:103--103
    put(this, C:set_val_internal(get(this),'availableCpu',0)),
     %% K8sService.abs:106--106
    put(this, C:set_val_internal(get(this),'activeRequests',0)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:108
 %% K8sService.abs:108
'm_setNode'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_n_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'n' => V_n_0 }),
    try
         %% K8sService.abs:109--109
        put(this, C:set_val_internal(get(this), 'node',maps:get('n', get(vars)))),
         %% K8sService.abs:110--110
        T_1 = cog:create_task(O,'m_refreshAvailableCpu',[[]],#task_info{method= <<"refreshAvailableCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setNode and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:113
 %% K8sService.abs:113
'm_refreshAvailableCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:116--116
        put(this, C:set_val_internal(get(this), 'availableCpu',C:get_val_internal(get(this), 'cpuLimit'))),
         %% K8sService.abs:117--117
        put(this, C:set_val_internal(get(this), 'blocked',false)),
         %% K8sService.abs:119--119
        cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'refCycle'),C:get_val_internal(get(this), 'refCycle'),[O,DC| Stack]),
        ok,
         %% K8sService.abs:120--120
        T_1 = cog:create_task(O,'m_refreshAvailableCpu',[[]],#task_info{method= <<"refreshAvailableCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method refreshAvailableCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:124
 %% K8sService.abs:124
'm_processRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_request_0,V_started_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'request' => V_request_0,
 'started' => V_started_0 }),
    try
         %% K8sService.abs:125--125
        put(this, C:set_val_internal(get(this), 'activeRequests',(C:get_val_internal(get(this), 'activeRequests') + 1) )),
         %% K8sService.abs:127--127
        put(vars, (get(vars))#{'totalTime' => 0}),
         %% K8sService.abs:129--129
        put(vars, (get(vars))#{'remainingRequests' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('request', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:130--130
        put(vars, (get(vars))#{'tmp1449969327' => cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_updateActiveRequests',[maps:get('remainingRequests', get(vars)),[]],#task_info{method= <<"updateActiveRequests"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:130--130
        future:await(maps:get('tmp1449969327', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:132--132
        put(vars, (get(vars))#{'cost' => m_K8sUtil_funs:f_requestCost(Cog,maps:get('request', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:133--133
        put(vars, (get(vars))#{'requiredMemory' => m_K8sUtil_funs:f_memory(Cog,maps:get('request', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:135--135
        put(vars, (get(vars))#{'computationStep' => ( rationals:mul( rationals:rdiv(maps:get('cost', get(vars)),C:get_val_internal(get(this), 'costGranularity')) ,C:get_val_internal(get(this), 'compUnitSize'))) }),
         %% K8sService.abs:136--136
        case cmp:lt(maps:get('computationStep', get(vars)),1) of
            true ->  %% K8sService.abs:137--137
            put(vars, (get(vars))#{'computationStep' := 1});
            false ->         ok
        end,
         %% K8sService.abs:140--140
        put(vars, (get(vars))#{'requestsPerCostUnit' =>  rationals:rdiv(m_K8sUtil_funs:f_batchSize(Cog,maps:get('request', get(vars)),[O,DC| Stack]),m_K8sUtil_funs:f_requestCost(Cog,maps:get('request', get(vars)),[O,DC| Stack])) }),
         %% K8sService.abs:142--142
        put(vars, (get(vars))#{'tmp225500139' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_getTimeFraction',[[]],#task_info{method= <<"getTimeFraction"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:142--142
        future:await(maps:get('tmp225500139', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:142--142
        put(vars, (get(vars))#{'fraction' => future:get_blocking(maps:get('tmp225500139', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:143--143
        put(vars, (get(vars))#{'started' := { dataTime,( rationals:add(m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]),maps:get('fraction', get(vars)))) }}),
         %% K8sService.abs:145--145
        T_1 = (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_allocateMemory'(Callee,maps:get('requiredMemory', get(vars)),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_requiredMemory = maps:get('requiredMemory', get(vars)),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_allocateMemory'(Callee, V_requiredMemory,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_allocateMemory',[maps:get('requiredMemory', get(vars)),[]],#task_info{method= <<"allocateMemory"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)(),
        T_1,
         %% K8sService.abs:146--146
        T_2 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_consumedMemoryUpdate',[maps:get('requiredMemory', get(vars)),[]],#task_info{method= <<"consumedMemoryUpdate"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_2,
         %% K8sService.abs:149--149
        []=(fun Loop ([])->
            case cmp:gt(maps:get('cost', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:151--151
                cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                (fun Poll ([])->
                    receive {check, OState} -> 
                        put(this, OState),
                            try
                                case not (C:get_val_internal(get(this), 'executing')) of
                                    true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                    false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                end
                            catch
                                _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                            end;
                        wait -> Poll([]);
                        {token, OState} -> put(this, OState), ok;
                        {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                            Poll([]);
                        {get_references, Sender} ->
                            cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                            Poll([])
                        end end)
                    ([]),
                     %% K8sService.abs:152--152
                    put(this, C:set_val_internal(get(this), 'executing',true)),
                     %% K8sService.abs:154--154
                    case cmp:gt(maps:get('cost', get(vars)),maps:get('computationStep', get(vars))) of
                        true ->  %% K8sService.abs:155--155
                        cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                        (fun Poll ([])->
                            receive {check, OState} -> 
                                put(this, OState),
                                    try
                                        case cmp:gt(C:get_val_internal(get(this), 'availableCpu'),0) of
                                            true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                            false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                        end
                                    catch
                                        _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                    end;
                                wait -> Poll([]);
                                {token, OState} -> put(this, OState), ok;
                                {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                    Poll([]);
                                {get_references, Sender} ->
                                    cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                    Poll([])
                                end end)
                            ([]),
                             %% K8sService.abs:156--156
                            put(vars, (get(vars))#{'tmp2140101943' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_consumeCpu',[maps:get('computationStep', get(vars)),O,m_K8sUtil_funs:f_cpuSysLoadPerCostUnit(Cog,maps:get('request', get(vars)),[O,DC| Stack]),[]],#task_info{method= <<"consumeCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                             %% K8sService.abs:156--156
                            future:await(maps:get('tmp2140101943', get(vars)), Cog, [O,DC| Stack]),
                            ok,
                             %% K8sService.abs:156--156
                            put(vars, (get(vars))#{'timeUnitFraction' => future:get_blocking(maps:get('tmp2140101943', get(vars)), Cog, [O,DC| Stack])}),
                             %% K8sService.abs:159--159
                            cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                            (fun Poll ([])->
                                receive {check, OState} -> 
                                    put(this, OState),
                                        try
                                            case not (C:get_val_internal(get(this), 'blocked')) of
                                                true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                                false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                            end
                                        catch
                                            _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                        end;
                                    wait -> Poll([]);
                                    {token, OState} -> put(this, OState), ok;
                                    {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                        Poll([]);
                                    {get_references, Sender} ->
                                        cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                        Poll([])
                                    end end)
                                ([]),
                                 %% K8sService.abs:161--161
                                put(this, C:set_val_internal(get(this), 'availableCpu',( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),maps:get('computationStep', get(vars)))) )),
                                 %% K8sService.abs:162--162
                                T_3 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_consumeCpu',[maps:get('computationStep', get(vars)),[]],#task_info{method= <<"consumeCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                                T_3,
                                 %% K8sService.abs:164--164
                                put(vars, (get(vars))#{'cost' := ( rationals:sub(maps:get('cost', get(vars)),maps:get('computationStep', get(vars)))) }),
                                 %% K8sService.abs:166--166
                                put(vars, (get(vars))#{'processedRequests' => ( rationals:mul(maps:get('requestsPerCostUnit', get(vars)),maps:get('computationStep', get(vars)))) }),
                                 %% K8sService.abs:167--167
                                put(vars, (get(vars))#{'remainingRequests' := ( rationals:sub(maps:get('remainingRequests', get(vars)),maps:get('processedRequests', get(vars)))) }),
                                 %% K8sService.abs:168--168
                                T_4 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_updateActiveRequests',[rationals:neg( maps:get('processedRequests', get(vars))),[]],#task_info{method= <<"updateActiveRequests"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                                T_4,
                                 %% K8sService.abs:170--170
                                put(vars, (get(vars))#{'totalTime' := ( rationals:add(maps:get('totalTime', get(vars)),( rationals:mul(( rationals:add(m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]),maps:get('timeUnitFraction', get(vars)))) ,maps:get('processedRequests', get(vars)))) )) });
                                false ->                      %% K8sService.abs:174--174
                    case cmp:gt(maps:get('cost', get(vars)),0) of
                        true ->  %% K8sService.abs:176--176
                        cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                        (fun Poll ([])->
                            receive {check, OState} -> 
                                put(this, OState),
                                    try
                                        case cmp:gt(C:get_val_internal(get(this), 'availableCpu'),0) of
                                            true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                            false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                        end
                                    catch
                                        _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                    end;
                                wait -> Poll([]);
                                {token, OState} -> put(this, OState), ok;
                                {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                    Poll([]);
                                {get_references, Sender} ->
                                    cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                    Poll([])
                                end end)
                            ([]),
                             %% K8sService.abs:177--177
                            put(vars, (get(vars))#{'tmp261935590' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_consumeCpu',[maps:get('cost', get(vars)),O,m_K8sUtil_funs:f_cpuSysLoadPerCostUnit(Cog,maps:get('request', get(vars)),[O,DC| Stack]),[]],#task_info{method= <<"consumeCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                             %% K8sService.abs:177--177
                            future:await(maps:get('tmp261935590', get(vars)), Cog, [O,DC| Stack]),
                            ok,
                             %% K8sService.abs:177--177
                            put(vars, (get(vars))#{'timeUnitFraction' => future:get_blocking(maps:get('tmp261935590', get(vars)), Cog, [O,DC| Stack])}),
                             %% K8sService.abs:178--178
                            cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                            (fun Poll ([])->
                                receive {check, OState} -> 
                                    put(this, OState),
                                        try
                                            case not (C:get_val_internal(get(this), 'blocked')) of
                                                true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                                false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                            end
                                        catch
                                            _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                        end;
                                    wait -> Poll([]);
                                    {token, OState} -> put(this, OState), ok;
                                    {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                        Poll([]);
                                    {get_references, Sender} ->
                                        cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                        Poll([])
                                    end end)
                                ([]),
                                 %% K8sService.abs:180--180
                                put(this, C:set_val_internal(get(this), 'availableCpu',( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),maps:get('cost', get(vars)))) )),
                                 %% K8sService.abs:181--181
                                T_3 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_consumeCpu',[maps:get('cost', get(vars)),[]],#task_info{method= <<"consumeCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                                T_3,
                                 %% K8sService.abs:183--183
                                T_4 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_updateActiveRequests',[rationals:neg( maps:get('remainingRequests', get(vars))),[]],#task_info{method= <<"updateActiveRequests"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                                T_4,
                                 %% K8sService.abs:185--185
                                put(vars, (get(vars))#{'totalTime' := ( rationals:add(maps:get('totalTime', get(vars)),( rationals:mul(( rationals:add(m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]),maps:get('timeUnitFraction', get(vars)))) ,maps:get('remainingRequests', get(vars)))) )) }),
                                 %% K8sService.abs:187--187
                                put(vars, (get(vars))#{'cost' := 0});
                                false ->                     ok
                            end
                            end,
                             %% K8sService.abs:191--191
                            put(this, C:set_val_internal(get(this), 'executing',false)),
                             %% K8sService.abs:193--193
                            cog:suspend_current_task_for_duration(Cog, rationals:rdiv(1,100000) , rationals:rdiv(1,100000) ,[O,DC| Stack]),
                            ok,
                        Loop([])  end end)
                    ([]),
                     %% K8sService.abs:196--196
                    T_3 = (fun() -> case O of
                        null -> throw(dataNullPointerException);
                        Callee=#object{oid=Oid,cog=Cog} ->
                            %% self-call
                            Vars=get(vars),
                            Result=C:'m_releaseMemory'(Callee,maps:get('requiredMemory', get(vars)),[O,DC,Vars| Stack]),
                            put(vars, Vars),
                            Result;
                        Callee=#object{oid=ObjRef,cog=Cog} ->
                            %% cog-local call
                            V_amount = maps:get('requiredMemory', get(vars)),
                            State=get(this),
                            Vars=get(vars),
                            cog:object_state_changed(Cog, O, State),
                            put(this,cog:get_object_state(Callee#object.cog, Callee)),
                            put(task_info,(get(task_info))#task_info{this=Callee}),
                            T=object:get_class_from_state(get(this)), % it's the callee state already
                            Result=T:'m_releaseMemory'(Callee, V_amount,[O,DC,Vars,State| Stack]),
                            cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                            put(task_info,(get(task_info))#task_info{this=O}),
                            put(this, cog:get_object_state(Cog, O)),
                            put(vars, Vars),
                            Result;
                        Callee ->
                            %% remote call
                            TempFuture = cog:create_task(Callee,'m_releaseMemory',[maps:get('requiredMemory', get(vars)),[]],#task_info{method= <<"releaseMemory"/utf8>>},Cog, true),
                            future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                    end end)(),
                    T_3,
                     %% K8sService.abs:197--197
                    T_4 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_consumedMemoryUpdate',[rationals:neg( maps:get('requiredMemory', get(vars))),[]],#task_info{method= <<"consumedMemoryUpdate"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                    T_4,
                     %% K8sService.abs:199--199
                    put(vars, (get(vars))#{'averageTimeSpent' => m_ABS_StdLib_funs:f_timeDifference(Cog,{ dataTime, rationals:rdiv(maps:get('totalTime', get(vars)),m_K8sUtil_funs:f_batchSize(Cog,maps:get('request', get(vars)),[O,DC| Stack])) },maps:get('started', get(vars)),[O,DC| Stack])}),
                     %% K8sService.abs:203--203
                    put(this, C:set_val_internal(get(this), 'activeRequests',(C:get_val_internal(get(this), 'activeRequests') - 1) )),
                     %% K8sService.abs:204--204
                    maps:get('averageTimeSpent', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method processRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:207
             %% K8sService.abs:207
            'm_setBlocked'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O }),
                try
                     %% K8sService.abs:208--208
                    put(this, C:set_val_internal(get(this), 'blocked',true)),
                    dataUnit
                    
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method setBlocked and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:212
             %% K8sService.abs:212
            'm_allocateMemory'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_requiredMemory_0,Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O,
 'requiredMemory' => V_requiredMemory_0 }),
                try
                     %% K8sService.abs:213--213
                    put(vars, (get(vars))#{'memoryAllocated' => false}),
                     %% K8sService.abs:214--214
                    put(vars, (get(vars))#{'givenMemory' => 0}),
                     %% K8sService.abs:216--216
                    []=(fun Loop ([])->
                        case not (maps:get('memoryAllocated', get(vars))) of
                        false -> [];
                        true -> receive
                                {stop_world, CogRef} ->
                                    cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                    cog:task_is_runnable(Cog,self()),
                                    task:wait_for_token(Cog,[O,DC| Stack])
                                after 0 -> ok
                            end,
                             %% K8sService.abs:217--217
                            put(vars, (get(vars))#{'givenMemory' := (fun() -> case O of
                                null -> throw(dataNullPointerException);
                                Callee=#object{oid=Oid,cog=Cog} ->
                                    %% self-call
                                    Vars=get(vars),
                                    Result=C:'m_decrementMemory'(Callee,maps:get('requiredMemory', get(vars)),[O,DC,Vars| Stack]),
                                    put(vars, Vars),
                                    Result;
                                Callee=#object{oid=ObjRef,cog=Cog} ->
                                    %% cog-local call
                                    V_amount = maps:get('requiredMemory', get(vars)),
                                    State=get(this),
                                    Vars=get(vars),
                                    cog:object_state_changed(Cog, O, State),
                                    put(this,cog:get_object_state(Callee#object.cog, Callee)),
                                    put(task_info,(get(task_info))#task_info{this=Callee}),
                                    T=object:get_class_from_state(get(this)), % it's the callee state already
                                    Result=T:'m_decrementMemory'(Callee, V_amount,[O,DC,Vars,State| Stack]),
                                    cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                                    put(task_info,(get(task_info))#task_info{this=O}),
                                    put(this, cog:get_object_state(Cog, O)),
                                    put(vars, Vars),
                                    Result;
                                Callee ->
                                    %% remote call
                                    TempFuture = cog:create_task(Callee,'m_decrementMemory',[maps:get('requiredMemory', get(vars)),[]],#task_info{method= <<"decrementMemory"/utf8>>},Cog, true),
                                    future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                            end end)()}),
                             %% K8sService.abs:218--218
                            case cmp:gt(maps:get('givenMemory', get(vars)),0) of
                                true ->  %% K8sService.abs:219--219
                                put(vars, (get(vars))#{'memoryAllocated' := true});
                                false ->                              %% K8sService.abs:221--221
                            cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'insufficientMemCooldown'),C:get_val_internal(get(this), 'insufficientMemCooldown'),[O,DC| Stack]),
                            ok
                            end,
                        Loop([])  end end)
                    ([]),
                     %% K8sService.abs:226--226
                    maps:get('givenMemory', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method allocateMemory and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:229
             %% K8sService.abs:229
            'm_decrementMemory'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O,
 'amount' => V_amount_0 }),
                try
                     %% K8sService.abs:230--230
                    put(vars, (get(vars))#{'tmp1073035012' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_allocateMemory',[maps:get('amount', get(vars)),[]],#task_info{method= <<"allocateMemory"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                     %% K8sService.abs:230--230
                    future:await(maps:get('tmp1073035012', get(vars)), Cog, [O,DC| Stack]),
                    ok,
                     %% K8sService.abs:230--230
                    put(vars, (get(vars))#{'mem' => future:get_blocking(maps:get('tmp1073035012', get(vars)), Cog, [O,DC| Stack])}),
                     %% K8sService.abs:231--231
                    maps:get('mem', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method decrementMemory and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:234
             %% K8sService.abs:234
            'm_releaseMemory'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O,
 'amount' => V_amount_0 }),
                try
                     %% K8sService.abs:235--235
                    put(vars, (get(vars))#{'tmp886119570' => cog:create_task(C:get_val_internal(get(this), 'node'),'m_releaseMemory',[maps:get('amount', get(vars)),[]],#task_info{method= <<"releaseMemory"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                     %% K8sService.abs:235--235
                    future:await(maps:get('tmp886119570', get(vars)), Cog, [O,DC| Stack]),
                    ok,
                     %% K8sService.abs:235--235
                    put(vars, (get(vars))#{'v' => future:get_blocking(maps:get('tmp886119570', get(vars)), Cog, [O,DC| Stack])}),
                     %% K8sService.abs:236--236
                    maps:get('v', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method releaseMemory and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:239
             %% K8sService.abs:239
            'm_getCpuConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O }),
                try
                     %% K8sService.abs:240--240
                    put(vars, (get(vars))#{'tmp833784282' => cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_cpuConsumption',[[]],#task_info{method= <<"cpuConsumption"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                     %% K8sService.abs:240--240
                    future:await(maps:get('tmp833784282', get(vars)), Cog, [O,DC| Stack]),
                    ok,
                     %% K8sService.abs:240--240
                    put(vars, (get(vars))#{'value' => future:get_blocking(maps:get('tmp833784282', get(vars)), Cog, [O,DC| Stack])}),
                     %% K8sService.abs:241--241
                    maps:get('value', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method getCpuConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:244
             %% K8sService.abs:244
            'm_getMemoryConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O }),
                try
                     %% K8sService.abs:245--245
                    put(vars, (get(vars))#{'tmp1481141739' => cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_memoryConsumption',[[]],#task_info{method= <<"memoryConsumption"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                     %% K8sService.abs:245--245
                    future:await(maps:get('tmp1481141739', get(vars)), Cog, [O,DC| Stack]),
                    ok,
                     %% K8sService.abs:245--245
                    put(vars, (get(vars))#{'value' => future:get_blocking(maps:get('tmp1481141739', get(vars)), Cog, [O,DC| Stack])}),
                     %% K8sService.abs:246--246
                    maps:get('value', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method getMemoryConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:249
             %% K8sService.abs:249
            'm_getMonitor'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O }),
                try
                     %% K8sService.abs:250--250
                    C:get_val_internal(get(this), 'monitor')
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method getMonitor and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sService.abs:253
             %% K8sService.abs:253
            'm_isIdle'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O }),
                try
                     %% K8sService.abs:254--254
                    cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                    (fun Poll ([])->
                        receive {check, OState} -> 
                            put(this, OState),
                                try
                                    case cmp:eq(C:get_val_internal(get(this), 'activeRequests'),0) of
                                        true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                        false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                    end
                                catch
                                    _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                end;
                            wait -> Poll([]);
                            {token, OState} -> put(this, OState), ok;
                            {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                Poll([]);
                            {get_references, Sender} ->
                                cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                Poll([])
                            end end)
                        ([]),
                         %% K8sService.abs:255--255
                        true
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method isIdle and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
                 %% K8sService.abs:258
                 %% K8sService.abs:258
                'm_getActiveRequests'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                    C=(get(this))#state.class,
                    put(vars, #{ 'this' => O }),
                    try
                         %% K8sService.abs:258--258
                        C:get_val_internal(get(this), 'activeRequests')
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method getActiveRequests and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
                 %% K8sService.abs:259
                 %% K8sService.abs:259
                'm_getDC'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                    C=(get(this))#state.class,
                    put(vars, #{ 'this' => O }),
                    try
                         %% K8sService.abs:259--259
                        builtin:thisDC(Cog)
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method getDC and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
                 %% K8sService.abs:260
                 %% K8sService.abs:260
                'm_getServiceName'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                    C=(get(this))#state.class,
                    put(vars, #{ 'this' => O }),
                    try
                         %% K8sService.abs:260--260
                        C:get_val_internal(get(this), 'serviceName')
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method getServiceName and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
                 %% K8sService.abs:261
                 %% K8sService.abs:261
                'm_getID'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                    C=(get(this))#state.class,
                    put(vars, #{ 'this' => O }),
                    try
                         %% K8sService.abs:261--261
                        C:get_val_internal(get(this), 'id')
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method getID and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
                 %% K8sService.abs:262
                 %% K8sService.abs:262
                'm_getNode'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                    C=(get(this))#state.class,
                    put(vars, #{ 'this' => O }),
                    try
                         %% K8sService.abs:262--262
                        C:get_val_internal(get(this), 'node')
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method getNode and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
